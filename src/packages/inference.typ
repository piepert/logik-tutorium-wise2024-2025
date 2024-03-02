#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, vlinex, hlinex

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

#let inference-line = line(length: 100%)

#let inference(..lines) = {
    tablex(
        inset: 0pt,
        row-gutter: 1em,
        stroke: none,
        ..lines.pos().map(e => if e != inference-line {
            block(inset: (x: 2pt), e)
        } else {
            e
        }))
}