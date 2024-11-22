#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.0"
#import "@preview/polylux:0.3.1": *

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: slides.with(
    no: 4,
    title: [Syntax und Semantik von AL],
    date: datetime(
        year: 2024,
        month: 11,
        day: 13
    )
)

#[
#set text(size: 0.9125em)
#goal-slide(goals: ("bilden-hin-not-bedingungen", "beweisen-wahrheitstabelle"))[
    + notwendige und hinreichende Bedingungen bestimmen.
    + korrekte Sätze von AL erkennen und bilden.
    + den Wahrheitswertverlauf von komplexen Aussagen mit Hilfe der Wahrheitstabelle bestimmen.
]
]

#slide[
    = Erwärmung

    #task(time: [Plenum, 5 min.])[
        Bestimmen Sie, ob "ich bin erschöpft" in den folgenden Sätzen jeweils die notwendige oder hinreichende Bedingung ist!

        + Dass ich Sport mache, ist hinreichend dafür, dass ich erschöpft bin.
        + Wenn ich erschöpft bin, mache ich Sport.
        + Nur wenn ich Sport mache, bin ich erschöpft.
        + Wenn ich erschöpft bin, dann bin ich erschöpft.
    ]
]

#slide[
    #set text(size: 0.9em)
    = "Nur" im Wenn-Dann-Satz

    #notice[
        In einem Wenn-Dann-Satz vertauscht das "nur" die hinreichende und notwendige Bedingung.
    ]

    #example[
        "Wenn #underline[ich Sport mache], #strong[bin ich erschöpft]."

        "Nur wenn *ich Sport mache*, #underline[bin ich erschöpft]."

        (*notwendige Bedingung*, #underline[hinreichende Bedingung])
    ]
]

#slide[
    = Einfluss des "nicht" -- dasselbe wie "nur"

    #notice[
        Ein "nur" im Wenn-Dann-Satz kann auch durch ein "nicht" auf beiden Seiten ausgedrückt werden.
    ]

    #show: align.with(center)
    "Nur wenn ich Sport mache, bin ich erschöpft."

    $arrow.b arrow.t$

    "Wenn ich nicht Sport mache, bin ich nicht erschöpft."
]

#slide[
    #task(time: [EA, 5 min.])[
        Geben Sie alternative Formulierungen, die dasselbe bedeuten wie "Wenn ich schlafe, erhole ich  mich."!
    ]
]

#focus-slide[
    Die Syntax der Aussagenlogik
]

#slide[
    #grid(columns: 2, column-gutter: 1cm)[
        #set align(center)
        #image(height: 80%, "img/04-01.jpg")

        #text(size: 0.5em)[
            Jan Vasek: "Plätzchen backen" https://ccnull.de/foto/plaetzchen-backen/1007588. 13.11.2024, 11:28 Uhr.
        ]
    ][
        #task(time: [Plenum, 5 min.])[
            #set par(justify: false)
            Beschreiben Sie das Bild. Nennen Sie Vermutungen, was dies mit dem Syntax von AL zu tun haben könnte!
        ]
    ]
]

#slide[
    #grid(columns: 2, column-gutter: 1cm)[
        #image(height: 80%, "img/04-03-weihnachten.jpg")

        #text(size: 0.25em)[
            Amazon: "COLiJOL Weihnachten Weihnachtsplätzchen-Form-Backen-Formen Edelstahl Formen Set Für Biskuit-Fondant-Kuchen 9Pcs". https://www.amazon.de/COLiJOL-Weihnachten-Weihnachtspl%C3%A4tzchen-Form-Backen-Formen-Edelstahl-Biskuit-Fondant-Kuchen/dp/B09MPX81CL. 13.11.2024, 11:35 Uhr.
        ]
    ][
        #image(height: 80%, "img/04-02-oster.jpg")

        #text(size: 0.25em)[
            Amazon: "Osterhasen Ausstecher,Ausstechformen Ostern,11 Stück Ausstechform Osterhase,Osterplätzchen Ausstecher,Keksausstecher Ostern,Hasen Ausstecher, Osterkekse Plätzchenausstecher für Backen Kindern" https://www.amazon.de/Ausstechformen-Osterpl%C3%A4tzchen-Pl%C3%A4tzchenform-Keksausstecher-Pl%C3%A4tzchenbacken/dp/B083HX4HV1?th=1. 13.11.2024, 11:32 Uhr.
        ]
    ]
]

#slide[
    #set align(horizon + center)
    #image(height: 50%, "img/04-schema1.jpg")

    #task[
        Ordnen Sie diese Plätzchen einem der vorherigen Förmchensets hinzu!
    ]
]

#slide[
    = Plätzchenförmchen und Schemata

    #set align(horizon)
    #grid(columns: (50%, 50%), row-gutter: 0.65em, column-gutter: 1cm)[
        #show: align.with(center)
        *Plätzchen*
    ][
        #show: align.with(center)
        *Aussagenlogik*
    ][][][
        *Ausstecher* geben die Form vor. \
        $ arrow.b $
    ][
        *Schemata* geben die Form vor. \
        $ arrow.b $
    ][
        In die "Löcher" von Formen kommt *Teig* rein. \
        $ arrow.b $
    ][
        In die "Löcher" ($alpha$, $beta$, ...) kommen *AL-Sätze* oder *Satzbuchstaben* rein. \
        $ arrow.b $
    ][
        Es entstehen *Plätzchen*.
    ][
        Es entstehen *AL-Sätze*.
    ]
]

#slide[
    = Plätzchenförmchen und Schemata

    #set align(horizon + center)
    #image("img/04-schema2.jpg", height: 87.5%)
]

#slide[
    = AL-Syntax
    Aus der Vorlesung:
    #image(height: 75%, "img/04-al-syntax.png")
]

#slide[
    = Gruppenpuzzle: Der AL-Syntax
    #task(time: [GA, 10 min.])[
        Erarbeiten Sie in Expertengruppen je 3 Zeichenketten, wovon mindestens einer kein AL-Satz ist! Die Zeichenketten dürfen nur aus folgenden Zeichen bestehen:

        - "$p$", "$q$", "$r$", ...
        - "$not$", "$and$", "$or$", "$->$" und "$<->$"
        - "$($" und "$)$"
    ]
]

#slide[
    = Gruppenpuzzle: Der AL-Syntax
    #task(time: [GA, 10 min.])[
        Stellen Sie in den Stammgruppen Ihre Beispiele vor, sagen Sie aber nicht, welche die AL-Sätze snd und welche keine sind!

        Lassen Sie Ihre Kommiliton*innen bestimmen, ob es sich um korrekte AL-Sätze handelt. (Tipp: Sie können versuchen die Schemata auf https://piepert.github.io/al/ nachzubauen.)
    ]

    Streitfälle werden anschließend im Plenum besprochen.
]

#slide[
    #task(time: [Plenum, 5 min.])[
        Bestimmen Sie, ob es sich um Sätze von AL handelt!

        + $p$
        + $p and q and r$
        + $(p)$
        + $not (p)$
        + $p and q$
    ]
]

#focus-slide[
    Semantik von AL
]

#slide[
    = Wahrheit eines AL-Satzes
    #definition[
        Satzbuchstaben haben einen festgelegten Wahrheitswert.
    ]

    #definition[
        Die Wahrheit eines zusammengesetzten AL-Satzes setzt sich aus der Wahrheit der Teilsätze zusammen.
    ]
]

#slide[
    = Beispiel

    #task(time: [Plenum, 5 min.])[
        $p$ sei wahr, $q$ sei falsch. Bestimmen Sie, welche der folgenden Sätze wahr sind!

        + $p and q$
        + $p -> q$
        + $(p -> q) or not q$
        + $p or not p$
        + $not (q <-> not p)$
    ]
]

#slide[
    = Der Wahrheitswertverlauf

    #definition[
        Die Wahrheitstabelle ist eine Auflistung, unter welchen Belegungen der Einzelaussagen ein Satz wahr oder falsch ist.
    ]

    + #truth-table("(p | q) & -p")
]

#slide[
    #set text(size: 0.9em)
    #task(time: [GA, 15 min.])[
        Erstellen Sie eine Übersicht (z.B. einen Spickzettel für die Klausur) mit den Schritten, wie man die Wahrheitstabelle für einen Ausdruck aufstellt! Gehen Sie dazu auf folgendes ein:

        - Zeichnen der Wahrheitstabelle
        - Eintragen der Wahrheitswerte
        - Hauptjunktor bestimmen
        - Teilsätze auswerten
        - Gesamtsatz auswerten

        Beispiele könnten Sein: "$p and (not q or p)$", "$(r and p) -> not (r and p)$", ...
    ]
]

#slide[
    = Übung

    #task(time: [Plenum, 5 min.])[
        Stellen Sie die Wahrheitstafel für den folgenden AL-Satz auf!

        $((p or not q) and q) -> p$
    ]
]

#focus-slide[
    Fassen Sie in einem Satz zusammen, was Sie aus der heutigen Sitzung mitnehmen!
]