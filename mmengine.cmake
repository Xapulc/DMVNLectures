# A part of MMLectures build infrastructure
# Common texify/packing macro definitions
#
# Please make a review of changes that can break it
#
# Author and maintainer: Mikhail Veltishchev <dichlofos-mv@yandex.ru>

# Code style
# --------------------------------------------------------------------
# Local variables: lower_case_with_underscore_at_end_
# Macro calls: PEP8-style: one argument at line if many

macro(mm_picture)
    set (pic_name_ "${ARGV0}")
    set (tex_name_ "${ARGV1}")
    set (target_ "${ARGV2}")

    get_filename_component(pic_name_we_ ${pic_name_} NAME_WE)
    if (${pic_name_we_} STREQUAL ${pic_name_})
        # fallback
        set(pic_name_we_ ${pic_name_})
        set(pic_name_ "${pic_name_}.mp")
    endif()

    add_custom_command(
        OUTPUT "generated/${pic_name_}.done"
        COMMAND "${RUN_MPOST}" "${pic_name_}.done" "${pic_name_}" ${MPOST} ${MPOST_OPTS}
        DEPENDS "${pic_name_}"
    )
    add_custom_target("MetaPosing ${pic_name_} for ${tex_name_}" ALL DEPENDS "generated/${pic_name_}.done")
    add_dependencies("${target_}" "MetaPosing ${pic_name_} for ${tex_name_}")
    set (AUX_CLEAN_FILES
        "${AUX_CLEAN_FILES}"
        "generated"
    )
endmacro()

macro(mm_filter)
    string(REPLACE "[" "-" output_ "${ARGV1}")
    string(REPLACE "]" "-" output_ ${output_})
    string(REPLACE " " "-" output_ ${output_})
    set (${ARGV0} "${output_}")
endmacro()

macro(mm_texify)
    set (args_ ${ARGN})
    set (sources_)
    set (pictures_)
    set (include_)
    set (archive_)
    set (program_)

    set (mode_ "begin")
    foreach (arg_ IN LISTS args_)
        if (arg_ STREQUAL "SOURCES")
            set(mode_ "sources")
        elseif (arg_ STREQUAL "PICTURES")
            set(mode_ "pictures")
        elseif (arg_ STREQUAL "INCLUDE")
            set(mode_ "include")
        elseif (arg_ STREQUAL "ARCHIVE")
            set(mode_ "archive")
        elseif (arg_ STREQUAL "PROGRAM")
            set(mode_ "program")
        # check mode arguments
        elseif (mode_ STREQUAL "sources")
            set (sources_ ${sources_} ${arg_})
        elseif (mode_ STREQUAL "pictures")
            set (pictures_ ${pictures_} ${arg_})
        elseif (mode_ STREQUAL "include")
            set (include_ ${include_} ${arg_})
        elseif (mode_ STREQUAL "archive")
            set (archive_ ${arg_})
        elseif (mode_ STREQUAL "program")
            set (program_ ${arg_})
        endif()
    endforeach()

    if (NOT archive_)
        message(FATAL_ERROR "ARCHIVE section is not set at ${CMAKE_CURRENT_SOURCE_DIR}: ${archive_}")
    endif()

    if (NOT program_)
        set(program_ "${LATEX}")
    endif()

    add_custom_command(
        OUTPUT "generated/symlink.done"
        COMMAND "${RUN_SYMLINK}" ${include_}
        DEPENDS ${include_}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )

    mm_filter(filtered_sources_ ${sources_})

    if (NOT program_ STREQUAL "xelatex")
        # default TeX -> DVI -> PS mode
        add_custom_command(
            OUTPUT "generated/${sources_}.dvi"
            COMMAND "${RUN_LATEX}" "${sources_}.tex" ${program_} ${LATEX_OPTS}
            DEPENDS "${sources_}.tex" "generated/symlink.done" ${include_}
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
        add_custom_command(
            OUTPUT "generated/${sources_}.ps"
            COMMAND "${RUN_DVIPS}" ${DVIPS} "${sources_}.dvi"
            DEPENDS "generated/${sources_}.dvi"
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
        add_custom_target("Make-${filtered_sources_}.dvi" ALL DEPENDS "generated/${sources_}.dvi")
        add_custom_target("Make-${filtered_sources_}.ps" ALL DEPENDS "generated/${sources_}.ps")

        mm_pack(
            INCLUDE "generated/${sources_}.ps"
            ARCHIVE ${archive_}
        )

        add_custom_command(
            OUTPUT "generated/${sources_}.pdf"
            COMMAND "${RUN_LATEX}" "${sources_}.tex" ${PDF_LATEX} ${PDFLATEX_OPTS}
            DEPENDS "${sources_}.tex"
        )
        set (pic_dep_ "dvi")
    else()
        # xelatex mode writes directly to PDF by default
        add_custom_command(
            OUTPUT "generated/${sources_}.pdf"
            COMMAND "${RUN_LATEX}" "${sources_}.tex" ${program_} ${LATEX_OPTS}
            DEPENDS "${sources_}.tex" "generated/symlink.done" ${include_}
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
        set (pic_dep_ "pdf")
    endif()
    add_custom_target("Make-${filtered_sources_}.pdf" ALL DEPENDS "generated/${archive_}.pdf")

    foreach (picture_ ${pictures_})
        mm_picture("${picture_}" "${sources_}" "Make-${filtered_sources_}.${pic_dep_}")
    endforeach()


    add_custom_command(
        OUTPUT "generated/${archive_}.pdf"
        COMMAND cp "generated/${sources_}.pdf" "generated/${archive_}.pdf"
        DEPENDS "generated/${sources_}.pdf"
    )

    mm_filter(filtered_archive_ ${archive_})
    add_custom_target("Make-${filtered_archive_}.pdf" ALL DEPENDS "generated/${archive_}.pdf")

    set_directory_properties(PROPERTIES
        ADDITIONAL_MAKE_CLEAN_FILES "generated"
    )

endmacro()


macro(mm_pack)
    set (args_ ${ARGN})
    set (include_)
    set (archive_)

    set (mode_ "begin")
    foreach (arg_ IN LISTS args_)
        if (arg_ STREQUAL "INCLUDE")
            set(mode_ "include")
        elseif (arg_ STREQUAL "ARCHIVE")
            set(mode_ "archive")
        # check mode arguments
        elseif (mode_ STREQUAL "include")
            set (include_ ${include_} ${arg_})
        elseif (mode_ STREQUAL "archive")
            set (archive_ ${arg_})
        endif()
    endforeach()

    set (archive_full_ "${archive_}.7z")
    add_custom_command(
        OUTPUT "generated/${archive_full_}"
        COMMAND "${RUN_ARCHIVER}" ${ARCHIVER} ${ARCHIVER_OPTS} "generated/${archive_full_}" ${include_}
        DEPENDS ${include_}
    )
    add_custom_target("Make-${archive_full_}" ALL DEPENDS "generated/${archive_full_}")
endmacro()


macro(mmToDo)
    string(REPLACE "${CMAKE_SOURCE_DIR}/" "" relative_source_dir_ "${CMAKE_CURRENT_SOURCE_DIR}")
    message(STATUS "TODO: ${ARGV0} at ${relative_source_dir_}")
endmacro()
