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

    show terms: it => {
        it.children.map(e => par(hanging-indent: 1.5em)[#strong(e.term): #e.description]).join[]
    }

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