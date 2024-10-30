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

#let inference-line = table.hline(start: 1, end: 2, stroke: 1pt)

#let inference(..lines, indent: (:)) = {
    // set table.cell(inset: (y: 0.325em))

    show table.cell.where(x: 0): it => {
        show: align.with(right)
        it
    }

    table(
        inset: 0pt,
        // row-gutter: 0.65em,
        stroke: none,
        columns: 2,

        ..lines.pos()
            .enumerate()
            .map(((index, e)) => if e != inference-line {
                let e = if type(e) == array { e } else { (none, e) }

                e.map(e => block(e, inset: if index == 0 { (bottom: 0.325em) }
                        else if index > 0 and index < lines.pos().len() - 1 { (y: 0.325em) }
                        else { (top: 0.325em) }))
        } else {
            (table.cell(colspan: 2,
                v(0.1525em)),
                e,
                table.cell(colspan: 2, v(0.1525em)))

        }).flatten()
    )
}

#let inference-wl(..a) = inference(..a.pos().slice(0, a.pos().len() - 1), inference-line, a.pos().last())

#let inference-raw(raw-block, ..options) = {
    inference(..raw-block.text.split("\n")
        .map(e => e.trim())
        .map(e => if e == "----" {
            inference-line
        } else {
            let e = e.trim()
            if e.starts-with("[") {
                let arr = e.split("]")
                let prefix = arr.first() + "]"
                let content = arr.slice(1, arr.len()).join("]")

                (eval(mode: "markup", prefix), eval(mode: "markup", content))

             } else {
                (none, eval(mode: "markup", e))
            }
        }), ..options)
}

#let rule(caption: none, supplement: "Regel", ..bodies) = figure(supplement: supplement,
    caption: caption,
    stack(dir: ltr, spacing: 0.5cm, ..bodies))