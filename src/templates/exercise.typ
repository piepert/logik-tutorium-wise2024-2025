#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, vlinex, hlinex, cellx

#import "colors.typ" as colors: *
#import "slides.typ" as slides: *

#let make-element(type, no, title, body) = {
    block(inset: 7pt,
        stroke: (bottom: (paint: purple, dash: "dashed")),
        fill: blue.lighten(75%), {

        text(fill: purple, strong[#type #no] + [ --- #title])
    })

    block(body)
    v(0.5cm)
}

#let make-task(no, title, instruction, body, extra, points, lines) = {
    make-element(if extra [Zusatzaufgabe] else [Aufgabe],
        no,
        title + h(1fr) + if points != none { [#points P.] },
        block(emph(instruction)) + if body != none { block(body) } +

        locate(loc => {
            if state("show-lines").at(loc) == false {
                return
            }

            for i in range(0, lines) {
                v(0.75cm)
                v(-1.2em)
                line(length: 100%, stroke: black.lighten(50%))
            }
        }))
}

#let make-solution(no, title, instruction, body, extra, points, solution) = {
    make-element([Lösungsvorschlag],
        no,
        title + h(1fr) + if points != none { [#points P.] },
        block(emph(instruction)) + if body != none { block(body) } + slides.solution(solution))
}

#let make-hint(no, title, instruction, body, extra, points, hint) = {
    make-element([Hinweis],
        no,
        title + h(1fr) + if points != none { [#points P.] },
        block(emph(instruction)) + if body != none { block(body) } + slides.hint(hint))
}

#let make-solutions(loc) = {
    let tasks = state("tasks").at(loc)

    if tasks == none {
        return
    }

    for task in tasks {
        if task.solution == none {
            continue
        }

        make-solution(task.no,
            task.title,
            task.instruction,
            task.body,
            task.extra,
            task.points,
            task.solution)
    }
}

#let make-hints(loc) = {
    let tasks = state("tasks").at(loc)

    if tasks == none {
        return
    }

    let tasks = state("tasks").at(loc)

    if tasks == none {
        return
    }

    for task in tasks {
        if task.hint == none {
            continue
        }

        make-hint(task.no,
            task.title,
            task.instruction,
            task.body,
            task.extra,
            task.points,
            task.hint)
    }
}

#let make-matrix-row(no, title, extra, points, solutions) = (
    hlinex(stroke: purple),

    cellx(fill: blue.lighten(75%),
        strong(if extra [Zusatzaufgabe ] else [Aufgabe ]) +
        strong[#no --- #title]),

    cellx(fill: blue.lighten(75%),
        align(center, strong[#box(line(length: 0.75cm)) / #points])),

    hlinex(stroke: purple),

    ..solutions.map(e => (
        e.at(1),
        align(center, box(line(length: 0.75cm)) + [ \/ #e.at(0)]),
        hlinex(stroke: (paint: purple, dash: "dashed")),
    )).flatten()
)

#let make-solution-matrix(loc) = {
    let tasks = state("tasks").at(loc)

    if tasks == none {
        return
    }

    let tasks = state("tasks").at(loc)

    if tasks == none {
        return
    }

    tablex(
        columns: (1fr, auto),
        stroke: none,
        inset: (x: 1em, y: 0.75em),

        cellx(fill: purple, text(fill: white,
            align(horizon, strong[Aufgabe]))),

        vlinex(stroke: purple),

        cellx(fill: purple, text(fill: white,
            align(center, strong[Erreichte \ Punkte]))),

        ..tasks
            .filter(task =>
                not task.extra and
                task.solution != none and
                type(task.solution) == array)

            .map(task => {
                make-matrix-row(task.no,
                    task.title,
                    task.extra,
                    task.points,
                    task.solution)}).flatten(),

        colspanx(2, cellx(fill: purple, v(-10pt))),

        ..(if tasks.filter(task => task.extra and
                    task.solution != none and
                    type(task.solution) == array).len() > 0 {
            (
                tasks.filter(task =>
                    task.extra and
                    task.solution != none and
                    type(task.solution) == array)

                .map(task => {
                    make-matrix-row(task.no,
                        task.title,
                        task.extra,
                        task.points,
                        task.solution)}).flatten(),

                colspanx(2, cellx(fill: purple, v(-10pt)))
            )
        } else { () }).flatten(),

        [], [
            #show: align.with(center)

            #box(line(length: 0.75cm)) /
            #tasks.filter(e => not e.extra).map(e => e.points).sum(default: 0) + #tasks.filter(e => e.extra).map(e => e.points).sum(default: 0) P.

            #v(-0.5em)
            #line(length: 100%)
            #v(-1em)
            #line(length: 100%)
        ]
    )
}

#let task(lines: 0,
    points: none,
    extra: false,
    title,
    instruction,
    ..args) = counter(if extra { "tasks" } else { "extra-tasks" }).step() + locate(loc => {

    let args = args.pos()
    let no = numbering(if extra { "1" } else { "A" }, ..counter(if extra { "tasks" } else { "extra-tasks" }).at(loc))

    let t = (
        no: no,
        title: title,
        instruction: instruction,
        body: args.at(0, default: none),
        solution: args.at(1, default: none),
        hint: args.at(2, default: none),
        points: points,
        extra: extra
    )

    if t.body == [] or t.body == [ ] {
        t.body = none
    }

    if points != none and type(points) in (int, float) and points > 0 {
        state("tasks-points").update(k => {
            if k == none {
                return ((points: points, extra: extra),)
            }

            k.push((points: points, extra: extra))
            return k
        })
    }

    // args: 0=body, 1=solution, 2=hint
    state("tasks").update(k => {
        if k == none {
            return (t,)
        }

        k.push(t)
        return k
    })

    make-task(no, title, instruction, t.body, t.extra, t.points, lines)
})

#let nobreak(body) = block(breakable: false, body)
#let center-block(body) = align(center, block(align(left, body)))

#let big-heading(title) = pad(bottom: 0.5cm,
        align(center,
            text(fill: purple,
                size: 1.75em,
                strong(title))))

#let project(
    no: none,
    type: none,
    title: none,
    suffix-title: none,
    with-outline: false,
    abstract: none,
    document-title: none,
    show-hints: true,
    show-solutions: true,
    show-namefields: false,
    show-timefield: false,
    max-time: 0,
    show-lines: false,
    point-distribution: false,
    solutions-as-matrix: false,
    body
) = {
    if type == none {
        type = [Wiederholungsserie]
    }

    if title == none {
        title = [ #type #no --- #suffix-title ]
    }

    if document-title == none {
        document-title = title
    }

    set text(font: "Atkinson Hyperlegible", size: 11pt, lang: "de")
    // show math.equation: set text(font: "Fira Math")
    show math.equation: set text(font: "STIX Two Math")

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

                #locate(loc => {
                    if state("namefields").at(loc) != 1 {
                        if show-namefields {
                            [Name:]
                        }

                        state("namefields").update(1)
                    }
                })
            ][
                #show: align.with(top + right)
                #document-title \
                Tristan Pieper \
                #datetime.today().display("[day].[month].[year]")

                #locate(loc => {
                    if state("timefield").at(loc) != 1 {
                        if show-timefield {
                            [Zeit: #max-time min.]
                        }

                        state("timefield").update(1)
                    }
                })
            ]

            #line(length: 100%, stroke: purple)
        ],

        footer: align(center)[
            #line(length: 100%, stroke: purple)
            Seite #counter(page).display() / #locate(loc => counter(page).final(loc).first())
        ],

        margin: (top: 3.5cm, bottom: 3cm))

    big-heading(title)

    if abstract != none {
        set text(size: 0.85em)

        pad(x: 1cm, bottom: 0.5cm, par(//first-line-indent: 1cm,
            strong[Zusammenfassung:] +
            abstract))
    }

    if with-outline {
        show outline.entry: it => h(1em) + it
        set text(size: 0.75em)
        pad(x: 1cm, y: 0.25cm, outline(indent: 1.5em))
    }

    set heading(numbering: "1.")

    state("tasks").update(())
    state("tasks-points").update(())
    state("show-lines").update(show-lines)

    body

    locate(loc => {
        let tasks = state("tasks").at(loc)

        if show-hints and tasks.filter(e => e.hint != none).len() != 0 {
            pagebreak()
            big-heading[Hinweise zu #type #no]
            make-hints(loc)
        }
    })

    show: it => if show-solutions and solutions-as-matrix {
        set page(flipped: true, columns: 2, margin: (x: 1cm, top: 3cm, bottom: 2cm))
        it
    }

    locate(loc => {
        let tasks = state("tasks").at(loc)

        if show-solutions and tasks.filter(e => e.solution != none).len() != 0 {
            set text(size: 0.75em)
            big-heading[Lösungsvorschläge zu #type #no]

            if solutions-as-matrix {
                make-solution-matrix(loc)

                let points = state("tasks-points").at(loc)
                let points-sum = points.filter(e => not e.extra).map(e => e.points).sum(default: 0)
                let extrapoints-sum = points.filter(e => e.extra).map(e => e.points).sum(default: 0)
                let points-sum-all = points-sum + extrapoints-sum

                if points-sum-all > 0 and point-distribution {
                    v(1fr)
                    set text(fill: purple)
                    block(fill: blue.lighten(75%),
                        breakable: false,
                        stroke: purple,
                        inset: 1em,
                        width: 100%, {

                        [Insgesamt sind #points-sum + #extrapoints-sum Punkte erreichbar. Sie haben #box(line(stroke: purple, length: 1cm)) von #points-sum Punkten erreicht.]

                        let f(from, to) = {
                            from = calc.round(from)
                            to = calc.round(to)

                            if from == to [#from] else [#from -- #to]
                        }

                        let n = 3

                        let top-socket = points-sum * 0.9
                        let bottom-socket = points-sum * 0.5

                        let point-distribution = (f(points-sum, top-socket),)
                        let last-to = top-socket

                        for i in range(0, n) {
                            let to = calc.min(last-to - 1, top-socket - (top-socket - bottom-socket) / n * (i + 1))

                            point-distribution.push(f(last-to - 1, to))
                            last-to = to
                        }

                        point-distribution.push(f(last-to - 1, 0))

                        center-block(tablex(
                            columns: n + 3,
                            stroke: none,
                            align: center,

                            strong[Punktzahl], ..point-distribution,
                                // [#calc.round(points-sum*0.5 - 1) -- 0],

                            hlinex(stroke: 1pt + purple),

                            strong[Wert],
                            ..([sehr gut],
                                [gut],
                                [befriedigend],
                                [ausreichend],
                                [n.b.])
                                .rev()
                                .map(e => (vlinex(stroke: 1pt + purple), text(size: 0.95em, e)))
                                .rev()
                                .flatten(),
                        ))
                    })
                }

            } else {
                pagebreak()
                make-solutions(loc)
            }
        }
    })
}