#let theme_colors = (
  // main: cmyk(10%, 100%, 100%, 1%),
  red_1: rgb("#9F2D20"), // for dividers and headlines
  gray_1: rgb("#A8ADB4"),
  aqua_1: rgb("#A7C5BD"),
  brown_1: rgb("#76767C"),
  brown_2: rgb("#BDBDBD"),
)

#set page(
  paper: "presentation-16-9",
  margin: (
    left: 0em,
    right: 0em,
  ),
  header: [
    // #rect(fill: red, width: 100%, height: 100%)
    #grid(
      columns: (1fr, auto),
      rows: 1,
      align: horizon,
      gutter: 0.5em,
      line(
        stroke: (
          paint: theme_colors.red_1,
          thickness: 1pt,
        ),
        length: 100%,
      ),
      image("/icons/g1.svg", height: 50%),
    )
  ],
  footer: context [
    // #rect(fill: red, width: 100%, height: 100%)
    #line(
      stroke: (
        paint: theme_colors.red_1,
        thickness: 2pt,
      ),
      length: 100%,
    )
    #align(right)[
      #pad(right: 1em)[
        #set text(
          theme_colors.gray_1,
          size: 14pt,
        )
        #counter(page).display(
          "1/1",
          both: true,
        )
      ]
    ]
  ],
  number-align: bottom + right,
  numbering: "1/1",
)

#set text(
  font: "Open Sans",
  size: 18pt,
)

#show heading: set text(
  theme_colors.red_1,
  size: 28pt,
)

#show heading: set block(below: 0.85em)

#set par(
  justify: true,
  spacing: 1.5em,
)

#show raw.where(block: true): it => {
  block(
    fill: luma(240), // Light gray background
    inset: 10pt, // Padding
    // radius: 4pt,         // Rounded corners
    width: 100%,
    // stroke: 1pt + luma(200),
    align(start, it),
  )
}

#let slide_front_page() = [
  #set page(
    header: none,
    footer: none,
    margin: (
      top: 7.5em,
      bottom: 2em,
      left: 0em,
      right: 0em,
    ),
    background: [
      #image(
        "pres-assets/background/old_fixed.png",
      )
    ],
  )

  #rect(fill: white, width: 100%, height: 100%)[
    #pad(x: 0em, y: 0.5em)[
      #align(horizon + center)[
        #show heading: set block(below: 0em)

        Выпускная квалификационная работа

        = Очень хорошее название выпускной квалификационной работы
      ]

      #align(bottom)[
        #pad(x: 1em, y: 0em)[
          #set text(size: 16pt, theme_colors.brown_1)

          Автор:\
          Пупкин Иван Иванович, 24.М02-пу

          Научный руководитель:\
          Павлов Павел Павлович, доктор физ.-мат. наук, профессор
        ]
      ]
    ]
  ]
]

#let slide_basic(
  title: "Headline",
  body,
) = {
  pad(x: 1em, y: 0em)[
    = #title

    #body
  ]
}

#let slide_two_column(
  title: "Headline",
  left_col_content: [],
  right_col_content: [],
) = {
  pad(x: 1em, y: 0em)[
    = #title

    #columns(2)[
      #left_col_content
      #colbreak()
      #right_col_content
    ]
  ]
}

#slide_front_page()

#pagebreak()

#slide_basic(title: "Введение")[
  Это стандартный слайд, в котором контент занимает всю разрешенную ширину.
  Конечно, лучше иметь меньше текста, и больше картинок.
  Этот шаблон покажет настроенные возможности для создания презентации.

  Что может быть полезным для презентации:
  - Показывать картинки и схемы
  - Показывать листинги кода
  - Показывать таблицы

  Далее я покажу стандартные шаблоны слайдов, которые могут быть полезны для таких ситуаций
]

#pagebreak()

#slide_basic(title: "Показываем таблицы")[
  Это стандартный слайд, в котором контент занимает всю разрешенную ширину.

  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.5pt + theme_colors.brown_1,
    align: (center, center, center),
    inset: 1em,
    table.header([*Характеристика*], [*Кошечка*], [*Собачка*]),
    [Кушает], [Много], [Очень много],
    [Спит], [Много], [Умеренно],
    [Надо мыть], [Редко], [Часто],
    [Надо гулять], [Никогда], [Часто],
  )
]

#pagebreak()

#slide_basic(
  title: "Пишем код",
)[
  Ситуация, аналогичная тексту в ВКР.

  #figure(
    caption: [Код],
  )[
    ```python
    def fib(n):
      if n <= 1:
        return n
      else:
        return fib(n - 1) + fib(n - 2)
    print(fib(25))
    ```
  ]
]

#pagebreak()

#slide_two_column(
  title: "Две колонки (с figure)",
  left_col_content: [
    Это слайд, который имеет 2 колонки.
    Ширина между ними поделена одинаково (пока что)

    Почему вам стоит завести котенка?
    - Он милый
    - Он красивый
    - Много кушает
    - Очень пушистый
    - Смышленый!
  ],
  right_col_content: [
    #figure(
      caption: [Милый котенок],
    )[
      #image("images/lil_cat.jpg", height: 90%)
    ]
  ],
)

#pagebreak()

#slide_two_column(
  title: "Две колонки (с текстом)",
  left_col_content: [
    #lorem(50)
  ],
  right_col_content: [
    #lorem(50)
  ],
)
