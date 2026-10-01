#let light-pink = rgb("#f99def")
#let pink = rgb("#C11C84")

// FONT PAIRING
#import "@preview/tasteful-pairings:0.1.0": *
#let font-pairing = (
  title: "Aptos",
  body: "Libertinus Serif",
  heading: "Libertinus Serif",
)

// FONT SIZES
#let sizes = (1.4em, 1.1em, 1.1em)


#let style(body) = {
	// PAGE SIZE
  	set page(
    	paper: "a4",
   	)

    // TYPEFACE
	show heading: set text(font: font-pairing.heading, weight: "regular")
	set text(font: font-pairing.body, size: 11pt)


  	// HEADINGS
  	set heading(numbering: "1", supplement: "Chapter")

   	// CHAPTER-LEVEL HEADINGS
    show heading.where(level: 1): it => block({
    	v(5em)
     	set text(style: "oblique", pink)
      	it
       	line(length: 100%, stroke: (thickness: 0.5pt, paint: pink))
        v(1em)
    })

    // SUB-CHAPTER HEADINGS
    show heading.where(level: 2): it => block({
    	v(1.5em) + strong(it) + v(1.25em)
    })

    show heading.where(level: 3): smallcaps
    show heading.where(level: 3): it => {
    	block(v(1em) + (smallcaps(it)) + v(1em))
    }


    // HEADING FONT SIZES
    show heading: it => {
        let target-size = sizes.at(it.level - 1)

        set text(size: target-size)
        it
    }

    // PARAGRAPHS
    set par(leading: 0.8em, spacing: 1.5em, justify: true, first-line-indent: 1.5em)

    // OUTLINE
    show outline.entry: it => {
    set text(font: font-pairing.heading)
    if it.level == 1 and it.element.func() == heading {
         v(1em)

        (
        	strong({
          	show repeat: none
           	it
          	})
        )
    } else if it.level == 3 and it.element.func() == heading {
      	set text(font: font-pairing.body, size: 11pt)
       	smallcaps(it)
    } else {
      	set text(font: font-pairing.body, size: 11pt)
       	it
    }
    }

    // REFS & LINKS
    show ref: set text(pink)
    show link: set text(pink)

    // RAW BLOCKS
    show raw.where(block: false): box.with(
      fill: light-pink,
      inset: (x: 3pt, y: 0pt),
      outset: (y: 3pt),
      radius: 2pt,
    )

    //BIBLIOGRAPHY
    show bibliography: it => {
    	set par(leading: 0.5em, spacing: 1.5em, justify: true)

     	it
    }

  	// LISTS
   	set list(indent: 0.5em)
   	set enum(indent: 0.5em)

  set figure(placement: auto)

  body
}
