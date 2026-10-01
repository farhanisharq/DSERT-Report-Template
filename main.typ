#import "style.typ": style
#show: style

// DOCUMENT START

#include "sections/title.typ"


// START ROMAN PAGE NUMBERING
#set page(numbering: "i")
#counter(page).update(1)
#set heading(numbering: none)


#include "sections/abstract.typ"
#pagebreak()

#outline()
#pagebreak()

// #outline(target: figure.where(kind: table), title: [List of Tables])
// #pagebreak()

#outline(target: figure.where(kind: image), title: [List of Figures])
#pagebreak()

#include "sections/acknowledgements.typ"
#pagebreak()


// START MAIN CONTENT
// RETURN TO ARABIC PAGE NUMBERING
#set page(numbering: "1")
#counter(page).update(1)

// START HEADER NUMBERING
#import "@preview/numbly:0.1.0": numbly
#set heading(
  numbering: numbly(
    "{1} ",
    "{1}.{2} ",
  ),
)

// UNCOMMENT THIS FOR LINE NUMBERING
// #set par.line(numbering: "1")

#include "sections/introduction.typ"
#pagebreak()

#include "sections/methods.typ"
#pagebreak()

// ADD MORE SECTIONS AS YOU REQUIRE

#bibliography("ref.bib")
