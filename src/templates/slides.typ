#import "colors.typ": *

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