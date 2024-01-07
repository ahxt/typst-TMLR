// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!

#let tiny = 5pt
#let scriptsize = 7pt
#let footnotesize = 8pt
#let small = 9pt
#let normalsize = 10pt
#let large = 12pt
#let Large = 14.4pt
#let LARGE = 17.28pt
#let huge = 20.74pt
#let Huge = 24.88pt


#let tmlr(
  title: "",
  abstract: [],
  authors: (),
  body,
  type: "accepted",
  month: "05",
  year: "2023",
  bibliography-file: none,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  
  set page(paper: "us-letter", 
  numbering: "1", 
  number-align: center,

  header-ascent: 14pt,
  header: locate(loc => {
      set text(size: normalsize)
      let header_text = "Published in Transactions on Machine Learning Research"
      
      if type == "preprint" {
        header_text = "Preprint"
      }
      if type == "accepted" {
        header_text = "Published in Transactions on Machine Learning Research"
      }
      if type == "submission" {
        header_text = "Under review as submission to TMLR"
      }
      
      grid(
        columns: (1fr),
        align(left, header_text),
        v(4pt),
        line(length: 100%, stroke: 0.6pt)
      )
  }),

    // On the first page, the footer should contain the page number.
    footer-descent: 12pt,
    footer: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 {
        align(center, text(size: scriptsize, [#i]))
      }
    })
)
  
  set text(font: "New Computer Modern", lang: "en")
  
  show math.equation: set text(weight: 400)
  
  set heading(numbering: "1.1 ")
  show heading: it => {
    // Create the heading numbering.
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      h(7pt, weak: true)
    }

    // Level 1 headings are centered and smallcaps.
    // The other ones are run-in.
    set text(size: large, weight: 1000, font: "New Computer Modern Sans")

    set align(left)
    smallcaps[
        #v(24pt, weak: true)
        #number
        #it.body
        #v(large, weak: true)
      ]
  }

  // Configure citation and bibliography styles.
  set bibliography(style: "icml.csl", title: "References")
  // institute-of-electrical-and-electronics-engineers
  // springer-basic  
  // alphanumeric
  // icml.csl

  // Title row.
  v(30pt)
  align(left)[
    #block(text(weight: 1000, size: LARGE, font: "New Computer Modern Sans", title))
    #v(1em, weak: true)
  ]
  v(35pt, weak: true)

  
  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.8em,
    // x: 2em,
    grid(
      columns: (1fr),
      gutter: 2em,
      ..authors.map(author => align(left)[
        *#author.name* #h(1fr) #emph(author.email) \
       #emph(author.affiliation)
      ]),
    ),
  )

  // Main body.
  set par(justify: true)

  align(center, text(size: large, font: "New Computer Modern Sans", weight: 1000, [Abstract]))
  // align(center)[
  //   #heading(outlined: false, numbering: none,  text(1.2em, [Abstract]))
  // ]

  pad(
    top: 0.1em,
    bottom: 0.8em,
    x: 3em,
    y: 3em,
    abstract
  )
  

  body


  // Display the bibliography, if any is given.
  if bibliography-file != none {
    // show bibliography: set text(8.5pt)
    // show bibliography: pad.with(x: 0.5pt)
    bibliography(bibliography-file)
  }
  
}