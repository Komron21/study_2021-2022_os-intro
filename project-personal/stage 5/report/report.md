---
## Front matter
title: "Отчёт по индивидуальному проекту"
subtitle: "Индивидуальный проект №5"
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

Добавление к сайту остальные элементы. Сделать запись для персональных проектов. Сделать пост по прошедшей недели. 

# Выполнение лабораторной работы

1. Написать о персональном проекте (рис. 1 )

![Редактирование шаблона ](images/1.png){ #fig:001 width=70% }

2. Написать пост о прошедшей недели (рис. 2 )

![Пост о прошедшей недели](images/2.png){ #fig:001 width=70% }

3. Написать пост по теме языки научного программирования (рис. 3 )

![Языки научного программирования](images/3.png){ #fig:001 width=70% }


# Выводы

В этом этапе мы добавили к нашему сайту остальные элементы. 

# Список литературы{.unnumbered}

::: {#refs}
:::
