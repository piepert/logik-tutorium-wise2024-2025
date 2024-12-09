#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 4,
    suffix-title: [Argumenttypen],
    date: datetime(year: 2024, month: 10, day: 30))

#task(time: [Stammgruppen, 10 min.])[
    Ordnen Sie die Argumente jeweils mit Hilfe der Definitionen Ihrer Experten das folgende Schema ein:

    #set text(size: 0.75em)
    #figure(diagram(
        spacing: 1em,
        node((0,0), [Argument]),

        edge((0,0), (-0.5,1), "-|>"),
        node((-0.5,1), [gültig]),

        edge((-0.5,1), (0,2), "-|>"),
        node((0,2), [induktiv-gültig]),
        edge((-0.5,1), (-1,2), "-|>"),
        node((-1,2), [deduktiv-gültig]),

        edge((-1,2), (-1.5,3), "-|>"),
        node((-1.5,3), [schlüssig]),
        edge((-1,2), (-0.5,3), "-|>"),
        node((-0.5,3), [nicht schlüssig]),

        edge((0,0), (0.5,1), "-|>"),
        node((0.5,1), [ungültig]),
    ))
]

#block(height: 6cm, columns(2, enum(tight: false, spacing: 2.5em,

    // induktiv-gültig
    inference-raw(```
    Bisher hat sich Einsteins Relativitätstheorie immer bestätigt.
    ----
    Einsteins Relativitätstheorie ist wahrscheinlich korrekt.
    ```),

    // ungültig
    inference-raw(```
    Wenn Bond einen Fallschirm hat, überlebt er den Absturz.
    Bond hat keinen Fallschirm.
    ----
    Bond überlebt den Absturz nicht.
    ```),

    // deduktiv-gültig
    inference-raw(```
    Gott ist das perfekteste Wesen.
    Ein existierendes Wesen ist perfekter als ein nicht-existierendes Wesen.
    ----
    Gott existiert.
    ```) + colbreak(),

    // schlüssig
    inference-raw(```
    Wenn es regnet, wird die Straße nass.
    Manchmal regnet es.
    ----
    Manchmal wird die Straße nass.
    ```),
)))