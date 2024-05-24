---
title: "Лабораторная работа 10"
subtitle: "Задача об обедающих мудрецах"
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

Приобретение навыков моделирования в CPN tools.

# Задание

Требуется:
   
Решить задачу об обедающих мудрецах и вычислите пространство состояний в среде CPN tools.

# Постановка задачи

Пять мудрецов сидят за круглым столом и могут пребывать в двух состояниях - думать и есть. Между соседями лежит одна палочка для еды. Для приёма пищи необходимы две палочки. Палочки - пересекающийся ресурс. Необходимо синхронизировать процесс еды так, чтобы мудрецы не умерли с голода.

# Выполнение лабораторной работы

## Реализация модели в CPN tools

1. Рисуем граф сети. Для этого с помощью контекстного меню создаём новую сеть, добавляем позиции, переходы и дуги:


  ![Граф сети задачи об обедающих мудрецах](./images/model_scheme_initial_state_01.png){#fig:001 width=50%}

Начальные данные:
- позиции: мудрец размышляет (philosopher thinks), мудрец ест (philosopher eats),
палочки находятся на столе (sticks on the table)
- переходы: взять палочки (take sticks), положить палочки (put sticks)

2. В меню задаём новые декларации модели: типы фишек, начальные значения
позиций, выражения для дуг:
- n — число мудрецов и палочек (n = 5);
- p — фишки, обозначающие мудрецов, имеют перечисляемый тип PH от 1 до n;
- s — фишки, обозначающие палочки, имеют перечисляемый тип ST от 1 до n;
- функция ChangeS(p) ставит в соответствие мудрецам палочки (возвращает номера палочек, используемых мудрецами); по условию задачи мудрецы сидят по кругу и мудрец p(i) может взять i и i + 1 палочки, поэтому функция ChangeS(p) определяется следующим образом:

   ```
    fun ChangeS (ph(i))=
    1`st(i)++st(if = n then 1 else i+1)
   ```

  ![Задание деклараций задачи об обедающих мудрецах](./images/model_decl_01.png){#fig:002 width=50%}

3. В результате получаем работающую модель (рис. 3).

  ![Граф сети задачи об обедающих мудрецах](./images/model_scheme_ave_val_state_01.png){#fig:003 width=50%}

4. После запуска модели наблюдаем, что одновременно палочками могут воспользоваться только два из пяти мудрецов (рис. 4):

 ![Граф сети задачи об обедающих мудрецах 2](./images/model_scheme_max_val_state_01.png){#fig:004 width=50%}


5. Для анализа пространтсва состояний построенной модели используется панель пространства состояний (State Space). Сначала необходимо сформировать код пространства состояний. Для этого используется инструмент «вычислить пространство состояний» Calculate Space State, применённый к листу, содержащему страницу модели.


  ![Пространство состояний для модели «Накорми студентов»](./images/model_scheme_state_stages_01.png){#fig:005 width=50%}
   
6. Вычисленное пространство состояний сохраняется во временных файлах CPN Tools. Его можно сохранить в отдельный файл, воспользовавшись инструментом «сохранить отчёт» (Save Report).

  ![Отчёт»](./images/model_report_01.png){#fig:006 width=50%}


# Вывод

- Изучали как работать с CPN tools. [@book]

# Библиография

::: {#refs}
:::