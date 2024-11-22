#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.0"
#import "@preview/polylux:0.3.1": *

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

#goal-slide(goals: ("formalisieren-al", "bestimmen-hin-not-bedingungen"))[
    #set text(size: 0.9125em)
    + einfache Aussagesätze formalisieren.
    + die aussagenlogischen Junktoren anhand der Wahrheitstabelle erklären.
    + hinreichende und notwendige Bedingungen in Wenn-Dann-Sätzen bestimmen.
]

#slide[
    = Erwärmung
    #set text(size: 0.875em)
    #task(time: [GA, 5 min.])[
        Stellen Sie die Normalform der folgenden Argumente her!
    ]

    + Peter ist sterblich oder Fisch ist leicht verderblich. Es ist aber nicht so, dass Peter sterblich ist. Also ist Fisch leicht verderblich.

    + Einstein hat Recht, denn Newton oder Einstein haben Recht. Und Newton hat nicht Recht.

    + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist damit keine Wissenschaft, weil sie sicher keine richtige Geisteswissenschaft ist.
]

#slide[
    #set text(size: 0.9em)
    #task(time: [GA, 2 min.])[
        Zeigen Sie die Gültigkeit bzw. Ungültigkeit der Argumente anhand der Probe!
    ]

    #set text(size: 0.9em)
    #grid(columns: 2, column-gutter: 0.5em,

        [1. #inference-wl[
            Peter ist sterblich oder\ Fisch ist leicht verderblich.][
            Es ist nicht der Fall, dass Peter ist sterblich.][
            Fisch ist leicht verderblich.]],

        [2. #inference-wl[
            Newton hat Recht\ oder Einstein hat Recht.][
            Newton hat nicht Recht.][
            Einstein hat Recht]])

        3. #inference-wl[
            Philosophie ist eine Geisteswissenschaft oder Philosophie ist keine Wissenschaft.][
            Philosophie ist keine Geisteswissenschaft.][
            Philosophie ist keine Wissenschaft.]
]

#focus-slide[
    Die logische Form
]

#slide[
    #let tred = highlight.with(fill: magenta.lighten(75%))
    #let tblue = highlight.with(fill: blue.lighten(75%))
    #let tyellow = highlight.with(fill: yellow.lighten(75%))

    = Der Tafelschwammtest
    #set text(size: 0.8em)
    #set par(spacing: 1.5em)

    #grid(columns: (1fr, auto), row-gutter: 1.25em)[
        1. #inference-wl[
                #tred[Peter ist sterblich] oder #tblue[Fisch ist leicht verderblich].][
                Es ist nicht der Fall, dass #tred[Peter ist sterblich].][
                #tblue[Fisch ist leicht verderblich].]
    ][
        (habt ihr bewiesen)
    ]
]

#slide[
    #let tred = highlight.with(fill: magenta.lighten(75%))
    #let tblue = highlight.with(fill: blue.lighten(75%))
    #let tyellow = highlight.with(fill: yellow.lighten(75%))

    = Der Tafelschwammtest
    #set text(size: 0.8em)
    #set par(spacing: 1.5em)

    #grid(columns: (1fr, auto), row-gutter: 1.25em)[
        1. #inference-wl[
                #tred[Peter ist sterblich] oder #tblue[Fisch ist leicht verderblich].][
                Es ist nicht der Fall, dass #tred[Peter ist sterblich].][
                #tblue[Fisch ist leicht verderblich].]
    ][
        (habt ihr bewiesen)
    ][
        2. #inference-wl[
                #tred[Newton hat Recht] oder #tblue[Einstein hat Recht].][
                Es ist nicht der Fall, dass #tred[Newton Recht hat].][
                #tblue[Einstein hat Recht]]
    ][
        (habt ihr bewiesen)
    ]
]

#slide[
    #let tred = highlight.with(fill: magenta.lighten(75%))
    #let tblue = highlight.with(fill: blue.lighten(75%))
    #let tyellow = highlight.with(fill: yellow.lighten(75%))

    = Der Tafelschwammtest
    #set text(size: 0.8em)
    #set par(spacing: 1.5em)

    #grid(columns: 2, row-gutter: 1.25em)[
        1. #inference-wl[
                #tred[Peter ist sterblich] oder #tblue[Fisch ist leicht verderblich].][
                Es ist nicht der Fall, dass #tred[Peter ist sterblich].][
                #tblue[Fisch ist leicht verderblich].]
    ][
        (habt ihr bewiesen)
    ][
        2. #inference-wl[
                #tred[Newton hat Recht] oder #tblue[Einstein hat Recht].][
                Es ist nicht der Fall, dass #tred[Newton Recht hat].][
                #tblue[Einstein hat Recht]]
    ][
        (habt ihr bewiesen)
    ][
        3. #inference-wl[
                #tred[Philosophie ist eine Geisteswissenschaft] oder #tblue[Philosophie ist keine Wissenschaft].][
                Es ist nicht der Fall, dass #tred[Philosophie ist eine Geisteswissenschaft ist].][
                #tblue[Philosophie ist keine Wissenschaft].]
    ][
        (habt ihr Bewiesen)
    ]
]

#slide[
    #let tred = box.with(outset: 5pt,
        fill: magenta.lighten(75%))
    #let tblue = box.with(outset: 5pt,
        fill: blue.lighten(75%))
    #let tyellow = box.with(outset: 5pt,
        fill: yellow.lighten(75%))

    = Der Tafelschwammtest
    #set text(size: 0.9em)
    #set par(spacing: 1.5em)

    + #inference-wl[
            #tred[$p$] oder #tblue[$q$].][
            Es ist nicht der Fall, dass #tred[$p$].][
            #tblue[$q$]]

    + #inference-wl[
            #tred[$p$] oder #tblue[$q$].][
            Es ist nicht der Fall, dass #tred[$p$].][
            #tblue[$q$]]

    + #inference-wl[
            #tred[$p$] oder #tblue[$q$].][
            Es ist nicht der Fall, dass #tred[$p$].][
            #tblue[$q$].]
]

#slide[
    #task(time: [Plenum: 5 min.])[
        Nehmen Sie Stellung zur folgenden These:

        "Eigentlich kommt es bei Gültigkeit gar nicht darauf an, was die Einzelaussagen genau bedeuten. Solange ich die Struktur eines gültigen Argumentes beibehalte, kann ich die Einzelaussagen durch das austauschen, was auch immer ich will, das Argument bleibt gültig."
    ]
]

#focus-slide[
    Aussagenlogische Formalisierung
]

#slide[
    #task(time: [Expertengruppen, 7 min.])[
        Sammeln Sie aus den Aussagesätzen in Ihrem Material die Ihnen bekannten logischen Operationen heraus und erarbeiten Sie die folgenden Merkmale mit Hilfe des Skripts, euren Aufzeichnungen und der Vorlesung:
            - Name des Junktors/der logischen Operation
            - Beispiele in der natürlichen Sprache
            - Zeichen der Sprache AL
            - Wahrheitsbedingungen (Wahrheitstabelle, einfacher Merksatz)
    ]
]

#slide[
    #task(time: [Stammgruppen, 8 min.])[
        Erstellen Sie eine Übersicht aller aussagenlogischen Operationen, in der Sie die vorherigen Merkmale mit aufnehmen.
    ]
]

/*
// Nächstes Mal

#slide[
    #task(time: [Plenum, 5 min.])[
        Angenommen "Die Sonne scheint." wäre falsch und "Es regnet." wäre wahr. Welche der folgenden Aussagen sind dann wahr?

        + Die Sonne scheint und es regnet.
        + Die Sonne scheint oder es regnet.
        + Wenn es regnet, dann scheint die Sonne.
        + Es regnet, gdw. die Sonne scheint.
        + Wenn die Sonne scheint, dann regnet es.
    ]
]
*/

#let tred = box.with(outset: 5pt,
    fill: magenta.lighten(75%))
#let tblue = box.with(outset: 5pt,
    fill: blue.lighten(75%))
#let tyellow = box.with(outset: 5pt,
    fill: yellow.lighten(75%))

#let tredbox = box.with(outset: 5pt,
    fill: magenta.lighten(75%))
#let tbluebox = box.with(outset: 5pt,
    fill: blue.lighten(75%))
#let tyellowbox = box.with(outset: 5pt,
    fill: yellow.lighten(75%))

#slide[
    = Formalisieren in 3 Schritten
    + Einzelaussagen identifizieren

    Genau dann, wenn ich ins Bett gehe, bin ich müde oder ich bin krank.
]

#slide[
    = Formalisieren in 3 Schritten
    + Einzelaussagen identifizieren

    Genau dann, wenn #tblue[ich ins Bett gehe], #tred[bin ich müde] oder #tyellow[ich bin krank].
]

#slide[
    = Formalisieren in 3 Schritten
    + Einzelaussagen identifizieren
    + Zuordnungsverzeichnis anlegen

    Genau dann, wenn #tblue[ich ins Bett gehe], #tred[bin ich müde] oder #tyellow[ich bin krank].

    $p$: #tblue[Ich gehe ins Bett.] \
    $q$: #tred[Ich in müde.] \
    $r$: #tyellow[Ich bin krank.]
]

#slide[
    = Formalisieren in 3 Schritten
    + Einzelaussagen identifizieren
    + Zuordnungsverzeichnis anlegen
    + Richtige Junktoren verwenden

    Genau dann, wenn #tblue[ich ins Bett gehe], #tred[bin ich müde] oder #tyellow[ich bin krank].

    $p$: #tblue[Ich gehe ins Bett.] \
    $q$: #tred[Ich in müde.] \
    $r$: #tyellow[Ich bin krank.]

    $#tbluebox($p$) <-> #tredbox($q$) or #tyellowbox($r$)$
]

#slide[
    #task(time: [EA, 5 min.])[
        Formalisieren Sie die folgenden Sätze!

        + Die Sonne scheint und es regnet.
        + Die Sonne scheint oder es regnet.
        + Wenn es schön ist, dann scheint die Sonne und es regnet nicht.
        + Es regnet, gdw. die Sonne scheint.
    ]
]

#focus-slide[
    Notwendige und hinreichende Bedingungen
]

#slide[
    = Das Konditional

    #definition[
        In Wenn-Dann-Sätzen *ohne "nur"* ist der Wenn-Teil die hinreichende und der Dann-Teil die notwendige Bedingung.
    ]

    #definition[
        In Wenn-Dann-Sätzen *mit "nur"* vertauschen sich notwendige und hinreichende Bedingung.
    ]
]

#slide[
    == Hinreichende Bedingung: $underline(p) -> q$
    *"Hinreichend" heißt*: Es reicht zu wissen, dass sie der Fall ist, um zu wissen, dass die notwendige Bedingung der Fall ist.

    #align(center + horizon,)[
        #cetz.canvas({
            import cetz.draw: *
            content((-0.1, 0), [ein Kind lacht])
            content((-0.3, 1.5), [jemand verliebt sich])
            content((-0.4, -1.5), [eine Freundschaft entsteht])

            content((15, 0), [ein Herz wird erwärmt])

            set-style(mark: (end: ">", fill: black, size: 0.3))
            line((3.75, 1.5), (10.5, 0.25))
            line((2.75, 0), (10.5, 0))
            line((4.75, -1.5), (10.5, -0.25))
        })

        $underline(p) -> q$
    ]
]

#slide[
    == Notwendige Bedingung: $p -> underline(q)$
    *"Notwendig" heißt:* Diese Bedingung *muss* wahr sein, damit überhaupt irgendeine der hinreichenden Bedingungen wahr sein kann.

    #align(center + horizon,)[
        #cetz.canvas({
            import cetz.draw: *
            content((-0.1, 0), [ein Kind lacht])
            content((-0.1, 1.5), [jemand verliebt sich])
            content((-0.1, -1.5), [eine Freundschaft entsteht])

            content((15, 0), [ein Herz wird erwärmt])

            set-style(mark: (end: ">", fill: black, size: 0.3))
            line((3.75, 1.5), (10.5, 0.25))
            line((2.75, 0), (10.5, 0))
            line((4.75, -1.5), (10.5, -0.25))
        })

        $p -> underline(q)$
    ]
]

#slide[
    == Notwendige Bedingung: $p -> underline(q)$
    _Oder auch:_ Wenn die notwendige Bedingung falsch ist, ist auch die hinreichende falsch.

    #align(center + horizon,)[
        #cetz.canvas({
            import cetz.draw: *
            content((-0.6, 0), [$not$ ein Kind lacht])
            content((-0.6, 1.5), [$not$ jemand verliebt sich])
            content((-0.6, -1.5), [$not$ eine Freundschaft entsteht])

            content((15.5, 0), [$not$ ein Herz wird erwärmt])

            set-style(mark: (start: ">", fill: black, size: 0.3))
            line((3.75, 1.5), (10.5, 0.25))
            line((2.75, 0), (10.5, 0))
            line((4.75, -1.5), (10.5, -0.25))
        })

        $not underline(q) -> not p$
    ]

    (*Zwischenfrage:* Wenn "$q$" die notwendige Bedingung ist, ist "$not q$" dann notwendig oder hinreichend?)
]

#slide[
    == Beispiele
    #set text(size: 0.95em)
    #task(time: [Plenum, 5 min.])[
        Bestimmen Sie, ob "die Blätter fallen" die notwendige oder die hinreichende Bedingung in den folgenden Sätzen ist:

        + Wenn es Herbst ist, fallen die Blätter.
        + Wenn die Blätter fallen, ist es Herbst.
        + Fallen die Blätter, so ist es Herbst.
        + Wenn die Blätter nicht fallen, ist es nicht Herbst.
        + Es fallen die Blätter, wenn es Herbst ist.
        + Nur wenn die Blätter fallen, ist es Herbst.
    ]
]