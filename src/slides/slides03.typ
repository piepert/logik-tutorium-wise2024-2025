#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.0"

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *

#show: slides.with(
    no: 3,
    title: [erste Schritte der Formalisierung],
    date: datetime(
        year: 2024,
        month: 11,
        day: 6
    )
)

#goal-slide(goals: ("definieren-grundkonzepte", "identifizieren-aussagesätze"))[
    + 
]


#slide[
    = Erwärmung
    #set text(size: 0.875em)
    #task[
        Stellen Sie die Normalform der folgenden Argumente her!
    ]

    + Kein Mensch ist sterblich oder Fisch ist leicht verderblich. Es ist aber nicht so, dass kein Mensch sterblich ist. Also ist Fisch leicht verderblich.

    + Einstein hat Recht, denn Einstein oder Newton haben Recht. Und Newton hat nicht Recht.

    + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist damit keine Wissenschaft, weil sie sicher keine richtige Geisteswissenschaft ist.
]