#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *
#import "/src/packages/log-quad.typ": *

#show raw.where(lang: "inference"): it => inference-raw(it)

#show: slides.with(
    no: 10,
    title: [Beweise mit dem prädikatenlogischen KdnS],
    date: datetime(
        year: 2025,
        month: 1,
        day: 8
    )
)

#goal-slide(goals: ("formalisieren-pl", "beweisen-kdns-pl"))[
    + ... einfache Aussagesätze mit Quantoren formalisieren.
    + ... die Regeln QT, $forall$-Bes., $exists$-Einf. anwenden.
    + ... die Regeln $forall$-Einf., $exists$-Bes. und ihre Einschränkungen erklären.
]

#slide[
    = Organisation
    #set text(size: 0.875em)
    + Klausurtermin:
        - *Zeit:* Di., der 4. Februar 2025, 12:00 Uhr (Start um genau 12:30 Uhr)\ *Ort:* Parkstraße 6, HS 3
        - *Amtlichen Lichtbildausweis mitbringen!* (Perso, Reisepass, ...)

    + Wie/Wann zweite Probeklausur?
        - *Form:* unter Klausurbedingungen im Tut oder als Aufgabenblatt in Heimarbeit?
        - *Datum:* 15.1.2025 vs. 22.1.2025 (vorletztes Tut)?

    *Erinnerung:* Themen zur Wiederholung im Tut über Mail an #link("mailto:tristan.pieper@uni-rostock.de") oder anonym per https://evasys.uni-rostock.de/evasys/online.php?p=tplt2324 melden.
]

#slide[
    #let org = ref-goal
    #let ref-goal(b) = text(fill: purple, [[#org(b)]])
    = Klausurhinweise
    #set text(size: 0.875em)
    *Aufgabentypen in der Klausur* #h(1fr) *Ziele im Tut*
    + Aussagesätze identifizieren #h(1fr) #ref-goal("identifizieren-aussagesätze")
    + Definition von Grundkonzepten #h(1fr) #ref-goal("definieren-grundkonzepte")
    + Aussagenlogische Formalisierung #h(1fr) #ref-goal("formalisieren-al")
    + Wenn-Dann-Sätze, "nur", notw. und hinr. Bed. #h(1fr) #ref-goal("identifizieren-hin-not-bedingungen"), #ref-goal("bestimmen-hin-not-bedingungen"), #ref-goal("bilden-hin-not-bedingungen")
    + Wahrheitstafel für logische Wahrheit, Folgerung und Äquivalenz #h(1fr) #ref-goal("beweisen-wahrheitstabelle")
    + Beweise mit dem AL-KdnS #h(1fr) #ref-goal("beweisen-kdns-al")
    + Kombination aus 3. und 6.
    + Prädikatenlogische Formalisierung #h(1fr) #ref-goal("formalisieren-pl")
    + Aufgaben zum logischen Quadrat #h(1fr) #ref-goal("ausfüllen-log-quad")
    + Beweise mit dem PL-KdnS #h(1fr) #ref-goal("beweisen-kdns-pl")
    + Kombination aus 8. und 10.
]

/*
#slide[
    = Erwärmung
    #task(time: [EA, 5 min.])[
        Bringen Sie den folgenden Schluss in die Normalform!

        "Entweder ist das menschliche Handeln determiniert oder nicht. Ist es aber undetimiert, dann ist es zufällig. Also ist die Auffassung, menschiches Handeln sei frei, widerlegt. Denn menschliches Handeln ist nur dann frei, wenn es weder zufällig noch determiniert ist."
        // "Der Juwelier wurde von einem Einbrecher oder von seiner eifersüchtigen Ehefrau umgebracht. Seine Frau kann ihn nur dann ermordet haben, wenn sie zur Tatzeit in der Stadt war. Die eifersüchtige Ehefrau war zur Tatzeit nicht in der Stadt, also muss der Juwelier von einem Einbrecher ermordet worden sein."
    ]
]

*/

#slide[
    = Erwärmung
    #task(time: [EA, 5 min.])[
        Formalisieren Sie die folgenden Sätze mit der Prädikatenlogik!

        + Bob ist ein Nachfahre von Alice.
        + Wenn Alice ein Nachfahre von Clarissa ist, dann auch Bob.
        + Bob ist Nachfahre von niemandem.
        + Jeder ist ein Nachfahre von irgendwem.
    ]
]

#focus-slide[
    Der prädikatenlogische KdnS
]

#slide[
    = Beweisen von gültigen Schlüssen
    #set text(size: 0.925em)
    In AL:
    - in AL per Wahrheitstabelle oder durch Ableitung im KdnS
    - Wahrheitstabelle ist eine _semantische_ Beweismethode, sie nutzt die Definitionen der Bedeutung der Junktoren
    - KdnS ist eine _syntaktische_ Beweismethode, bei der wir mit Zeichen rumhantieren und Sätze umformen, Folgerbarkeit wird durch Ableitbarkeit gezeigt

    In PL:
    - wir haben auch hier Semantik! Aber wir haben keine Wahrheitstabelle, dafür ist PL zu komplex
    - semantische Beweise machen Informatiker, das sieht eher so aus...
]

#slide[
    #place(center + horizon, rotate(25deg, block(
        inset: 10pt,
        stroke: 5pt + magenta.transparentize(75%),
        text(
            size: 2.5em,
            weight: "bold",
            fill: magenta.transparentize(75%))[
                Nicht klausurrelevant
            ]
        ))
    )

    #grid(columns: (20%, 80%))[
        Theorem:
        #inference-raw(```
        $forall x F x$
        ----
        $F a$
        ```)
    ][
        #set text(size: 0.75em)
        + Angenommen das Theorem wäre falsch. Also gäbe es ein Modell $M = angle.l cal(F), D angle.r$ sodass $[|forall x F x|]^M = al.true$ während $[|F a|]^M = al.false$.
        + Es soll daher zum einen gelten: $[|forall x F x|]^M = al.true$
            #set enum(numbering: "a)")
            + $[|forall x F x|]^M = al.true$ gilt, gdw. alle $x in D$ auch $x in [|F|]^M$ sind.
            + Da $[|forall x F x|]^M = al.true$, gilt dass alle $x in D$ auch $x in [| F |]^M$ sind.
            + Daher gilt $D subset.eq [|F|]^M$.
        + Zum anderen soll gelten: $[| F a |]^M = al.false$
            #set enum(numbering: "a)")
            + $[| F a |]^M = al.false$ gdw. $[|a|]^M in.not [|F|]^M$
            + Da $a in D$ ist, gibt es also ein $x in D$, das $x in.not [| F |]^M$ ist.
            + Daher gilt $D subset.eq.not [|F|]^M$.
        + 2c) und 3c) widersprechen sich.
        + Widersprüche folgen nur aus Falschem.
        + Der Widerspruch folgte aus der Annahme, das Theorem wäre falsch.
        + Also ist es falsch anzunehmen, dass das Theorem falsch ist.
        + Also ist das Theorem wahr.
    ]
]

#slide[
    = Der prädikatenlogische KdnS
    #set text(size: 0.9em)
    *Fazit:* Ableiten ist für Philosophen vollkommen ausreichend, geht schnell und ist nachvollziehbar. \
    *Idee:* Wir wollen am besten alle unsere AL-Regeln mitnehmen.

    #example[
        #columns[
            #inference-raw(```
            $A a -> not B a$
            $A a$
            ----
            $not B a$
            ```)
            #colbreak()
            $A x$: $x$ ist ein Apfel. \
            $B x$: $x$ ist eine Birne. \
            $a$: dieser Apfel dort
        ]
    ]

    Welche AL-Regel beweist die Gültigkeit des Schlusses?
]

#slide[
    = Der prädikatenlogische KdnS
    #set text(size: 0.9em)

    #example[
        #show: columns
        #inference-raw(```
        $forall x (A x -> not B x)$
        $A a$
        ----
        $not B a$
        ```)
        #colbreak()
        $A x$: $x$ ist ein Apfel. \
        $B x$: $x$ ist eine Birne. \
        $a$: dieser Apfel dort
    ]

    #notice[
        Modus ponens kann nicht angewendet werden, denn er ist keine #super[T]-Regel und die erste Prämisse entspricht nicht dem Schema der Regel!
    ]
]

#slide[
    = Der prädikatenlogische KdnS
    #notice[
        Das logische Quadrat kann als Darstellung für diese 5 folgenden der insgesamt 6 neuen PL#sym.wj;-#sym.wj;Regeln verwendet werden.
    ]

    #set align(center)
    #show figure.caption: set text(size: 0.75em)
    #show figure.caption: it => it.body
    #show figure: block.with(stroke: 1pt, inset: 0.5em)
    #stack(dir: ltr,
        spacing: 0.5em,

        rule(caption: [QT#super[T]], inference-raw(```
        $forall psi alpha$
        ----
        $not exists psi not alpha$
        ```), inference-raw(```
        $exists psi alpha$
        ----
        $not forall psi not alpha$
        ```)),

        rule(caption: [$forall$-Bes.], inference-raw(```
        $forall psi alpha$
        ----
        $alpha[psi\/pi]$
        ```)),

        rule(caption: [$exists$-Einf.], inference-raw(```
        $alpha$
        ----
        $exists psi alpha[pi\/psi]$
        ```)),

        rule(caption: [$exists$-Bes.], inference-raw(```
        $exists psi alpha$
        ----
        $alpha[psi\/pi]$
        ```)),

        rule(caption: [$forall$-Einf.], inference-raw(```
        $alpha$
        ----
        $forall psi alpha[pi\/psi]$
        ```))
    )
]

#slide[
    #set text(size: 0.8em)
    = Das logische Quadrat, wie wir es kennen und für die Klausur lernen müssen
    #set align(right + horizon)
    #[
        #set text(size: 0.9em)
        #place(dy: 1.1cm)[universelles Urteil]
        #place(dy: 8.5cm)[partikuläres Urteil]
    ]
    #log-quad(scale-factor: 1.5)
]

#slide[
    #set text(size: 0.8em)
    = Das logische Quadrat, in dem sich die Regeln verstecken
    #set align(right + horizon)
    #[
        #set text(size: 0.9em)
        #place(dy: 1cm)[universelles Urteil]
        #place(dy: 5.5cm)[Spezialfall]
        #place(dy: 10cm)[partikuläres Urteil]
    ]
    #log-quad(scale-factor: 1.5, show-specialization: true)
]

#slide[
    = Der prädikatenlogische KdnS
    Wo sind die neuen Regeln im logischen Quadrat versteckt ...? Machen wir uns auf die Suche!

    #task(time: [GA, 20 min.])[
        + Erarbeiten Sie sich in Ihren Gruppen eines der Themen:
            #set enum(numbering: "(M1)")
            #set text(size: 0.95em)
            1. Allquantorbeseitigung und Allquantoreinführung
            2. Existenzquantoreinführung und Existenzquantorbeseitigung

        + Präsentieren Sie Ihr Ergebnis im Plenum anhand mindestens eines Beispiels pro Regel! (Hinweise dazu auf dem Material.)
    ]
]

#slide[
    = Übung
    #task(time: [Plenum, 10 min.])[
        Beweisen Sie das Daimonen-Argument mit dem prädikatenlogischen Kalkül des natürlichen Schließens!

        "Es gibt Daimonen. Also gibt es auch Götter, denn alle Daimonen sind Kinder von Göttern."
    ]
]

#final-slide