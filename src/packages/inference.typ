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

#let inference-line = (v(-0.6em), table.hline(stroke: 0.75pt), v(0em))

#let inference(..lines) = {
    table(
        inset: 0pt,
        row-gutter: 0.65em,
        stroke: none,

        ..lines.pos().map(e => if e != inference-line {
            block(inset: (x: 2pt), e)
        } else {
            e
        }).flatten())
}

#let inference-raw(raw-block) = {
    inference(..raw-block.text.split("\n")
        .map(e => e.trim())
        .map(e => if e == "----" {
            inference-line
        } else {
            eval(mode: "markup", e)
        }))
}