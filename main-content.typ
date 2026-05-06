// =====
// THIS IS CONFIG FILE FOR THE CONTENTS OF YOUR THESIS
// =====
#let configure_content(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 2cm,
      bottom: 2cm,
      left: 3cm,
      right: 1.5cm,
    ),
    numbering: "1",
    footer-descent: 0em,
  )

  set text(
    size: 14pt,
    font: "Times New Roman",
    lang: "ru",
  )

  set par(
    justify: true,
    leading: 1em,
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

  // Apply styling for block code snippets
  show raw.where(block: true): it => {
    block(
      // fill: luma(240), // Light gray background
      inset: 10pt, // Padding
      // radius: 4pt,         // Rounded corners
      width: 100%,
      stroke: 0.25pt + black,
      align(start, it),
    )
  }

  show figure.caption: set text(size: 12pt)

  show outline.entry: set block(above: 1.2em)

  show table: set text(size: 12pt)

  show raw: set text(font: "Consolas")

  set list(
    spacing: 1em,
    // indent: 2.5cm-1em,
    indent: 1.25cm,
    marker: ([•], [◦], [▪]),
  )

  show list: it => {
    set list(indent: 1.25cm)
    it
  }

  set enum(
    full: true,
    spacing: 1em,
    // indent: 2.5cm-1em,
    indent: 1.25cm,
  )

  show enum: it => {
    set enum(indent: 1.25cm)
    it
  }

  body
}

#let uheading = body => heading(numbering: none)[#body]
