add_subdirectory(another)
add_subdirectory(another2)
mm_texify(
    SOURCES Number.Theory.GAI
    ARCHIVE number.theory-7s-galochkin
    INCLUDE
        lecture01.tex
        lecture02.tex
        lecture03.tex
        lecture04.tex
        lecture05.tex
        lecture06.tex
        lecture07.tex
        lecture08.tex
        lecture09.tex
        lecture10.tex
        lecture11.tex
        lecture12.tex
        lecture13.tex
        lecture14.tex
        lecture15.tex
        0401.eps
        0402.eps
        0403.eps
        05012.eps
        05013.eps
        05021.eps
        05022.eps
        05024.eps

    PROGRAM xelatex
)
