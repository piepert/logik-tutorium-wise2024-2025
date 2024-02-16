#import "colors.typ": *

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

#let nobreak(body) = block(breakable: false, body)

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