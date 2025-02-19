#import "@preview/cetz:0.3.0"

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *
#import "/src/packages/log-quad.typ": *

#show raw.where(lang: "inference"): it => inference-raw(it)

#show: slides.with(
    no: 9,
    title: [Formalisierung, Quantoren und das logische Quadrat],
    date: datetime(
        year: 2024,
        month: 12,
        day: 18
    )
)

#show figure: it => v(-1cm) + align(horizon + center, it)

#goal-slide(goals: ("formalisieren-pl", "ausfüllen-log-quad"))[
    + ... einfache Aussagesätze prädikatenlogisch formalisieren.
    + ... einfache Aussagesätze mit Quantoren formalisieren.
]

#slide[
    = Erwärmung
    // #set text(size: 1em)

    #grid(columns: (57%, 40%), column-gutter: 1cm)[
        #task(time: [10 min.])[
            Beweisen Sie den folgenden Schluss mit dem KdnS!

            #inference-raw(```
            $q$
            $p <-> q$
            ----
            $p$
            ```)
        ]
    ][
        #task(title: [Zusatz])[
            #inference-raw(```
            $not r$
            $p and (q -> r)$
            ----
            $p and not q$
            ```)
        ]
    ]
]

#slide[
    #set text(size: 0.925em)
    #task(time: [PA, 5 min.])[
        Übersetzen Sie die die folgenden PL-Sätze zurück in die natürliche Sprache!

        #grid(columns: 2, column-gutter: 1em)[
            $R x$: $x$ ist eine Reinigungskraft. \
            $K x y$: $x$ und $y$ sind Kollegen.
        ][
            $a$: Alice \
            $b$: Bob
        ]

        + $R a$
        + $R a and R b and K a b$
        + $K a b -> (R a and R b)$
    ]
]

#slide[
    = Zurück zu Sokrates...
    #notice[
        Wir können jetzt aussagenlogische Sätze genauer zerlegen, aber können wir damit schon Sokrates' Argument formalisieren?
    ]

    #inference-wl[
        Alle Daimonen sind Kinder von Göttern.][
        Es gibt Daimonen.][
        Es gibt Götter.]

    Versuchen wir es gemeinsam...
]

#focus-slide[
    Formalisierung mit Quantoren
]

#slide[
    = Existenzquantor und Allquantor
    #task(time: [Plenum, 5 min.])[
        Nennen Sie Signalwörter, die auf den ...
        + Allquantor hinweisen.
        + Existenzquantor hinweisen.
    ]
]

#slide[
    #set text(size: 0.925em)
    #task(time: [PA, 5 min.])[
        Übersetzen Sie die die folgenden PL-Sätze zurück in die natürliche Sprache!

        #grid(columns: 2, column-gutter: 1em)[
            $S x$: $x$ ist sterblich. \
            $G x$: $x$ ist ein Gott.
        ][
            $K x$: $x$ ist ein Kind von $y$. \
            $D x$: $x$ ist ein Dämon. \
        ]

        + $not exists x G x$
        + $forall x (S x -> not G x)$
        + $exists x (G x and D x)$
        + $forall x (D x -> exists y (G y and K x y))$
    ]
]

#slide[
    #task(time: [PA, 10 min.])[
        Formalisieren Sie die folgenden Aussagen in PL!

        + Alice und Bob sind Kollegen.
        + Wenn Bob eine Reinigungskraft ist, dann auch Alice.
        + Es gibt keine Reinigungskräfte.
        + Niemand ist eine Reinigungskraft.
        + Es gibt Reinigungskräfte, die Kollegen sind.
    ]
]

#focus-slide[
    Das logische Quadrat
]

#slide[
    #task(time: [Plenum, 5 min.])[
        #set par(justify: false)
        #set text(size: 0.95em)
        Vergleichen Sie die beiden Aussagen! Beide sind eine verneinte Form von "Alle Äpfel sind giftig.", aber sagen sie auch das gleiche aus?

        #set enum(numbering: "(a)")
        + "Nicht alle Äpfel sind giftig." \
        + "Alle Äpfel sind nicht giftig."

        #set enum(numbering: "1.")
        + Können (a) und (b) zusammen wahr sein?
        + Können (a) und (b) zusammen falsch sein?
        + Können (a) und (b) unterschiedliche Wahrheitswerte haben?
    ]
]

#slide[
    = Das logische Quadrat
    #v(1fr)
    #show: figure
    #log-quad(scale-factor: 1.75)
]

#slide[
    #definition[
        Wenn $alpha$ und $beta$ zusammen falsch, aber nicht zusammen wahr sein können, nennt man sie *konträr*.
    ]

    #definition[
        Wenn $alpha$ und $beta$ zusammen wahr, aber nicht zusammen falsch sein können, nennt man sie *subkonträr*.
    ]
]

#slide[
    #definition[
        Wenn $alpha$ und $beta$ immer einen unterschiedlichen Wahrheitswert haben, nennt man sie *kontradiktorisch* (oder auch "widersprüchlich").
    ]
]

#final-slide