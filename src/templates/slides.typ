#import "@preview/polylux:0.3.1"

#import "/src/packages/dates.typ": semester, weekday
#import "colors.typ": *

#let unbreak(body) = {
    set text(hyphenate: false)
    body
}

#let important-box(title,
    body,
    extra,
    primary-color,
    secondary-color,
    tertiary-color,
    dotted: false) = {

    set par(justify: true)
    block(width: 100%,
        inset: 1em,
        fill: secondary-color,

        stroke: (left: (thickness: 5pt,
            paint: primary-color,
            dash: if dotted { "dotted" } else { "solid" })),


        text(size: 0.75em, strong(text(fill: tertiary-color, smallcaps(title))))
        // + place(dx: 90%, dy: -0.5cm, text(size: 4em, fill: primary-color.lighten(75%), strong(extra)))
        + block(body))
}

#let task(body) = {
    important-box([Aufgabe],
        body,
        [A],
        blue,
        blue.lighten(90%),
        purple)
}

#let hint(body) = {
    important-box([Hinweis],
        body,
        [H],
        yellow,
        yellow.lighten(90%),
        brown,
        dotted: true)
}

#let solution(body) = {
    important-box([Lösung],
        body,
        [L],
        blue,
        blue.lighten(90%),
        purple,
        dotted: true)
}

#let definition(body) = {
    important-box([Definition],
        body,
        [D],
        magenta,
        magenta.lighten(90%),
        magenta)
}

#let notice(body) = {
    important-box([Achtung!],
        body,
        [!],
        magenta,
        magenta.lighten(90%),
        magenta,
        dotted: true)
}

#let example(body) = {
    important-box([Beispiel],
        body,
        [B],
        yellow,
        yellow.lighten(90%),
        brown,
        dotted: true)
}

#let uncover = polylux.uncover
#let only = polylux.uncover
#let pause = polylux.pause
#let slide = polylux.polylux-slide

#let slides(
    no: 0,
    title: none,
    topics: (),
    date: none,
    body
) = {
    if date == none {
        date = datetime.today()
    }

    show heading: set text(fill: purple)

    set text(size: 24pt, lang: "de", font: "Atkinson Hyperlegible")
    set page(paper: "presentation-16-9",
        footer: h(1fr) + (locate(loc => if loc.page() != 1 {
            text(fill: purple.lighten(25%),
                size: 0.75em,
                strong(str(counter(page).at(loc).first() - 1)))
        }))
        // + h(1fr)
        // + text(size: 0.5em, fill: purple.lighten(25%))[Logik-Tutorium \##no, Tristan Pieper]
    )

    slide(align(horizon, [
        #block(inset: (left: 1cm, top: 3cm))[
            #text(fill: purple, size: 2em, strong[Logik-Tutorium \##no]) \
            #text(fill: purple.lighten(25%), strong(title))

            #set text(size: 0.75em)
            // Universität Rostock \
            // Institut für Philosophie \
            // Tutorium: Sprache, Logik, Argumentation

            Tristan Pieper --- #link("mailto:tristan.pieper@uni-rostock.de") \
            #semester(date) \
            #weekday(date.weekday()), #date.display("[day].[month].[year]")
        ]
    ]))

    slide[
        #outline(title: "Ablauf", fill: none, depth: 1)
    ]

    body
}