#import "@preview/grape-suite:1.0.0": slides, colors
#import slides: *

#import "/src/packages/goals.typ": *

#import "/src/packages/inference.typ": *

#let oslides = slides
#let slides(bibliography-file: none, ..a, body) = {
    set text(lang: "de")

    show cite: it => footnote(it) + counter("cite").step()

    show: oslides.with(
        series: "Logik-Tutorium",
        author: [Tristan Pieper],

        show-outline: false,
        outline-title-text: [Ablauf],

        box-example-title: [Beispiel],
        box-hint-title: [Hinweis],
        box-notice-title: [Achtung],
        box-solution-title: [Lösung],
        box-task-title: [Aufgabe],

        ..a
    )

    set terms(separator: strong[: ])

    show link: underline
    show link: text.with(fill: colors.purple)
    body
}

#let goal-slide(body, goals: ()) = slide({
    [
        = Ziele für die Sitzung
        Innerhalb der nächsten Wochen kann ich...
    ]

    set-all-goals()

    grid(columns: 1,
        row-gutter: 1em,
        column-gutter: 0.5em,
        ..goals.map(goal => print-goals(goal, suffix: [.])).flatten()
    )

    v(0.65em)
    [Dazu kann ich nach der Sitzung...]

    body
})

#let focus-slide(body) = {
    set page(fill: purple)
    set text(fill: white)

    state("grape-suite-slides", ()).update(k => {
        k.push("focus")
        k
    })

    polylux.polylux-slide[
        #set text(size: 1.5em, weight: "bold")
        #show: align.with(center + horizon)
        #v(-0.75em)
        #body
    ]
}

#let final-slide = focus-slide[
    #v(0.5fr)

    Fassen Sie in einem Satz zusammen, was Sie aus der heutigen Sitzung mitnehmen!

    #v(0.5fr)
    #set text(size: 0.5em, weight: "medium", fill: blue.lighten(25%))
    #set align(left)
    Folien, Übungsblätter, Ablaufplan, Konzepte und Sourcecode: \ #link("https://github.com/piepert/logik-tutorium-wise2023-2024", text(fill: blue.lighten(25%))[https:\//github.com/piepert/logik-tutorium-wise2023-2024])
]