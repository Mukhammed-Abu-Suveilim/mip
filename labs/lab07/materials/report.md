---
title: "Лабораторная работа 7"
subtitle: "Модель M | M | 1 |"
author: "Абу Сувейлим Мухаммед Мунифович"
lang: ru-RU
toc-title: "Содержание"
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl
toc: true
toc-depth: 2
lof: true
lot: false
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
polyglossia-lang:
  name: russian
  options:
    - spelling=modern
    - babelshorthands=true
polyglossia-otherlangs:
  name: english
babel-lang: russian
babel-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float}
  - \floatplacement{figure}{H}
---


# Цель работы

- Приобретение навыков моделирования в Xcos.

# Задание

Требуется:
   
   Реализовать модель $M | M | 1 | \infty$ в Xcos.

# Теоретическое введение

Система массового обслуживания (СМО) - система, предназначенная для многократно повторяющегося (многоразового) использования при решении однотипных задач. [@CMO]


# Выполнение лабораторной работы

## Реализация модели в xcos

1. В меню Моделирование, Задать переменные окружения зададим значения коэффициентов a, b, c, d (рис. 1):


   ![Задать переменные окружения в xcos для модели](./images/setup_constants_01.png){#fig:001 width=50%}


2. Суперблок, моделирующий поступление заявок, представлен на рис. 2:

   ![Суперблок, моделирующий поступление заявок](./images/model_xcos_01_superblock_01.png){#fig:002 width=50%}

3. Суперблок, моделирующий процесс обработки заявок, представлен на рис. 3:

   ![Суперблок, моделирующий процесс обработки заявок](./images/model_xcos_01_superblock_02.png){#fig:003 width=50%}
   

4. В меню Моделирование, Установка необходимо задать конечное время интегрирования, равным времени моделирования: 30.

5. Схема  модели $M | M | 1 | \infty$ в Xcos рис. 4:

   ![Схема  модели $M | M | 1 | \infty$](./images/model_scheme_xcos_01.png){#fig:004 width=50%}
   
6. Результат моделирования представлен на рис. 5 и 6:

   ![Поступление (черный  —) и обработка (зеленый  —) заявок](./images/graph_model_xcos_01.png){#fig:005 width=50%}

   ![Динамика размера очереди](./images/graph_model_xcos_02.png){#fig:006 width=50%}


# Вывод

- Изучали как работать с xcos. Также, научились как строит суперблоки в xcos.
[@book]

# Библиография

::: {#refs}
:::