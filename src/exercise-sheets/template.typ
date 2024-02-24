#let blue = rgb("#5B8EFD")
#let purple = rgb("#725DEF")
#let lavender = rgb("#DD217D")
#let magenta = rgb("#DD217D")
#let yellow = rgb("#FFB00D")

#let task(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: blue)),
        fill: blue.lighten(90%),

        text(size: 0.75em, strong(smallcaps[Aufgabe]))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: blue.lighten(75%), strong[A]))
        + block(body))
}

#let hint(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: orange, dash: "dotted")),
        fill: orange.lighten(90%),

        text(size: 0.75em, strong(smallcaps[Hinweis]))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: orange.lighten(75%), strong[H]))
        + block(body))
}

#let solution(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: blue, dash: "dotted")),
        fill: blue.lighten(90%),

        text(size: 0.75em, strong(smallcaps[Lösung]))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: blue.lighten(75%), strong[L]))
        + block(body))
}

#let definition(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: magenta)),
        fill: magenta.lighten(90%),

        text(size: 0.75em, strong(smallcaps[Definition]))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: magenta.lighten(75%), strong[D]))
        + block(body))
}

#let notice(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: magenta, dash: "dotted")),
        fill: magenta.lighten(90%),

        text(size: 0.75em, strong(smallcaps[Achtung!]))
        + place(dx: -1.25cm, dy: -0.5cm,
            text(size: 3em, fill: magenta.lighten(75%), strong[!]))
        + block(body))
}

#let example(body) = {
    block(width: 100%, inset: 1em,
        stroke: (left: (thickness: 5pt, paint: orange)),
        fill: orange.lighten(90%),

        text(size: 0.75em, strong(smallcaps[Beispiel]))
        + place(dx: -1.5cm, dy: -0.5cm,
            text(size: 3em, fill: orange.lighten(75%), strong[B]))
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