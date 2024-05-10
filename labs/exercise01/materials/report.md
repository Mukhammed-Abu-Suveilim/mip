---
title: "Фигуры Лиссажу"
subtitle: "Моделирование в xcos"
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

- Приобретение навыков математического моделирования в xcos.

# Задание

Построить с помощью xcos фигуры Лиссажу с различными значениями параметров.

# Теоретическое введение

Лиссажу фигуры, замк­ну­тые пло­ские кри­вые, опи­сы­вае­мые точ­кой, дви­же­ние ко­то­рой яв­ля­ет­ся су­пер­по­зи­ци­ей двух вза­им­но пер­пен­ди­ку­ляр­ных ко­ле­ба­ний с от­но­ше­ни­ем час­тот, рав­ным ра­цио­наль­но­му чис­лу. Впер­вые бы­ли под­роб­но изу­че­ны франц. ма­те­ма­ти­ком Ж. А. Лис­са­жу в 1857–58. Л. ф. опи­сы­ва­ют­ся сис­те­мой па­ра­мет­рических урав­не­ний (па­ра­метр – вре­мя t)

$x = A_{1}\cos{\omega_{1}t+\phi}$, $y = A_{2}\cos{\omega_{2}t+\phi}$
[@article]

# Выполнение лабораторной работы

1. Во-первых, я открыл scilab.
2. Далее, я открыл, через инструменты, Визуальное моделирование Xcos.

   ![Scilab](./images/s11.png){#fig:001 width=70%}

3. В Xcos я добавыл регистратор CSCOPXY, два источника сигналов и воздействия GENSEN_f и CLOCK_c. Ниже на рис. 1 показано как это выглядит:

   ![Схема модели в Xcos](./images/s8.png){#fig:002 width=70%}

4. Получнный график это прямая:

   ![График прямой](./images/s1.png){#fig:003 width=70%}

5. Если изменить параметры второго источника GENSEN_f так:
   
   ![Параметры второго источника GENSEN_f](./images/s2.png){#fig:004 width=70%}

6. Получаем следующей график:

   ![График прямой в обратную сторону](./images/s2-1.png){#fig:005 width=70%}

7. Давайте создадим эллипс/овал используя следующие параметры второго источника GENSEN_f:

   ![Параметры второго источника GENSEN_f](./images/s3.png){#fig:006 width=70%}

8. Получаем следующей график:

   ![График эллипса](./images/s3-1.png){#fig:007 width=70%}

9. Если менять параметры двух источников GENSEN_f таким способом:

   ![Параметры первого источника GENSEN_f](./images/s9-0-2.png){#fig:008 width=70%}
   
   ![Параметры второго источника GENSEN_f](./images/s9-0-1.png){#fig:009 width=70%}

10. Получаем следующей график:
   
   ![График при $\frac{\pi}{2}$ и соотношении $4:2$](./images/s9.png){#fig:010 width=70%}

11. A если менять параметры двух источников GENSEN_f таким способом:

   ![Параметры первого источника GENSEN_f](./images/s10-1.png){#fig:011 width=70%}
   
   ![Параметры второго источника GENSEN_f](./images/s10-2.png){#fig:012 width=70%}

12. Получаем следующей график:

   ![График при $\frac{\pi}{2}$ и соотношении $3:2$](./images/s10.png){#fig:013 width=70%}

# Вывод

- Изучали как работать с Xcos. [@book]

# Библиография

::: {#refs}
:::