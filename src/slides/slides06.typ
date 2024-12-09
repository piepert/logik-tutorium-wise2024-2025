#import "@preview/cetz:0.3.0"

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#show raw.where(lang: "inference"): it => inference-raw(it)

#show: slides.with(
    no: 6,
    title: [der Kalkül des natürlichen Schließens],
    date: datetime(
        year: 2024,
        month: 11,
        day: 27
    )
)

#show figure: it => v(-1cm) + align(horizon + center, it)

#[
#goal-slide(goals: ("formalisieren-al", "beweisen-kdns-al"))[
    + ... den Aufbau des KdnS beschreiben.
    + ... die Regelanwendung im KdnS erklären und anwenden.
    + ... einfache Beweise im KdnS führen.
]
]

#slide[
    #set text(size: 0.975em)
    = Erwärmung
    #task(time: [EA, 5 min.])[
        Formalisieren Sie die folgenden Sätze in die Sprache AL! (Vergessen Sie das Zuordnungsverzeichnis nicht!)
        + Wenn es nicht regnet, wird die Straße trotzdem nass.
        + Genau dann sind beide nicht zu Hause, wenn Alice oder Bob nicht nach Hause gehen.
        + Weder Alice noch Bob ist zu Hause.
        + Nur wenn die Sonne aufgeht, wird es hell.
        + Alice liebt Bob nicht, gdw. Bob nicht Alice liebt.
    ]
]

#slide[
    #task(time: [EA, 5 min.])[
        Bestimmen und beweisen Sie für den folgenden Ausdruck, welche der folgenden Eigenschaften er besitzt:
        - logisch wahr
        - erfüllbar
        - logisch falsch
    ]

    #figure($not (p or not q) <-> (not p and q)$)
]

#slide[
    #task(time: [EA, 5 min.])[
        Zeigen Sie, dass Folgendes gilt! #h(1fr)
    ]

    #figure($p -> not q al.eq not p or not q$)
]

#slide[
    #task(time: [EA, 5 min.])[
        Zeigen Sie, dass Folgendes gilt! #h(1fr)
    ]

    #figure($(p or q) -> not r al.seq p -> q$)
]

#slide[
    #task[
        Wie viele Zeilen bräuchten Sie in der Wahrheitstabelle, um den folgenden Schluss zu beweisen?
    ]

    #figure(align(left + horizon, ```inference
    $p -> q$
    $not t$
    $s or r$
    $r -> (t or not not p)$
    $not s$
    ----
    $q$
    ```))
]

#focus-slide[
    Der Kalkül des natürlichen Schließens
]

#slide[
    = Aufbau
    #task(time: [Plenum, 5 min.])[
        Im folgenden Kalkül sind einige Sachen schiefgelaufen! Korrigieren Sie den Aufbau und erklären Sie, wie man den KdnS richtig aufbaut! (Achtung: Am Ende fehlt ein Wort! (Erinnert mich daran!))
    ]

    /*
    #figure(table(columns: 3,
        align: left,
        stroke: none,
        [\#], [AL], [K],
        [(1)], $p or (not p -> q)$, [Ann.],
        [(2)], $not p$, [Ann.],
        [(3)], $not p -> q$, [],
        [(4)], $q$, [],
    ))
    */

    #figure(table(columns: 3,
        align: left,
        stroke: none,
        $p or (not p -> q)$, [(1)], [Ann.],
        $not p$, [(2)], [Ann.],
        $not p -> q$, [(3)], [],
        $q$, [(4)], [],
    ))
]

#slide[
    = Aufbau
    #figure(cetz.canvas({
        import cetz.draw: *

        content((-5.125, 4), text(size: 0.75em)[Zeilenzählung])
        line((-5.125, 3.5), (-5.125, 2.25), mark: (end: ">"))

        content((-2, -3), text(size: 0.75em)[AL-Sätze])
        line((-2, -2.5), (-2, -1.5), mark: (end: ">"))

        content((2.5, 4), text(size: 0.75em)[Kommentarspalte])
        line((2.5, 3.5), (2.5, 2.25), mark: (end: ">"))

        content((9, 1.5), text(size: 0.75em)[Annahmen\ kennzeichnen])
        line((6.5, 1.5), (3, 1.5), mark: (end: ">"))

        content((12, -0.75), text(size: 0.75em)[Regelanwendungen\ kennzeichnen\ (Zeilen und Regelnahmen)])
        line((8, -0.75), (6, -0.75), mark: (end: ">"))

        content((0, 0), table(columns: 3,
            align: left,
            stroke: none,
            [(1)], $p or (not p -> q)$, [Ann.],
            [(2)], $not p$, [Ann.],
            [(3)], $not p -> q$, [1,2,DM],
            [(4)], $q$, [2,3,MP, q.e.d.],
        ))
    }))
]

#slide[
    == Beispiel zur Ableitung

    #table(stroke: none,
        columns: 2,
        column-gutter: 2em,
        align: top,
        ```inference
        $p or q$
        $not r$
        $not r -> not p$
        ----
        $q$
        ``` + text(size: 1em)[
                #table(
                    stroke: none,
                    columns: 2,
                    align: horizon + center,
                    column-gutter: 2em,
                    ```inference
                    $#box(fill: red.lighten(40%), outset: 2pt, $alpha$) -> #box(fill: blue.lighten(40%), outset: 2pt, $beta$)$
                    $#box(fill: red.lighten(40%), outset: 2pt, $alpha$)$
                    ----
                    $#box(fill: blue.lighten(40%), outset: 2pt, $beta$)$
                    ```, ```inference
                    $alpha or beta$
                    $not alpha$
                    ----
                    $beta$
                    ```,
                    text(size: 0.75em)[Modus\ ponens],
                    text(size: 0.75em)[Disjunktiver\ Syllogismus]
                )
            ],

        kdns(centered: false, ```
        a, p or q, Ann.
        b, not r, Ann.
        c, not r -> not p, Ann.
        d, not p, MP, b&c
        e, q, "DS, q.e.d.", a&d
        ```))
]

#slide[
    == Beispiel zur Ableitung

    #table(stroke: none,
        columns: 2,
        column-gutter: 2em,
        align: top,
        ```inference
        $p or q$
        $not r$
        $not r -> not p$
        ----
        $q$
        ``` + text(size: 1em)[
                #table(
                    stroke: none,
                    columns: 2,
                    align: horizon + center,
                    column-gutter: 2em,
                    ```inference
                    $#box(fill: red.lighten(40%), outset: 2pt, $alpha$) -> #box(fill: blue.lighten(40%), outset: 2pt, $beta$)$
                    $#box(fill: red.lighten(40%), outset: 2pt, $alpha$)$
                    ----
                    $#box(fill: blue.lighten(40%), outset: 2pt, $beta$)$
                    ```, ```inference
                    $alpha or beta$
                    $not alpha$
                    ----
                    $beta$
                    ```,
                    text(size: 0.75em)[Modus\ ponens],
                    text(size: 0.75em)[Disjunktiver\ Syllogismus]
                )
            ],

        kdns(centered: false, ```
        a, p or q, Ann.
        b, "#box(fill: red.lighten(40%), outset: 2pt, $not r$)", Ann.
        c, "#box(fill: red.lighten(40%), outset: 2pt, $not r$) -> #box(fill: blue.lighten(40%), outset: 2pt, $not p$)", Ann.
        d, "#box(fill: blue.lighten(40%), outset: 2pt, $not p$)", MP, b&c
        e, q, "DS, q.e.d.", a&d
        ```))
]

#slide[
    == Beispiel zur Ableitung

    #table(stroke: none,
        columns: 2,
        column-gutter: 2em,
        align: top,
        ```inference
        $p or q$
        $not r$
        $not r -> not p$
        ----
        $q$
        ``` + text(size: 1em)[
                #table(
                    stroke: none,
                    columns: 2,
                    align: horizon + center,
                    column-gutter: 2em,
                    ```inference
                    $alpha -> beta$
                    $alpha$
                    ----
                    $beta$
                    ```, ```inference
                    $#box(fill: red.lighten(40%), outset: 2pt, $alpha$) or #box(fill: blue.lighten(40%), outset: 2pt, $beta$)$
                    $not #box(fill: red.lighten(40%), outset: 2pt, $alpha$)$
                    ----
                    $#box(fill: blue.lighten(40%), outset: 2pt, $beta$)$
                    ```,
                    text(size: 0.75em)[Modus\ ponens],
                    text(size: 0.75em)[Disjunktiver\ Syllogismus]
                )
            ],

        kdns(centered: false, ```
        a, "#box(fill: red.lighten(40%), outset: 2pt, $p$) or #box(fill: blue.lighten(40%), outset: 2pt, $q$)", Ann.
        b, not r, Ann.
        c, not r -> not p, Ann.
        d, "not #box(fill: red.lighten(40%), outset: 2pt, $p$)", MP, b&c
        e, "#box(fill: blue.lighten(40%), outset: 2pt, $q$)", "DS, q.e.d.", a&d
        ```))
]

#slide[
    #notice[
        Im KdnS dürfen Regeln nur angewandt werden, wenn alle Sätze über dem Strich jeweils in einer Zeile komplett vorkommen! Nur Regeln mit einem "#super[T]" dürfen auf Teilformeln angewandt werden!
    ]
]

#slide[
    = Beispielaufgabe

    #task(time: [EA, 5 min. / Plenum, 5 min.])[
        Formalisieren Sie das folgende Argument und beweisen Sie es mit dem Kalkül des natürlichen Schließens!
    ]

    Ich habe Schmerzen oder wenn es mir sonst gut geht, dann bin ich nicht krank. Ich bin nicht krank, denn ich habe keine Schmerzen. Sonst geht es mir auch gut.
]

#slide[
    = Puzzle

    #task(time: [GA, 20 min.])[
        Einige Zeilen der KdnS auf M1 sind durcheinandergeraten! Bringen Sie in Gruppenarbeit wieder in die richtige Reihenfolge!
    ]
]

#focus-slide[
    Fassen Sie in einem Satz zusammen, was Sie aus der heutigen Sitzung mitnehmen!
]

/*

#slide[
    #set text(size: 0.95em)
    = Wie man eine KdnS-Aufgabe erstellt

    #example[
        Wir wählen eine Regel. Dann entscheiden wir uns: Sollen die Annahmen gegeben sein, oder sollen die Annahmen irgendwo herkommen?
        + Wenn die Annahme gegeben sein soll, schreiben wir sie hin und kommentieren sie mit "Ann."
        + Wenn die Regel irgendwo herkommen soll, wählen wir eine neue Regel, deren Konklusion die Annahme ist und wiederholen den Prozess.
    ]
]

*/

/*
#slide[
    #set text(size: 0.95em)
    = Wie man KdnS-Aufgaben erstellt

    #example[
        Wir beginnen mit einer Regel und notieren Annahmen und Konklusion, z.B. für den _Modus ponens_.
    ]

    #show: align.with(horizon + center)
    #table(stroke: none, columns: 2, align: top + left, column-gutter: 1em)[
        #table(columns: 4,
            column-gutter: 0.5em,
            stroke: none,
            hide[(1)], hide[$not gamma or alpha$], [], hide[Ann.],
            hide[(2)], [$alpha -> beta$], [], [Ann.],
            hide[(3)], hide[$gamma$], [], [Ann.],
            hide[(4)], hide[$not not gamma$], hide[3], [$not$-Bes.],
            hide[(5)], [$alpha$], hide[1, 4], [DS],
            hide[(6)], [$beta$], hide[2, 5], [MP, q.e.d.],)
    ][
        ```inference
        $alpha -> beta$
        $alpha$
        ----
        $beta$
        ```
        #text(size: 0.75em)[Modus ponens]
    ]
]

#slide[
    = Wie man KdnS-Aufgaben erstellt

    #example[
        Für $alpha$ setzen wir "$p$" ein, für $beta$ "$not q$" und für $gamma$ setzen wir "$r$" ein.
    ]

    #show: figure
    #table(columns: 4,
        column-gutter: 0.5em,
        stroke: none,
        align: left,
        [(1)], $not gamma or alpha$, [], [Ann.],
        [(2)], $alpha -> beta$, [], [Ann.],
        [(3)], $gamma$, [], [Ann.],
        [(4)], $not not gamma$, [3], [$not$-Bes.],
        [(5)], $alpha$, [1, 4], [DS],
        [(6)], $beta$, [2, 5], [MP, q.e.d.],)
]

#slide[
    = Wie man KdnS-Aufgaben erstellt

    #example[
        Fertig!
    ]

    #show: figure
    #table(columns: 4,
        column-gutter: 0.5em,
        stroke: none,
        align: left,
        [(1)], $not r or p$, [], [Ann.],
        [(2)], $p -> not q$, [], [Ann.],
        [(3)], $r$, [], [Ann.],
        [(4)], $not not r$, [3], [$not$-Bes.],
        [(5)], $p$, [1, 4], [DS],
        [(6)], $not q$, [2, 5], [MP, q.e.d.],)
]
*/

/*
#slide[
    = Wie man KdnS-Aufgaben erstellt
    #task(time: [EA, 10 min.])[
        Erstellen Sie eine KdnS-Aufgabe für Ihren Sitznachbarn! Sie können dafür die folgenden Regeln verwenden:
    ]

    #figure(table(
        stroke: none,
        columns: 4,
        column-gutter: 1em,

        ```inference
        $alpha -> beta$
        $alpha$
        ----
        $beta$
        ```,

        ```inference
        $alpha -> beta$
        $not beta$
        ----
        $not alpha$
        ```,

        ```inference
        $not not alpha$
        ----
        $alpha$
        ```,

        ```inference
        $alpha or beta$
        $not alpha$
        ----
        $beta$
        ```,

        text(size: 0.75em)[Modus ponens],
        text(size: 0.75em)[Modus tollens],
        text(size: 0.75em)[Negations-\ beseitigung],
        text(size: 0.75em)[Disjunktiver\ Syllogismus],))
]

#slide[
    = Wie man KdnS-Aufgaben löst
    #task(time: [EA, 10 min.])[
        Tauschen Sie die Aufgaben untereinander aus und lösen Sie sie!
    ]

    #figure(table(
        stroke: none,
        columns: 4,
        column-gutter: 1em,

        ```inference
        $alpha -> beta$
        $alpha$
        ----
        $beta$
        ```,

        ```inference
        $alpha -> beta$
        $not beta$
        ----
        $not alpha$
        ```,

        ```inference
        $not not alpha$
        ----
        $alpha$
        ```,

        ```inference
        $alpha or beta$
        $not alpha$
        ----
        $beta$
        ```,

        text(size: 0.75em)[Modus ponens],
        text(size: 0.75em)[Modus tollens],
        text(size: 0.75em)[Negations-\ beseitigung],
        text(size: 0.75em)[Disjunktiver\ Syllogismus],
    ))
]