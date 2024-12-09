#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 6,
    date: datetime(year: 2024, month: 11, day: 20))

#task(title: [PA, 10 min.])[
    Formalisieren Sie die Schlüsses und prüfen Sie mit Hilfe der Wahrheitstafel, ob es sich um gültige Argumente handelt!
]

+ #inference-wl[
    Es ist nicht warm oder es ist Sommer.][
    Es ist warm.][
    Es ist Sommer.]

+ #inference-wl[
    Es regnet und es regnet nicht.][
    Ich esse einen Kuchen.]

+ #inference-wl[
    Manchmal arbeite ich und manchmal habe ich Spaß.][
    Wenn ich manchmal arbeite, muss ich Bücher lesen.][
    Wenn ich Bücher lesen muss, dann habe ich manchmal Spaß.][
    Wenn ich manchmal arbeite, dann habe ich manchmal Spaß.]

#v(1fr)

#task(title: [Zusatz])[
    Beweisen Sie, dass der folgende Schluss gültig ist:

    #figure(align(left, inference-wl[$not p -> not q$
    ][$not r -> not p$
    ][$r -> s$
    ][$not s$
    ][$not q$]))

    Tipp: Bei vier Satzbuchstaben (16 Zeilen in der Wahrheitstabelle) macht es sich eventuell einfacher, eine andere Methode zum Beweisen zu verwenden, wie etwa den Kalkül des natürlichen Schließens.
]