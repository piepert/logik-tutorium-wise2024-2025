#import "@preview/cetz:0.3.0"

#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#show raw.where(lang: "inference"): it => inference-raw(it)

#show: slides.with(
    no: 7,
    title: [Beweise mit Zusatzannahmen und Reductio ad absurdum],
    date: datetime(
        year: 2024,
        month: 12,
        day: 4
    )
)

#show figure: it => v(-1cm) + align(horizon + center, it)

#goal-slide(goals: ("beweisen-kdns-al",))[
    + ... die linke Beweisspalte korrekt befüllen.
    + ... einfache Beweise mit der $->$-Einf.-Regel führen.
    + ... einfache Beweise mit der RAA-Regel führen.
]

#slide[
    = Puzzle

    #task(time: [GA, 10 min.])[
        Einige Zeilen des KdnS auf M1 sind durcheinandergeraten! Bringen Sie in Gruppenarbeit wieder in die richtige Reihenfolge!
    ]
]

#slide[
    = Beweise mit Zusatzannahmen I
    #example[
        #inference-wl[
            Wenn es regnet oder wer einen Eimer ausschüttet,\ wird die Straße nass.][
            Wenn wer einen Eimer ausschüttet, wird die Straße nass.]
    ]

    ... aber wie beweisen wir, dass das gültig ist?

    // #notice[
    //     Kommt ein Konditional in der Konklusion vor, ist dies häufig (aber nicht immer!) ein Hinweis dafür, dass man eine $->$-Einf. braucht.
    // ]
]

#slide[
    = Beweise mit Zusatzannahmen I
    Machen wir einen kleinen Beweis in natürlicher Sprache!

    #set text(size: 0.85em)
    #show regex("\[.*\]"): set text(fill: magenta)
    #grid(columns: (50%, 50%), column-gutter: 1em)[
        #set text(size: 0.95em)
        + [Ann.] Wenn es regnet oder wer einen Eimer ausschüttet, wird die Straße nass. #pause
        + [ZA] Angenommen einer schüttet einen Eimer aus. Was dann? #pause
        + [∨-Einf.] Dann regnet es oder einer schüttet einen Eimer aus.  #pause
        + [MP] Dann wäre die Straße nass. #pause
        + [→-Einf.] Also wenn jemand einen Eimer ausschüttet, wird die Straße nass. #h(1fr) Q.E.D. #pause
    ][
        #kdns(show_premises: true, ```
        a, (p or r) -> q, Ann.
        b, p, ZA
        c, p or r, $or$-Einf., b
        d, q, MP, a&c
        e, p -> q, $->$-Einf., d&b!b
        ```)
    ]
]

#slide[
    = Beweise mit Zusatzannahmen I
    #set text(size: 0.9em)

    #notice[
        Kommt ein *Konditional in der Konklusion* vor, ist dies häufig (aber nicht immer!) ein Hinweis dafür, dass man eine $->$-Einf. braucht. Die darf man aber nur anwenden, wenn man die ZA auch zum Ableiten benutzt hat!
    ]

    #definition[
        In der *linken Beweisspalte* notieren wir die Zeilennummern der Prämissen, mit deren Hilfe die Zeile abgeleitet wurde.
    ]
]

#slide[
    = Beweise mit Zusatzannahmen I:\ Linke Beweisspalte
    Am Beispiel des folgenden Schlusses füllen wir die linke Beweisspalte aus...

    #inference-raw(```
    $not p or s$
    $not r -> not s$
    ----
    $(p and q) -> r$
    ```)
]

#slide[
    = Beweise mit Zusatzannahmen I
    #definition[
        Wenn die Konklusion dem Schema "$alpha -> beta$" entspricht, dann...
        + ... nehmen wir $alpha$ mit der Regel *ZA* an,
        + ... zeigen, dass mit $alpha$ der Satz $beta$ abgeleitet werden kann,
        + ... zeigen, dass die Zeile mit $beta$ von der Zeile $alpha$ abhängig ist und
        + ... dürfen dann $alpha -> beta$ in einer neuen Zeile ableiten und die Abhängigkeit von der Zusatzannahme entfernen.
    ]
]

#slide[
    = Beweise mit Zusatzannahmen I
    #task(time: [EA, 10 min.])[
        Beweisen Sie mit Hilfe des KdnS, dass der folgende Schluss gültig ist!
    ]

    #set align(center)
    #show: block
    #set align(left)
    #inference-wl[
        Peter ist genau dann zu Hause, wenn Irene zu Hause ist.][
        Irene ist nicht zu Hause oder nicht in der Bar.][
        Wenn Peter zu Hause ist, ist Irene nicht in der Bar.]
]

#focus-slide[
    Reductio ad absurdum
]

#slide[
    = Beweise mit Zusatzannahmen II
    #set text(size: 0.925em)
    #task[
        Erklären Sie kurz die Methode vom Anfang des Semesters, wie wir alle Argumente auf Gültigkeit prüfen können! (Zum Beispiel auch das Folgende.)
    ]

    #set align(horizon + center)
    #show: block
    #set align(left)
    #inference-raw(```
    $alpha and alpha$
    ----
    $alpha$
    ```)
]

#slide[
    #set text(size: 0.85em)
    #let r(body) = text(fill: colors.brown, [[#body]])
    #example[
        *Theorem*: Aus $alpha and alpha$ folgt $alpha$ logisch.
        *Beweis:* #pause
        + #r[ZA] Angenommen $alpha$ folge _nicht_ logisch aus $alpha and alpha$. #pause
        + #r[Def. log. Folg.] Also muss $alpha and alpha$ wahr, aber $alpha$ falsch sein können! #pause
        + #r[Def. "$and$"] Die Definition von "$and$" sagt: $alpha and alpha$ ist wahr, gdw. $alpha$ wahr ist. #pause
        + #r[Def. "$and$"] $alpha and alpha$ haben wir als wahr angenommen, also muss auch $alpha$ wahr sein. _Widerspruch zu 2.!_ #pause
        + #r[RAA 1/2] Widersprüche folgen nur aus Falschem. Dieser folgte aus der Annahme, dass das Theorem falsch wäre. #pause
        + #r[RAA 2/2] Also war es falsch anzunehmen, dass das Theorem falsch war. #pause
        + #r[$not$-Bes] Also ist das Theorem wahr. #h(1fr) Q.E.D.
    ]
]

#slide[
    = Beweise mit Zusatzannahmen II
    #set text(size: 0.925em)
    #task[
        Erklären Sie, warum Sie mit der Begründung "Widersprüche folgen nur aus Falschem." das Gegenteil der Zusatzannahme ableiten dürfen!
    ] #pause

    #definition[
        Die Regel *RAA* (Reductio ad absurdum) macht genau das: Wir nehmen das Gegenteil der Konklusion an und wenn wir einen Widerspruch gefunden haben, dürfen wir auf die Wahrheit der Konklusion schließen!
    ]
]

#slide[
    = Beweise mit Zusatzannahmen II
    #show: example
    Rechnen wir ein Beispiel zusammen an der Tafel. Gleicher Schluss wie bei der $->$-Einf.:
    // #grid(columns: 2, column-gutter: 2em)[
        #inference-raw(```
        $(p or r) -> q$
        ----
        $p -> q$
        ```)
    // ][
        // #kdns(show_premises: true, ```
        // a, (p or r) -> q, Ann.
        // b, not (p -> q), ZA
        // c, p and not q, $->$-Ers., b
        // e, not q, $and$-Bes., c
        // d, p, $and$-Bes., c
        // f, p or r, $or$-Einf., d
        // g, q, MP, a&f
        // h, not not (p -> q), RAA, b&e&g!b
        // i, p -> q, $not$-Bes., h
        // ```)
    // ]
]

#slide[
    #set text(size: 0.975em)
    #task(time: [PA, 10 min.])[
        Beweisen Sie die folgenden Schlüsse mit dem KdnS!
    ]

    #columns(2)[
        + #inference-raw(```
        $q$
        ----
        $p -> q$
        ```)
        #colbreak()

        2. #inference-raw(```
        $p and q$
        ----
        $p or q$
        ```)
    ]

    #task(title: [Zuzsatz für die ganz schnellen])[
        #inference-raw(```
        $(p and q) or (p and not q)$
        ----
        $p$
        ```)
    ]
]

#focus-slide[
    Fassen Sie in einem Satz zusammen, was Sie aus der heutigen Sitzung mitnehmen!
]

#focus-slide[
    Auswertung Probeklausur und Zwischenstand
]