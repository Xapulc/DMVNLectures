@echo off

latex lect01.tex
dvips lect01.dvi

latex lect02.tex
dvips lect02.dvi

latex lect03.tex
dvips lect03.dvi

latex lect04.tex
dvips lect04.dvi

latex lect05.tex
dvips lect05.dvi

rem latex lect06.tex
rem dvips lect06.dvi

rem latex lect07.tex
rem dvips lect07.dvi

latex lect08.tex
dvips lect08.dvi

latex lect09.tex
dvips lect09.dvi

latex lect10.tex
dvips lect10.dvi

wt "pde-radkevich.rar" lect01.ps lect02.ps lect03.ps lect04.ps lect05.ps lect08.ps lect09.ps lect10.ps
