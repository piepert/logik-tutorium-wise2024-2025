#import "colors.typ" as colors: *

#let task(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: blue)),
        fill: blue.lighten(90%),

        text(size: 0.75em, strong(text(fill: purple, smallcaps[Aufgabe])))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: blue.lighten(75%), strong[A]))
        + block(body))
}

#let hint(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: yellow, dash: "dotted")),
        fill: yellow.lighten(90%),

        text(size: 0.75em, strong(text(fill: brown, smallcaps[Hinweis])))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: yellow.lighten(75%), strong[H]))
        + block(body))
}

#let solution(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: blue, dash: "dotted")),
        fill: blue.lighten(90%),

        text(size: 0.75em, strong(text(fill: purple, smallcaps[Lösung])))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: blue.lighten(75%), strong[L]))
        + block(body))
}

#let definition(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: magenta)),
        fill: magenta.lighten(90%),

        text(size: 0.75em, strong(text(fill: magenta, smallcaps[Definition])))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: magenta.lighten(75%), strong[D]))
        + block(body))
}

#let notice(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: magenta, dash: "dotted")),
        fill: magenta.lighten(90%),

        text(size: 0.75em, strong(text(fill: magenta, smallcaps[Achtung!])))
        + place(dx: -1.25cm, dy: -0.5cm,
            text(size: 3em, fill: magenta.lighten(75%), strong[!]))
        + block(body))
}

#let example(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: yellow)),
        fill: yellow.lighten(90%),

        text(size: 0.75em, strong(text(fill: brown, smallcaps[Beispiel])))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: yellow.lighten(75%), strong[B]))
        + block(body))
}

#let normalform(..arguments) = {
    let lines = ()

    for argument in arguments.pos() {
        if type(argument) != "array" {
            return normalform(arguments.pos())

        } else {
            let i = 0
            for sentence in argument {
                if i+1 >= argument.len() {
                    lines.push((align(right)[Also:], sentence))

                } else {
                    lines.push(([], sentence))
                }

                i += 1
            }
        }
    }

    grid(columns: 2,
        column-gutter: 1em,
        row-gutter: 0.65em,
        ..lines.flatten())
}

#let nobreak(body) = block(breakable: false, body)

#let project(
    title: none,
    with-outline: false,
    abstract: none,
    body
) = {
    set text(font: "Atkinson Hyperlegible", size: 11pt, lang: "de")
    show math.equation: set text(font: "Fira Math")

    set par(justify: true)

    set enum(indent: 1em)
    set list(indent: 1em)

    show link: underline
    show link: set text(fill: purple)

    // show heading: set text(fill: purple)
    show heading: it => locate(loc => style(s => {
        let num-style = it.numbering

        if num-style == none {
            return it
        }

        let num = text(weight: "thin", numbering(num-style, ..counter(heading).at(loc))+[ \u{200b}])

        [#move(text(fill: purple.lighten(25%), num) + [] + text(fill: purple, it.body), dx: -1 * measure(num, s).width)]
    }))

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

            #line(length: 100%, stroke: purple)
        ],

        footer: align(center)[
            #line(length: 100%, stroke: purple)
            Seite #counter(page).display() / #locate(loc => counter(page).final(loc).first())
        ],

        margin: (top: 3.5cm, bottom: 3cm))

    pad(align(center, text(fill: purple, size: 1.75em, strong(title))))

    if abstract != none {
        set text(size: 0.85em)

        pad(x: 1cm, y: 0.25cm, par(first-line-indent: 1cm,
            strong[Zusammenfassung:] +
            abstract))
    }

    if with-outline {
        show outline.entry: it => h(1em) + it
        set text(size: 0.75em)
        pad(x: 1cm, y: 0.25cm, outline(indent: 1.5em))
    }

    set heading(numbering: "1.")

    body
}