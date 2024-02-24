#import "colors.typ" as colors: *

#let project(
    title: none,
    with-outline: false,
    abstract: none,
    body
) = {
    set text(font: "Atkinson Hyperlegible", lang: "de")
    show math.equation: set text(font: "Fira Math")

    set par(justify: true)

    set enum(indent: 1em)
    set list(indent: 1em)

    set page(header: [
            #set text(size: 0.75em)

            #grid(columns: (50%, 50%))[
                Universität Rostock \
                Institut für Philosophie \
                Tutorium: Sprache, Logik, Argumentation
            ][
                #show: align.with(top + right)
                Konzept für das Logik-Tutorium \
                Tristan Pieper \
                #datetime.today().display("[day].[month].[year]")
            ]
        ],

        footer: align(center)[
            Seite #counter(page).display() / #locate(loc => counter(page).final(loc).first())
        ],

        margin: (top: 3cm))

    pad(align(center, text(size: 1.5em, strong(title))))

    if abstract != none {
        set text(size: 0.85em)

        pad(x: 1cm, y: 0.25cm, par(first-line-indent: 1cm,
            strong[Zusammenfassung:] +
            abstract))
    }

    if with-outline {
        show outline.entry: it => h(1em) + it
        outline(indent: 1.5em)
    }

    set heading(numbering: "1.")

    body
}