#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    page-margins: (x: 1.5cm),
    title: "Übersicht: Bestandteile der Prädikatenlogik",
    date: datetime(year: 2024, month: 12, day: 11))

#set par(justify: false)
#table(
    stroke: none,
    columns: 4,


    [], table.vline(),
    strong[Erklärung], table.vline(),
    strong[Beispiele in natürlicher Sprache], table.vline(),
    strong[Zeichen in PL],

    table.hline(),

    strong[Junktoren], [logische Satzverknüpfungszeichen, funktionieren wie in AL], [
        - "nicht"
        - "und"
        - "oder"
        - "wenn ..., dann ..."
        - "genau dann ..., wenn ..."
    ], [
        - "$not$", "$and$", "$or$", "$->$", "$<->$"
    ],
    table.hline(),

    strong[Nominatoren], [
        #v(4.5cm)
    ], [], [],
    table.hline(),

    strong[Prädikatoren], [
        #v(4.5cm)
    ], [], [],
    table.hline(),

    strong[Allquantor], [
        #v(4.5cm)<
    ], [], [],
    table.hline(),

    strong[Existenz-\ quantor], [
        #v(4.5cm)
    ], [], []
)