#import "@preview/grape-suite:1.0.0": exercise
#import "/src/packages/goals.typ": set-all-goals, ref-goal
#import exercise: *

#let line-numbering(step: 5,
    start: 1,
    show-start: true,
    body) = {

    set par.line(numbering: (..a) => {
        let f = a.pos().first()

        if (f == start and show-start) or (f >= start and calc.rem(f, step) == 0) {
            text(size: 0.75em)[#f]
        }
    })

    body
}

#let fullcite(postfix: none, prefix: none, e) = {
    if prefix != none { [#prefix ] } + cite(label(e)) + if postfix != none [ #postfix]
}

#let notecite(postfix: none, prefix: none, ..es) = {
    es.pos()
        .map(e => footnote(fullcite(e)))
        .join(super[,])
}

#let ct(full: false, s) = {
    let rep-back(s) = {
        s.replace("<BACKSLASH>", "\\\\")
        .replace("<SLASH>", "/")
        .replace("<PLUS>", "\\+")
    }

    let res = s.replace("\\\\", "<BACKSLASH>")
        .replace("\\/", "<SLASH>")
        .replace("\\+", "<PLUS>")
        .split("+")
        .map(e => {
            let e = e.split("/")
            let postfix = if e.len() > 1 and e.at(1) != "" {
                rep-back(e.at(1))
            }

            let prefix = if e.len() > 2 and e.at(2).trim() != "" {
                rep-back(e.at(2))
            }

            if full {
                fullcite(prefix: prefix, postfix: postfix, e.at(0))
            } else {
                cite(prefix: prefix, postfix: postfix, e.at(0))
            }
        })

    return if full {
        res
    } else {
        res.join(super[,])
    }
}

#let project(body, use-bib: true, ..a) = {
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
        box-solution-title: [Lösungsvorschlag],
        box-task-title: [Aufgabe],

        ..a
    )

    set-all-goals()
    body

    if use-bib {
        place(hide(bibliography("/src/bibliography.bib", style: "/src/citation-style.csl")))
    }
}