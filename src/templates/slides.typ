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
        brown)
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
#let slide(..args) = polylux.polylux-slide(..args) + counter("slide-counter").step()

#let slides(
    no: 0,
    title: none,
    topics: (),
    date: none,
    body
) = {
    show footnote.entry: set text(size: 0.5em)

    if date == none {
        date = datetime.today()
    }

    show heading: set text(fill: purple)

    set text(size: 24pt, lang: "de", font: "Atkinson Hyperlegible")
    set page(paper: "presentation-16-9",
        footer: {

                (locate(loc => if loc.page() > 2 {
                    set text(fill: if loc.page() > 2 {
                        purple.lighten(25%)
                    } else {
                        blue.lighten(25%)
                    })

                    text(size: 0.5em,[
                        #semester(short: true, date) ---
                        Logik-Tutorium \##no ---
                        #title ---
                        Tristan Pieper
                    ])

                    h(1fr)

                    text(size: 0.75em,
                        strong(str(counter(page).at(loc).first() - 2))) + text(size: 0.5em, [ \/ #(counter(page).final(loc).first() - 2)])
            }))
        }
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

    set page(fill: purple)
    slide[
        #set text(fill: white)

        #heading(outlined: false, text(fill: blue.lighten(25%), [Ablauf]))

        #locate(loc => {
            let elems = query(selector(heading).after(loc), loc)

            enum(..elems
                .filter(e => e.level == 1 and e.outlined)
                .map(e => {
                    e.body
                }))
        })
    ]

    set page(fill: white)
    body
}