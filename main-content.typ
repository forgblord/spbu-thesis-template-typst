// This file configures layout for the main content
#let configure_content(body) = {
  set par(
    justify: true,
    leading: 0.5em,
    first-line-indent: (amount: 1.25cm, all: true),
    spacing: 1em,
  )

  show heading: set text(font: "Arial")
  show heading: set block(above: 2em, below: 1em)
  show heading: set align(center)
  show heading.where(level: 1): set text(size: 18pt)
  show heading.where(level: 2): set text(size: 16pt)
  show heading.where(level: 3): set text(size: 14pt)

  show heading.where(level: 1): set heading(numbering: "Глава 1.")
  show heading.where(level: 2): set heading(numbering: "1.1.")
  show heading.where(level: 3): set heading(numbering: "1.1.1.")


  show outline: it => {
    show heading.where(level: 1): set heading(numbering: none)
    it
  }

  show bibliography: it => {
    show heading.where(level: 1): set heading(numbering: none)
    it
  }

  body
}

#let uheading = body => heading(numbering: none)[#body]
