#import "@preview/grape-suite:1.0.0": exercise
#import "/src/packages/goals.typ": set-all-goals
#import exercise: *

#let project(body, ..a) = {
    set text(lang: "de")
    show: exercise.project.with(
        university: [Universtität Rostock],
        institute: [Institut für Philosophie],
        seminar: [Tutorium: Sprache, Logik, Argumentation],

        type: [Aufgabenblatt],
        author: [Tristan Pieper],

        task-type: [Aufgabe],
        hint-type: [Hinweis],
        solution-type: [Lösungvorschlag],
        extra-task-type: [Knobelei],

        hints-title: [Hinweise],
        solutions-title: [Lösungvorschläge],

        box-example-title: [Beispiel],
        box-hint-title: [Hinweis],
        box-notice-title: [Achtung],
        box-solution-title: [Lösung],
        box-task-title: [Aufgabe],
        ..a
    )

    set-all-goals()
    body
}