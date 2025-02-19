#import "@preview/cetz:0.3.0"

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#show raw.where(lang: "inference"): it => inference-raw(it)

#show: slides.with(
    no: 8,
    title: [die Prädikatenlogik und das relationale Modell der Welt],
    date: datetime(
        year: 2024,
        month: 12,
        day: 11
    )
)

#show figure: it => v(-1cm) + align(horizon + center, it)

#goal-slide(goals: ("formalisieren-pl",))[
    + ... einfache Aussagesätze prädikatenlogisch formalisieren.
    + ... einfache Aussagesätze mit Quantoren formalisieren.
]

#focus-slide[
    Auswertung Probeklausur und Zwischenstand
]

#slide[
    = Erwärmung
    #task(time: [10 min.])[
        Beweisen Sie die beiden folgenden Schlüsse mit dem KdnS!

        + #inference-raw(```
        $(p or q) -> r$
        ----
        $(p and q) -> r$
        ```)

        + #inference-raw(```
        $p and q$
        ----
        $p -> q$
        ```)
    ]
]

#focus-slide[
    Die Apologie des Sokrates
]

#slide[
    #set text(size: 0.85em)
    #blockquote[
        / Sokrates: [Die Anklage] lautet etwa folgendermaßen: "Sokrates vergeht sich wider die Gesetze, indem er die Jugend verdirbt und nicht an die vaterländischen Götter glaubt, sondern einem Glauben an eine neue Art von Dämonentum huldigt." [...]
        / Sokrates: Die Dämonen aber — halten wir sie nicht entweder für Götter oder für Sprößlinge der Götter? Gibst du es zu oder nicht?
        / Meletos: Gewiß.
        / Sokrates: Wenn ich also, wie du zugibst, an Dämonen glaube, und die Dämonen eine Art Götter sind, so wäre das ja eben jenes Rätsel- und Scherzspiel, auf das du es nach meiner Behauptung angelegt hast: denn ich, der ich nach deiner Aussage an keine Götter glaube, soll doch anderseits wieder an Götter glauben.
    ][Platon: Apologie des Sokrates. 24b--27d. Übers. v. Otto Apelt.]
]

#slide[
    = Sokrates' Daimonen-Argument
    #task(time: [Plenum, 5 min.])[
        Beurteilen Sie die Gültigkeit des folgenden Schlusses!
    ]

    #inference-wl[
        Alle Daimonen sind Kinder von Göttern.][
        Es gibt Daimonen.][
        Es gibt Götter.]
]

#slide[
    = Sokrates' Daimonen-Argument
    #task(time: [Plenum, 5 min.])[
        Beweisen Sie den folgenden Schluss mit dem aussagenlogischen KdnS!
    ]

    #inference-wl[
        Alle Daimonen sind Kinder von Göttern.][
        Es gibt Daimonen.][
        Es gibt Götter.]
]

#focus-slide[
    Nominatoren und Prädikatoren
]

#slide[
    = Genauere Sprachanalyse
    #example[
        #inference-wl[
            Jede Amazone ist ein Mensch.][
            Alice ist eine Amazone.][
            Alice ist ein Mensch.]
    ]

    - *Bisher:* Unterteilung in Junktoren und Einzelaussagen.
    - *Aber:* Hier kommen gar keine Junktoren vor.
    - *Daher:* Wir müssen die Bestandteile finden, die den Schluss gültig machen!
]

#slide[
    #task(time: [GA, 15 min.])[
        Erarbeiten Sie in Gruppenarbeit eine Übersicht über die Bestandteile der Prädikatenlogik! (M1 gibt eine unausgefüllte Vorlage vor.)

        Klären Sie dabei folgende Begriffe:
        - Nominator (Individuenkonstanten & -variablen)
        - Prädikator (Prädikate)
        - Existenzquantor
        - Allquantor

        Erklären Sie, wie man Aussagen in PL bildet!
    ]
]

#slide[
    #set text(size: 0.925em)
    #task(time: [PA, 5 min.])[
        Übersetzen Sie die die folgenden PL-Sätze zurück in die natürliche Sprache!

        #grid(columns: 2, column-gutter: 1em)[
            $R x$: $x$ ist eine Reinigungskraft. \
            $L x y$: $x$ und $y$ leiten gemeinsam eine Reinigungsfirma.
        ][
            $a$: Alice \
            $b$: Bob
        ]

        + $R a$
        + $R a and R b and L a b$
        + $exists x R x$
        + $forall x R x$
        + $exists x exists y (R x and R y and L x y)$
    ]
]

#slide[
    #task(time: [PA, 5 min.])[
        Formalisieren Sie die folgenden Aussagen in PL!

        + Alice und Bob leiten gemeinsam keine Reinigungsfirma.
        + Wenn Bob eine Reinigungskraft ist, dann auch Alice.
        + Es gibt keine Reinigungskräfte.
        + Es gibt Dinge, die keine Reinigungskräfte sind.
        + Alle Reinigungskräfte leiten zusammen eine Firma.
    ]
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

#final-slide