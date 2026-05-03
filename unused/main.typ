// Original file defining main content layout
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

#set par(
  justify: true,
  leading: 0.5em,
  first-line-indent: (amount: 1.25cm, all: true),
  spacing: 1em,
)

#set text(
  size: 14pt,
  font: "Times New Roman",
)

#show heading: set text(font: "Arial")
#show heading: set block(above: 2em, below: 1em)
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)
#show heading.where(level: 3): set text(size: 14pt)

#show heading.where(level: 1): set heading(numbering: "Глава 1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show heading.where(level: 3): set heading(numbering: "1.1.1.")

#let uheading = body => heading(numbering: none)[#body]

#show outline: it => {
  show heading.where(level: 1): set heading(numbering: none)
  it
}

#show bibliography: it => {
  show heading.where(level: 1): set heading(numbering: none)
  it
}

// Contents start here

#title[Название статьи]

#outline(title: "Содержание")

#uheading[Введение]

#lorem(100)

#lorem(100)

= Название главы

#lorem(100)

= Название главы

Hello world!
wack.

== Название параграфа

#lorem(100)

== Название параграфа

#lorem(100)

=== Название пипона

#lorem(100)

=== Название пипона

#lorem(100)

== Название параграфа

#lorem(100)

// #bibliography(
// "bibliography.bib",
//   title: "Список использованных источников",
// )
