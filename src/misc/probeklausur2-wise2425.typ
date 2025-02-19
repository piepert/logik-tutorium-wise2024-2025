#import "/src/templates/exams.typ": *

#import "/src/packages/inference.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/log-quad.typ": *
#import "/src/packages/symbols.typ": *

#set text(lang: "de")
#let otask = task
#let task = otask.with(numbering-format: (..a) => numbering("1", ..a))
#let etask = otask.with(extra: true, numbering-format: (..a) => none)

#show: project.with(
    title: "Probeklausur II",
    task-type: "Aufgabe",
    extra-task-type: "Zusatzaufgabe",
    type: none,
    no: none,

    message: (points-sum, extrapoints-sum) => [Insgesamt sind #points-sum + #extrapoints-sum P. erreichbar. Sie haben #box(line(stroke: purple, length: 1cm)) von #points-sum P. erreicht.],

    solution-matrix-task-header: [Aufgaben],
    solution-matrix-achieved-points-header: [Erreichte Punkte],

    show-solutions: false,
    solutions-title: [Bewertungsmatrix],

    grade-scale: (([sehr gut], 0.9), ([gut], 0.76), ([befriedigend], 0.63), ([ausreichend], 0.5), ([n.b.], 0.49)),
    timefield: (time) => [Zeit: #time min.],
    max-time: 90,

    show-lines: true
)

#let total-points = 100

#task(none, lines: 5, points: 2, [
    Definieren Sie, wann zwischen den Sätzen, die man "Prämissen" nennt, und einem Satz, der "Konklusion" bezeichnet wird, eine logische Folgerung gilt!
], none, (
    (2, [
        Logische Folgerung herrscht zwischen zwei Sätzen $A$ und $B$ genau dann, wenn allein aufgrund der logischen Form der Sätze $A$ und $B$ gegeben ist, dass $B$ nicht falsch sein kann, wenn $A$ es ist.

        Punkte für:
        - ist allein von der logischen Form abhängig
        - der eine Satz kann nicht falsch sein, wenn der andere wahr ist
    ]),
))

#task(points: 5, none)[
    Setzen Sie genau dann ein Kreuz, wenn es sich um einen Aussagesatz handelt!
][
    #set list(marker: sym.ballot)
    - Jeder hat manchmal Pech.
    - Die Summe von 2 und 2 ist 5. // $2+2=5$
    - Wäre ich doch nur Bäcker geworden!
    - Wollen Sie Bäcker werden?
    - Alice wünscht sich, dass sie gewinnt.
]

// AL

// halber Punkt pro Element des Zuordnungsverzeichnis'
// ein Punkt je für korrekt übersetzten Satz
#task(none, points: 7, lines: 17)[
    Beweisen Sie, dass $p and not q$ logisch äquivalent zu $not (p -> q)$ ist!
]

#task(none, points: 6, lines: 27)[
    + Formalisieren Sie das folgende Argument.
    + Beweisen Sie mit dem Kalkül des natürlichen Schließens, dass das Argument gültig ist!
][
    Immanuel oder Sören kommen nur dann zur Philosophenparty, wenn Theodor auchkommt. Es ist jedoch ausgeschlossen, dass sowohl Theodor als auch Hannah auf der Party anzutreffen sind. Immanuel kommt zur Philosophenparty. Also bleibt Hannah zuhause.
]

#task(none, points: 4, lines: 22)[
    Beweisen Sie mit Hilfe des Kalküls des natürlichen Schließens, dass das folgende Argument gültig ist!
][
    #inference-raw(```
    $q -> r$
    $p -> r$
    ----
    $(p and q) -> r$
    ```)
]

#task(points: 6, none)[
    Setzen Sie bei einem Satz ein Kreuz genau dann, wenn er logisch-äquivalent ist zur folgenden Aussage:
][
    "Wenn es regnet, dann wird die Straße nass."

    #set list(marker: sym.ballot)
    - Wenn es regnet, dann wird die Straße nass.
    - Wenn es nicht regnet, dann wird die Straße nicht nass.
    - Nur wenn es regnet, dann wird die Straße nass.
    - Wenn die Straße nass wird, dann regnet es.
    - Wenn die Straße nicht nass wird, dann regnet es nicht.
    - Nur wenn die Straße nass wird, dann regnet es.
]

// PL

#task(none, points: 7)[
    Vervollständigen Sie das folgende logische Quadrat korrekt!
][
    #log-quad(
        scale-factor: 1.125,

        a: [
            #place[Alles ist eitel.\ $forall x F x, not exists x not F x$]#hide[
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm)))
            ]
        ],

        i: [
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm)))
        ],

        e: [
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm)))
        ],

        o: [
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 5cm)))
        ],

        kd: [
            #box(height: 0.5cm, align(bottom, line(length: 3cm))) \
            #box(height: 0.5cm, align(bottom, line(length: 3cm))) \
        ],

        k: [#box(height: 0.5cm, align(bottom, line(length: 2cm)))],
        sk: [#box(height: 0.5cm, align(bottom, line(length: 3cm)))],

        sub: [#box(height: 0.5cm, align(bottom, line(length: 3cm)))],
    )
]

#task(none, points: 6, lines: 25)[
    Übersetzen Sie die folgenden Sätze in die Sprache PL!
][
    + Alice liebt Bob.
    + Alles ist fabelhaft.
    + Wenn Alice sich selbst liebt, dann wird Alice von jemandem geliebt.
    + Jeder liebt jemanden.
    + Kein Mensch ist nicht sterblich.
]

#task(none, points: 10, lines: 44)[
    Beweisen Sie die folgenden Argumente mit dem Kalkül des natürlichen Schließens!
][
    #show: columns
    1. #inference-raw(```
    $forall x forall y (F x and G x y)$
    ----
    $exists x F x and exists y exists z G z y$
    ```)

    #colbreak()
    2. #inference-raw(```
    $forall x (not G x or F x)$
    $exists x G x$
    ----
    $exists x (G x and F x)$
    ```)
]

#etask(none, extra: true, points: 3, lines: 5)[
    Geben Sie eine begründete Übersetzung in die Sprache PL für den Satz "Alice existiert." an!
]