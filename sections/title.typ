// TITLE PAGE
// PROJECT DETAILS
#let project-title = [Your Project Title]
#let project-subtitle = [Project subtitle]
#let author = [Your name]
#let year = [2026]

#let uni-name = [The University #text("of", style: "oblique") Edinburgh]
#let degree-name = [MSc in High Performance Computing with Data Science]


#import "../style.typ": pink, font-pairing

// PAGE START
#set page(
  header: context {
    if counter(page).get().first() == 1 {
      place(top + center, rect(fill: pink, width: 100% + 5cm, height: 0.3em))
    }
  },
)


// LOGOS & ICONS
#grid(
  columns: (18%, 1fr, 18%),
  align: center + horizon,
  image("../assets/logo_epcc.png"), [], image("../assets/crest_rb-eps-converted-to.pdf"),
)


#place(
    horizon,
    {
      show title: set text(size: 1.4em)
      set par(justify: false)

      title[]

      show title: set text(font: font-pairing.title, pink)
      title(project-title)
      text(size: 1.5em, project-subtitle, style: "oblique", font: font-pairing.title, pink)

      title[]
      title[]

      text(size: 1.3em, author, font: font-pairing.title)
      title[]
      set text(font: font-pairing.body)
      //text(size: 12pt, { day-month + [ ] + year })
    },
    dy: -10%,
  )


#place.flush()
#place(
    bottom + center,
    {
    text(font: font-pairing.body)[#degree-name]
    linebreak()
    text(font: font-pairing.body)[#uni-name]
    linebreak()
    text(font: font-pairing.body)[#year]
    },
)

// #let title-page(
//   font-pairing: none,
//   project-title: none,
//   project-subtitle: none,
//   author: none,
//   day-month: none,
//   year: none,
// ) = context {

//   place(
//     horizon,
//     {
//       show title: set text(size: 1.4em)
//       set par(justify: false)

//       title[]

//       title(project-title)
//       text(size: 1.5em, project-subtitle, style: "oblique", font: font-pairing.title, pink)

//       title[]
//       title[]

//       text(size: 1.3em, author, font: font-pairing.title)
//       title[]
//       set text(font: font-pairing.body)
//       //text(size: 12pt, { day-month + [ ] + year })
//     },
//     dy: -10%,
//   )
//   place.flush()
//   place(
//     bottom + center,
//     {
//       text(font: font-pairing.body)[MSc in High Performance Computing with Data Science]
//       linebreak()
//       text(font: font-pairing.body)[The University #text("of", style: "oblique") Edinburgh]
//       linebreak()
//       text(font: font-pairing.body)[year]
//     },
//   )
//   pagebreak(weak: true)
// }
