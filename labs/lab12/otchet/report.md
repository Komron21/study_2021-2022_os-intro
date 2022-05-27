---
## Front matter
title: "Отчёт лабораторной работы №12"
subtitle: "Программирование в командном процессоре OC UNIX. Расширенное программирование"
author: "Баротов Комрон НБИ-01"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Изучить основы программирования в оболочке ОС UNIX. Научиться писать более
сложные командные файлы с использованием логических управляющих конструкций
и циклов.




# Выполнение лабораторной работы

1. Скрипт 1 (рис. 1 [-@fig:001])

![Скрит 1](images/1.png){ #fig:001 width=70% }

1. Запуск 1 (рис. 1.1 [-@fig:001])

![Запуск 1](images/1.1.png){ #fig:001 width=70% }

2. Скрипт 2 (рис. 2 [-@fig:002])

![Скрит 2](images/2.png){ #fig:001 width=70% }

2. Запуск 2 (рис. 2.2 [-@fig:002])

![Запуск 2](images/2.2.png){ #fig:001 width=70% }

3. Скрипт 3 (рис. 3 [-@fig:003])

![Скрит 3](images/3.png){ #fig:001 width=70% }

3. Запуск 3 (рис. 3.3 [-@fig:003])

![Запуск 3](images/3.3.png){ #fig:001 width=70% }

# Выводы

В данной работе мы научились писать более сложные командные файлы с использованием логических управляющих конструкций
и циклов.

