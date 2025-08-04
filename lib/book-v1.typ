#let pagestyle = state("pagestyle", "empty")

#let hrulefill() = box(width: 1fr, stroke: (bottom: 0.4pt + black))



#let docinit(doc) = {
  set text(font: ("XCharter", "Noto Serif CJK SC"), size: 10pt)
  set page(
    margin: (
      top: 30mm,
      bottom: 30mm,
      left: (100% - 38em) / 2,
      right: (100% - 38em) / 2,
    ),
    footer: context [
      #if (pagestyle.get() == "plain") {
        text(size: 10pt)[#align(right)[#counter(page).display("1")]]
      }
    ],
  )
  set par(justify: true, leading: 0.65em * 1.08)
  set heading(numbering: "1.1.1.1.   ")

  doc
}


#let makecover(title) = [
  #pagestyle.update("empty")
  #context align(center)[
    #v(6fr)
    #text(size: 1.4em)[旅行记忆索引]
    #v(3fr)
    #text(size: 3em, title)
    #v(12fr)
    #text(size: 1em)[PROJECT TRAVELMEMORY PRESENTS]
  ]
  #pagebreak()
  #context {
    counter(page).update(0)
  }
]



#let chaptercounter = counter("chaptercounter")
#let chapter(title) = context [
  #pagebreak()
  #pagestyle.update("plain")
  #chaptercounter.step()
  #block(below: 3em)[
    #context [#text(size: 1.3em, weight: "bold", [CHAPTER #chaptercounter.display()])]
    #parbreak()
    #text(size: 2.5em, weight: "bold", [#title])
  ]
  #counter(heading).update(0)
  #v(0.5em)
  #hrulefill()
  #v(2em)
]


