#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.0"

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *

#let tmagenta(body) = text(fill: colors.magenta, body)
#let tblue(body) = text(fill: colors.blue, body)

#show: slides.with(
    no: 2,
    title: [der Argumentbegriff und die Normalform],
    date: datetime(
        year: 2024,
        month: 10,
        day: 30
    )
)

#goal-slide(goals: ("definieren-grundkonzepte", "identifizieren-aussagesätze"))[
    + ... Aussagesätze identifizieren.
    + ... gültige von ungültigen und schlüssige von unschlüssigen Argumenten unterscheiden.
    + ... die Normalform eines Arguments bilden.
]

#focus-slide[
    Aussagesätze
]

#slide[
    = Erwärmung

    #definition[
        Aussagesätze sind Sätze, die entweder wahr oder falsch sein können.
    ]
]

#slide[
    = Erwärmung

    #task(time: [Plenum, 5 min.])[
        Entscheiden Sie, ob es sich um einen Aussagesatz handelt:
        + Heute findet kein Logik-Tutorium statt.
        + Warum sitzen wir dann hier?
        + Lasst uns an die frische Luft gehen!
        + $x$ ist heute auch dabei.
        + wahr
    ]
]

#focus-slide[
    Gute, gültige und schlüssige Argumente
]

#slide[
    = Was ist eigentlich ein "gutes" Argument?
    #set text(size: 0.95em)

    #example(normalform[
        Fleisch liefert wichtige Vitamine.][
        Also sollten wir alle Fleisch essen.])

    #task(time: [Plenum, 5 min.])[
        + Bewerten Sie das Argument!
        + Schlagen Sie eine Verbesserung vor!
    ]
]

#slide[
    = Methodisch: Das Gruppenpuzzle

    #figure(image("img/02-gruppenpuzzle.png", width: 67.5%))
]

#slide[
    = Arten von Argumenten

    #task(time: [Expertengruppen, 15 min.])[
        Lesen Sie zuerst alleine Ihr Material, erarbeiten Sie danach gemeinsam eine Definition inklusive kleiner Beschreibung oder Probe in der Expertengruppe für ihr jeweiliges Thema:
        #set enum(numbering: "(M1)")
        + deduktive Gütligkeit
        + induktive/nicht-deduktive Gültigkeit
        + Schlüssigkeit
    ]
]

#slide[
    = Arten von Argumenten

    #set text(size: 0.9em)
    #task(time: [Stammgruppen, 10 min.])[
        Ordnen Sie in Ihren Stammgruppen die Argumente aus M4 mit Hilfe Ihrer Definitionen in das folgende Muster ein:
    ]

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

#slide[
    #set text(size: 0.9em)
    #notice[
        In allen folgenden Tutorien wird unter *Gültigkeit* die *deduktive Gültigkeit* verstanden.
    ]

    #notice[
        Wir bewerten Argumente anhand ihrer Gültigkeit und Schlüssigkeit. Möchte man ein Argument kritisieren, muss man eines dieser beiden anzweifeln und zeigen, dass es entweder nicht gültig, oder nicht schlüssig ist.
    ]
]

#focus-slide[
    Normalform von Argumenten
]

#slide[
    #set text(size: 0.89em)
    #task(time: [5 min.])[
        Erklären Sie, was Ihnen einen Vergleich (z.B. in Bezug auf Anzahl der Prämissen, Gültigkeit und Schlüssigkeit oder die logische Form) zwischen den folgenden Argumenten erschwert.
    ]

    + Kein Mensch ist sterblich oder Fisch ist leicht verderblich. Es ist aber nicht so, dass kein Mensch sterblich ist. Also ist Fisch leicht verderblich.
    + Einstein hat Recht, denn Einstein oder Newton haben Recht. Und Newton hat nicht Recht.
    + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist keine Wissenschaft, denn eine richtige Geisteswissenschaft ist sie sicher nicht.
]

#slide[
    = Herstellen der Normalform
    #set text(size: 0.8125em)
    #show: columns.with(2)
    #hint[
        Hinweiswörter für Konklusionen:
        - also, ergo
        - folglich, infolgedessen, demzufolge, somit
        - daher, deshalb, darum
        - aus .. folgt ...
        - aus ... lässt sich ableiten/ist zu schließen, dass ...
        - ... beweist/zeigt/rechtfertigt/impliziert, dass ...
    ]

    #hint[
        Hinweiswörter für Prämissen:
        - da
        - weil
        - denn
        - nämlich
        - aufgrund
        - infolge
        - wegen
    ]
]

#slide[
    = Herstellen der Normalform
    + Kein Mensch ist sterblich oder Fisch ist leicht verderblich. Es ist aber nicht so, dass kein Mensch sterblich ist. *Also* ist Fisch leicht verderblich.

    + Einstein hat Recht, *denn* Einstein oder Newton haben Recht. Und Newton hat nicht Recht.

    + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist *damit* keine Wissenschaft, *weil* sie sicher keine richtige Geisteswissenschaft ist.
]

#slide[
    = Herstellen der Normalform
    (#tmagenta[Prämissen sind rot.] #tblue[Konklusion ist blau.])

    1. #tmagenta[Kein Mensch ist sterblich oder Fisch ist leicht verderblich]. #tmagenta[Es ist aber nicht so, dass kein Mensch sterblich ist]. *Also* #tblue[ist Fisch leicht verderblich].

    #inference-raw(```
    Kein Mensch ist sterblich oder Fisch ist leicht verderblich.
    Es ist nicht so, dass kein Mensch sterblich ist.
    ----
    Fisch ist leicht verderblich.
    ```)
]

// Die anderen beiden Beispiele als Aufwärmung und Aufhänger für die folgende Sitzung
/*
#slide[
    = Herstellen der Normalform
    2. #tblue[Einstein hat Recht], *denn* #tmagenta[Einstein oder Newton haben Recht]. Und #tmagenta[Newton hat nicht Recht].

    #inference-raw(```
    Einstein oder Newton haben Recht.
    Newton hat nicht Recht.
    ----
    Einstein hat Recht.
    ```)
]

#slide[
    = Herstellen der Normalform
    3. #tmagenta[Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft]. #tblue[Philosophie ist] *damit* #tblue[keine Wissenschaft], *weil* #tmagenta[sie sicher keine Geisteswissenschaft ist].

    #inference-raw(```
    Philosophie ist eine Geisteswissenschaft oder sie ist gar keine Wissenschaft.
    Philosophie ist keine Geisteswissenschaft.
    ----
    Philosophie ist keine Wissenschaft.
    ```)
]
*/

#slide[
    = Normalform-Algorithmus
    Es gibt kein Backrezept für die Normalform, trotzdem helfen Hinweiswörter! Mit der Zeit entwickelt man ein Gefühl dafür.

    + Hinweiswörter suchen.
    + Konklusion identifizieren.
    + Prämissen sammeln und in beliebiger Reihenfolge aufschreiben.#footnote[Meist wird mit der Reihenfolge der Prämissen schon etwas beabsichtigt, daher macht es Sinn, die Prämissen in der Reihenfolge aufzuschreiben, in der sie aufgezählt worden sind.]
    + Zuerst alle Prämissen, dann ein "Also:" und dahinter die Konklusion. Anstatt des "Also:" kann auch ein langer Strich dienen.
]

#slide[
    = Normalform: Übung 1/2

    #task(time: [PA, 10 min.])[
        Formulieren Sie die Normalformen in Ihrem Arbeitsblatt M5 in eine natürlicher wirkende Textform! Sie dürfen kreativ werden.
    ]

    #figure(diagram(
        spacing: 4em,
        node((0,0), align(left, normalform[Blabla][Haha][Tata])),

        edge((0,0), (1,0), "-|>"),
        node((1,0), [Blabla. *Also* Tata, *denn* Haha.]),
    ))
]

#slide[
    = Normalform: Übung 2/2

    #task(time: [PA, 10 min.])[
        + Tauschen Sie Ihre Formulierung mit Ihrem Partner!
        + Bringen Sie die natürliche Form der Argumente Ihres Partners wieder in die Normalform!
    ]

    #figure(diagram(
        spacing: 4em,
        node((0,0), [Blabla. *Also* Tata, *denn* Haha.]),

        edge((0,0), (1,0), "-|>"),
        node((1,0), align(left, normalform[Blabla][Haha][Tata])),
    ))
]

#focus-slide[
    Fassen Sie in einem Satz zusammen, was Sie aus der heutigen Sitzung mitnehmen!
]