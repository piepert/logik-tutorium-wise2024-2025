#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.0"
#import "@preview/polylux:0.3.1": *

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: slides.with(
    no: 5,
    title: [die Wahrheitstabelle und Vertiefung AL-Formalisierung],
    date: datetime(
        year: 2024,
        month: 11,
        day: 20
    )
)

#[
#set text(size: 0.85em)
#goal-slide(goals: ("formalisieren-al", "beweisen-wahrheitstabelle"))[
    + logische Wahrheit, Folgerung und Äquivalenz mit der Wahrheitstafel bestimmen.
    + Aussagesätze formalisieren.
    + den Wahrheitswertverlauf von komplexen Aussagen mit Hilfe der Wahrheitstabelle bestimmen.
]
]

#focus-slide[
    Quiz!
]

#focus-slide[
    Wahrheitstafel
]

#slide[
    #set text(size: 0.9em)
    #task(time: [GA, 10 min.])[
        Erstellen Sie eine Übersicht (z.B. einen Spickzettel für die Klausur) mit den Schritten, wie man die Wahrheitstabelle für einen Ausdruck aufstellt! Gehen Sie dazu auf folgendes ein:

        - Zeichnen der Wahrheitstabelle
        - Eintragen der Wahrheitswerte
        - Hauptjunktor bestimmen
        - Teilsätze auswerten
        - Gesamtsatz auswerten

        Beispiele könnten sein: "$p and (not q or p)$", "$(r and p) -> not (r and p)$", ...
    ]
]

#slide[
    #task(time: [Plenum, 5 min.])[
        Stellen Sie die Wahrheitstafel für den folgenden AL-Satz auf!

        $((p or not q) and not p) -> not q$
    ]
]

#slide[
    = Besondere Fälle der Wahrheitstafel
    #task(time: [Expertengruppen, 10 min.])[
        Definieren Sie ihren Begriff mit Hilfe Ihres Materials M1--M4, dem Skript und den Vorlesungsfolien! Erklären Sie anhand eines Beispiels, wie Sie dies innerhalb der Wahrheitstabelle erkennen!
        #set enum(numbering: "(M1)")
        + Logische Wahrheit
        + Logische Falschheit und Erfüllbarkeit
        + Logische Folgerung
        + Logische Äquivalenz
    ]
]

#slide[
    #task(time: [Stammgruppen, 15 min.])[
        Präsentieren Sie Ihre Ergebnisse untereinander und bearbeiten Sie die Aufgaben auf Material M5!
    ]
]

#focus-slide[
    Vertiefung Formalisierung
]

#slide[
    #set text(size: 0.975em)
    #task(time: [EA, 10 min.])[
        Formalisieren Sie die folgenden Sätze in die Sprache AL! (Vergessen Sie das Zuordnungsverzeichnis nicht!)
        + Wenn es nicht regnet, wird die Straße trotzdem nass.
        + Wenn Alice oder Bob nicht nach Hause gehen, sind nicht beide zu Hause.
        + Weder Alice noch Bob sind zu Hause.
        + Nur wenn die Sonne aufgeht, wird es hell.
        + Alice liebt Bob nicht, gdw. Bob nicht Alice liebt.
    ]
]

#slide[
    #task(time: [PA, 10 min.])[
        Formalisieren Sie die Schlüsses auf dem Material M6 und prüfen Sie mit Hilfe der Wahrheitstafel, ob es sich um logische Folgerung handelt!
    ]
]

#focus-slide[
    Fassen Sie in einem Satz zusammen, was Sie aus der heutigen Sitzung mitnehmen!
]