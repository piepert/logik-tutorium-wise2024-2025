#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *
#import "/src/packages/log-quad.typ": *

#show raw.where(lang: "inference"): it => inference-raw(it)

#show: slides.with(
    no: 11,
    title: [Beweise mit dem prädikatenlogischen KdnS \#2],
    date: datetime(
        year: 2025,
        month: 1,
        day: 15
    )
)

#goal-slide(goals: ("formalisieren-pl", "beweisen-kdns-pl"))[
    + ... die Regeln QT, $forall$-Bes., $exists$-Einf. anwenden.
    + ... die Regeln $forall$-Einf., $exists$-Bes. und ihre Einschränkungen erklären.
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
    #task(time: [EA, 7 min.])[
        Beweisen Sie, dass $p$ logisch aus $not (r or not q)$ und $r and q$ folgt!
    ]
]

#slide[
    = Bildung von Sätzen durch Ersetzung
    #set text(size: 0.95em)
    #definition[
        Wenn $alpha$ ein Satz ist und eine Zeichenkette $beta$ in $alpha$ vorkomt, dann ist $alpha[beta\/gamma]$ der Satz, der aus $alpha$ entsteht, wenn man $beta$ darin durch eine Zeichenkette $gamma$ _einheitlich_ ersetzt.
    ]

    #example[
        $alpha$ = "Hier ist etwas." \
        $alpha["etwas"\/"nichts"]$ = "Hier ist nichts."
    ]
]

#focus-slide[
    $forall$-Bes., $exists$-Einf.
]

#slide[
    = Sie befinden sich hier
    #set align(center)
    #set text(size: 0.75em)
    #log-quad(scale-factor: 1.4, show-specialization: true)

    #place(dy: -8.25cm, dx: 6.1cm, cetz.canvas({
        cetz.draw.line((2.5, 0), (2.5, -5.8), stroke: magenta + 15pt, mark: (end: ">"))
        cetz.draw.line((-10.1, 0), (-10.1, -5.8), stroke: magenta + 15pt, mark: (end: ">"))
    }))
]

#slide[
    = Allquantorbeseitigung
    #set text(size: 0.85em)
    #definition[
        #grid(columns: 2, column-gutter: 1.5em)[
            Wenn $alpha$ ein Satz ist, $pi$ eine Individuenkonstante und $psi$ eine Individuenvariable ist, die in $alpha$ vorkommt, dann ist die  *$forall$-Beseitigung* erlaubt.
        ][
            #align(center, inference-raw(```
                $forall psi alpha$
                ----
                $alpha[psi\/pi]$
                ```))
        ]
    ]


    #example[
        #show: columns
        1. #inference-raw(```
        $forall x forall y(F x -> (G x and B x y))$
        $F b$
        ----
        $G b and B b c$
        ```)

        2. #inference-raw(```
        $not exists x F x$
        $F a or G a$
        ----
        $G a$
        ```)
    ]
]

#slide[
    = Existenzquantoreinführung
    #definition[
        #grid(columns: 2, column-gutter: 1.5em)[
            Wenn ...
            + $alpha$ ein Satz ist,
            + $pi$ eine Individuenkonstante, _die in $alpha$ vorkommt_,
            + und $psi$ eine Individuenvariable ist, die _nicht_ in $alpha$ vorkommt,
            ... dann ist die *$exists$-Einführung* erlaubt.
        ][
            #align(center, inference-raw(```
                $alpha$
                ----
                $exists psi alpha[pi\/psi]$
                ```))
        ]
    ]

    #example[
        #grid(columns: (1fr,)*2, column-gutter: 1.5em)[
            1. #inference-raw(```
            $not F a b$
            ----
            $not forall x F x b$
            ```)
        ][
            2. #inference-raw(```
            $F a b <-> not G b c$
            $F a b$
            ----
            $exists x (F a x and not G x c)$
            ```)
        ][
            // 2. #inference-raw(```
            // $forall x (exists y F x y -> exists z G z)$
            // $F a b$
            // ----
            // $exists z G z$
            // ```)
        ]
    ]
]

#slide[
    = Eine kleine Problematik über Spezialfälle
    #task(time: [Plenum, 5 min.])[
        + Entscheiden Sie begründet, ob die Existenzquantoreinführung korrekt durchgeführt wurde!
        + Beurteilen Sie die Gültigkeit des folgenden Schlusses!
    ]

    #align(center, block(align(left, grid(columns: 2, column-gutter: 4em, [
        #inference-raw(```
        $F a a$
        ----
        $exists x F x a$
        ```)

    ], [
        #kdns(```
        a, F a a, Ann.
        b, exists x F x a, $exists$-Bes., a
        ```)
    ]))))
]

#slide[
    = Übung
    #task(time: [EA, 10 min.])[
        Beweisen Sie, dass folgender Schluss gültig ist!

        "Menschen handeln zielortientiert. Also gibt es Menschen, die zielorientiert handeln."
    ]

    #task(title: [Zusatz])[
        Beweisen Sie, dass der Schluss $exists x F x pl.seq exists y F y$ gültig ist.
    ]
]

#focus-slide[
    $exists$-Bes., $forall$-Einf.
]

#slide[
    = Sie befinden sich hier
    #set align(center)
    #set text(size: 0.75em)
    #log-quad(scale-factor: 1.4, show-specialization: true)

    #place(dy: -7.6cm, dx: 6.1cm, cetz.canvas({
        cetz.draw.line((2.5, 0), (2.5, 5.8), stroke: magenta + 15pt, mark: (end: ">"))
        cetz.draw.line((-10.1, 0), (-10.1, 5.8), stroke: magenta + 15pt, mark: (end: ">"))
    }))
]

#slide[
    = Existenzquantorbeseitigung
    #set text(size: 0.975em)
    #definition[
        #grid(columns: 2, column-gutter: 1.5em)[
            Wenn $alpha$ ein Satz ist, $pi$ eine Individuenkonstante und $psi$ eine Individuenvariable ist, dann darf die $exists$-Beseitigung unter folgenden Einschränkungen angewendet werden:
            + $pi$ kommt weder in den Ann. noch in der Konklusion vor.
            + $pi$ wurde zuvor nicht schonmal mit einer $exists$-Bes. eingeführt.
            + $pi$ kommt nicht bereits in $alpha$ vor.
        ][
            #align(center, inference-raw(```
                $exists psi alpha$
                ----
                $alpha[psi\/pi]$
                ```))
        ]
    ]


    #example[
        #grid(columns: (1fr,)*3)[
        1. #inference-raw(```
        $forall x (F x or G x)$
        $exists x not F x$
        ----
        $exists y G y$
        ```)
        ][

        2. #inference-raw(```
        $not forall x not (F x and G x)$
        ----
        $exists x F x and exists y F y$
        ```)
        ][

        3. #inference-raw(```
        $forall x exists y F x y$
        ----
        $exists x F x x$
        ```)
        ]
    ]
]

#slide[
    = Allquantoreinführung
    #set text(size: 0.925em)
    #definition[
        #grid(columns: 2, column-gutter: 1.5em)[
            Wenn $alpha$ ein Satz ist, $pi$ eine Individuenkonstante, die in $alpha$ vorkommt, und $psi$ eine Individuenvariable, die nicht in $alpha$ vorkommt, dann darf die *$forall$-Einführung* unter folgenden Einschränkungen angewandt werden:

            + $pi$ kommt nicht in den Annahmen oder der Konklusion vor.
            + In $alpha$ kommt keine Konstante vor, die aus einer $exists$-Bes. stammt.
        ][
            #align(center, inference-raw(```
                $alpha$
                ----
                $forall psi alpha[pi\/psi]$
                ```))
        ]
    ]

    #example[
        #grid(columns: (1fr,)*2)[
            1. #inference-raw(```
            $forall x (F x -> G x)$
            $forall x (G x -> H x)$
            ----
            $forall x (F x -> H x)$
            ```)
        ][
            2. #inference-raw(```
            $forall x F x and forall x forall y G x y$
            ----
            $forall x forall y forall z (F x and G y z)$
            ```)
        ]
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