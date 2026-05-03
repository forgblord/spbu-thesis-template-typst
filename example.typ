#import "titlepage.typ": title_page
#import "main-content.typ": configure_content, uheading

#set page(
  paper: "a4",
  margin: (
    top: 2cm,
    bottom: 2cm,
    left: 3cm,
    right: 1.5cm,
  ),
  numbering: "1",
)

#set text(
  size: 14pt,
  font: "Times New Roman",
  lang: "ru",
)

#title_page(
  author_name: (
    first_name: "Павел",
    last_name: "Павлов",
    patronymic: "Павлович",
  ),
  thesis_title: "Пишем свою выпускную квалификационную работу в Typst!",
  education_level: "магистратура",
  field_of_study: (
    code: "00.00.00",
    name: "Очень сложное направление",
  ),
  program_name: (
    code: "ПИ.0000.1900",
    name: "Непростая образовательная программа",
  ),
  supervisor_person: (
    position: "профессор",
    dept: "кафедра умных наук",
    degree: "доктор физ.-мат. наук",
    name: "Пупкин Иван Иванович",
  ),
  reviewer_person: (
    position: "очень крутая позиция",
    dept: "АОА Завод высокоточных деталей",
    name: "Олегов Олег Олегович",
  ),
  year: "2026",
)

#pagebreak()

// Apply content-related styling
#show: configure_content

// Apply styling for block code snippets
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

#show figure.caption: set text(size: 12pt)

#show outline.entry: set block(above: 1.2em)
#outline(
  indent: 1em,
  title: [Содержание],
)

#show table: set text(size: 12pt)

#show raw: set text(font: "Consolas")

#pagebreak()

#uheading[Введение]

Используя самописную функцию `uheading`, можно добавлять главы, в которых не нужна нумерация!
К таким главам относятся:

#set list(
  spacing: 1em,
  // indent: 2.5cm-1em,
  indent: 1.25cm,
  marker: ([•], [◦], [▪]),
)

#show list: it => {
  set list(indent: 1.25cm)
  it
}

#set enum(
  full: true,
  spacing: 1em,
  // indent: 2.5cm-1em,
  indent: 1.25cm,
)

#show enum: it => {
  set enum(indent: 1.25cm)
  it
}

- "Введение"
- "Обзор литературы"
- "Заключение"
- "Выводы"
- "Список использованных источников"

#pagebreak()

= Название главы

#lorem(20)

== Название параграфа (превью текста)

#lorem(50)

#lorem(50)

== Вставляем код

Для того, чтобы вставлять картинки или листинги кода, можно воспользоваться функцией `figure`.

#figure(
  caption: [Функция для подсчета чисел фиббоначи],
)[
  ```python
  def fib(n):
    if n <= 1:
      return n
    else:
      return fib(n - 1) + fib(n - 2)
  print(fib(25))
  ```
] <hello_world>

Чтобы сослаться на листинг, необходимо к фигуре добавить ссылку, используя `<ref_name>` синтаксис.
Ссылка на @hello_world выполняется с использованием следующего синтаксиса: `@ref_name`.

== Вставляем картинки

Аналогичная ситуация будет и с картинками:

#figure(
  caption: [Милый котенок. Он ничего не знает про ВКР],
)[
  #image("images/lil_cat.jpg", height: 20%)
] <cute_cat>

Также мы можем и ссылаться на картинки.
Например, это котик Рыжик (@cute_cat), и он ничего не смыслит в ВКР.
Оно ему и не надо --- ведь он котенок!

== Вставляем таблицы

Для размещения таблиц все будет аналогично предыдущим примерам.
Только теперь мы будем использовать функцию `table`:

#figure(
  caption: [Котята-близнецы из нашей выборки],
)[
  #table(
    columns: (auto, 1fr, 1fr),
    inset: 10pt,
    align: horizon,
    table.header([], [*Котенок*], [*Вес*]),
    image("/images/lil_cat.jpg", height: 20%), [Рыжик], [200 грамм],
    image("/images/lil_cat.jpg", height: 20%), [Коржик], [300 грамм],
  )
] <some_table>

== Списки

Списки бывают нумерованные и ненумерованные.
_Ненумерованные_ списки выглядят так:

- Уровень 1
  - Уровень 2
    - Уровень 3

_Пронумерованные списки_ выглядят так:

+ Уровень 1
  + Уровень 2
    + Уровень 3

Пока что я не знаю, как сделать так, чтобы для последующих уровней не было таких больших отступов.
Да и в целом не знаю, какие отступы должны быть.

== Цитирования

Для составления списка источников используется ГОСТ 7.0.5.2008.
Как я понимаю, Typst его содержит.
Генерирование списка источников делается с помощью функции `bibliography`.
Туда подается `bib`-файл а также специфизируется стиль библиографии при помощи параметра `style`.

*Важно*!
Цитирования без ссылок в списке не обозначаются!

Пример цитирования книги --- @book_example.
Пример цитирования статьи --- @article_example.
Пример цитирования онлайн-источника --- @web_example.

Цитирование нескольких источников происходит аналогично: подряд перечисляются референсы на соответствующие источники без каких-либо разделителей.
Таким образом, @article_example @web_example.

#pagebreak()

= Больше я не знаю, что еще надо

#lorem(20)

== Какой-то параграф

#lorem(100)

== Какой-то параграф

#lorem(100)

#pagebreak()

#bibliography(
  "sources.bib",
  style: "gost-r-705-2008-numeric",
)
