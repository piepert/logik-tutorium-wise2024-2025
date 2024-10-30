//#DONT_COMPILE_TO_PDF
#import "/src/packages/goals.typ": *
#import "/src/templates/exercise.typ": *

#show: ref-goals

#state("tut-dates").update((
    // datetime(year: 2024, month: 10, day: 16), // beginnt erst ab zweiter Woche
    datetime(year: 2024, month: 10, day: 23),
    datetime(year: 2024, month: 10, day: 30),
    datetime(year: 2024, month: 11, day: 6),
    datetime(year: 2024, month: 11, day: 13),
    datetime(year: 2024, month: 11, day: 20),
    datetime(year: 2024, month: 11, day: 27),
    datetime(year: 2024, month: 12, day: 4),
    datetime(year: 2024, month: 12, day: 11),
    datetime(year: 2024, month: 12, day: 18),
    datetime(year: 2025, month: 1, day: 8),
    datetime(year: 2025, month: 1, day: 15),
    datetime(year: 2025, month: 1, day: 22),
    datetime(year: 2025, month: 1, day: 29),
))

#let plan-sequence(content) = (
    table.cell(colspan: 3, fill: none, v(-1em)),

    table.hline(stroke: purple + 1pt),

    table.cell(colspan: 3, fill: purple, align(center,
        strong(
            text(fill: white,
                counter("table-sequence").step() +
                [Abschnitt #context counter("table-sequence").display() - #content])))),

    table.hline(stroke: purple + 1pt)
)

#let cell-meeting = align(center + top,
    counter("plan-table").step() + locate(loc => [
        *#counter("plan-table").at(loc).first(). Sitzung* \
        #if state("tut-dates").at(loc).len() > (counter("plan-table").at(loc).first() - 1) {
            state("tut-dates").at(loc).at(counter("plan-table").at(loc).first() - 1).display("[day].[month].[year]")
        } else {
            [N/A]
        }

        15:15 Uhr -- 16:45 Uhr

        // Parkstraße 6, R.~206
    ])
)

#show table.cell: set par(justify: false)

#table(
    columns: (15%, auto, auto),
    stroke: none,

    fill: (col, row) => (
        purple,
        blue.lighten(75%),
        none,
    ).at(
        if row == 0 {
            row
        } else {
            1 + calc.rem(row, 2)
        }
    ),


    // Nr., Datum, Thema + organisatorisches (Lernevaluation?), Lektüre, Aufgabenblatt

    text(fill: white, strong[Sitzung]),
    table.vline(stroke: purple),

    text(fill: white, strong[Inhalt, Material]),
    table.vline(stroke: purple),

    text(fill: white, strong[Ziele]),

    ..plan-sequence[logische Grundlagen],
    cell-meeting, [
        *Organisatorisches*
        - Vorstellung und Erwartungen

        *Einführung in die Logik*
        - Einführung und Motivation logischer Analyse
        - philosophische Argumente und ihre Gütekriterien

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - @Beckermann2014[S. 1-24]
        - @HardySchamberger2018[S. 37-39. Achtung: "Gültigkeit" und "Schlüssigkeit" werden hier synonym verwandt, sind es bei uns aber nicht]
    ], [
        #print-goals("definieren-grundkonzepte")
    ],

    cell-meeting, [
        *Folgerung und Aussagesätze*
        - Vertiefung Gültigkeit, Beweis gültiger Argumente
        - Aussagesätze und deren Wahrheitsbedingungen

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        // - LEV #context counter("table-sequence").display()
        - @Beckermann2014[S. 28-34]
        - @HardySchamberger2018[S. 37-39]
    ], [
        #print-goals("definieren-grundkonzepte")
        #print-goals("identifizieren-aussagesätze")
        #print-goals("formalisieren-al")
    ],

    ..plan-sequence[Aussagenlogik],
    cell-meeting, [
        *Grundlagen der Formalisierung*
        // - aussagenlogische Zusammenhänge in der natürlichen Sprache // durch letzte Sitzung abgedeckt
        - aussagenlogische Satzbausteine der natürlichen Sprache
        - Schemata und Mustererkennung


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - @Beckermann2014[S. 39-43]
        - @HardySchamberger2018[S. 37-48]
    ], [
        #print-goals(
            "identifizieren-aussagesätze",
            "identifizieren-hin-not-bedingungen",
            "formalisieren-al",
        )
    ],

    cell-meeting, [
        *Syntax der Aussagenlogik, AL-Formalisierung*
        - Syntax der Aussagenlogik
        - aussagenlogische Junktoren
        - Formalisieren von Ausdrücken natürlicher Sprache in die Sprache AL
        - das Konditional sowie notwendige und hinreichende Bedingungen

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        // - LEV #context counter("table-sequence").display()
        - @Beckermann2014[S. 20 f., 51-103, 155 f]
        - @HardySchamberger2018[S. 55-74, 93 f]
    ], [
        #print-goals(
            "identifizieren-aussagesätze",
            "identifizieren-hin-not-bedingungen",
            "bestimmen-hin-not-bedingungen",
            "formalisieren-al",
        )
    ],

    ..plan-sequence[Wahrheitstabelle],
    cell-meeting, [
        *Semantik der Aussagenlogik*
        - Semantik der Junktoren
        - logische Wahrheit, logische Falschheit
        - logische Folgerung und logische Äquivalenz

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        // - LEV #context counter("table-sequence").display()
        - @Beckermann2014[S. 51-103]
        - @HardySchamberger2018[S. 74-79]
    ], [
        #print-goals(
            "bilden-hin-not-bedingungen",
            "formalisieren-al",
            "beweisen-wahrheistabelle",
        )
    ],

    ..plan-sequence[Kalkül des natürlichen Schließens (KdnS)],
    cell-meeting, [
        *Ableiten mit dem KdnS*
        - Einführung des KdnS
        - Mustererkennung und Regelanwendung
        // - die Regeln: DS, KM, KP, $not$-Bes. und $not$-Einf., $and$-Bes., $and$-Einf.

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - @HardySchamberger2018[S. 103-128]
    ], [
        #print-goals(
            "formalisieren-al",
            "beweisen-wahrheistabelle",
            "beweisen-kdns-al",
        )
    ],

    cell-meeting, [
        *Beweise mit Zusatzannahmen, Einführung in die Prädikatenlogik*
        // - die Regeln: $or$-Einf., MP, MT, DM, $<->$-Bes., $<->$-Einf.
        - linke Beweisspalte
        - die Regel der $->$-Einführung
        - verzweigte Beweise

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - @HardySchamberger2018[S. 128-132, 143-149]
    ], [
        #print-goals(
            "formalisieren-al",
            "beweisen-kdns-al",
            "beweisen-verzweigt",
        )
    ],

    cell-meeting, [
        *Reductio ad absurdum, verzweigte Beweise und das logische Quadrat*
        - die Regel des Reductio ad absurdums (RAA)
        - das logische Quadrat

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        // - LEV #context counter("table-sequence").display()
        - @HardySchamberger2018[S. 132-142]
    ], [
        #print-goals(
            "formalisieren-al",
            "beweisen-kdns-al",
            "ausfüllen-log-quad"
        )
    ],

    ..plan-sequence[Prädikatenlogik],
    cell-meeting, [
        *Motivation und Syntax der Prädikatenlogik, prädikatenlogische Formalisierung*
        - Syllogismen, Prädikatierung und Modelltheorie
        - Syntax der Prädikatenlogik
        - Formalisierung unquantifizierter und quantifizierter Beispiele

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - @Beckermann2014[S. 172-185, 240-263]
        - @HardySchamberger2018[S. 151-175]
    ], [
        #print-goals(
            "formalisieren-pl",
            "ausfüllen-log-quad",
        )
    ],

    cell-meeting, [
        *Quantoren und das logische Quadrat*
        - das logische Quadrat
        - Formalisierung quantifizierter Sätze

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        // - LEV #context counter("table-sequence").display()
        - @Beckermann2014[S. 240-263]
        - @HardySchamberger2018[S. 163-179]
    ], [
        #print-goals(
            "formalisieren-pl",
            "beweisen-kdns-pl",
            "ausfüllen-log-quad",
        )
    ],

    ..plan-sequence[Prädikatenlogisches Kalkül des natürlichen Schließens],
    cell-meeting, [
        *Uneingeschränkte prädikatenlogische Ableitungsregeln*
        - die Regeln: $forall$-Bes., $exists$-Einf. und QT

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - @HardySchamberger2018[S. 179-182, 185-187]
    ], [
        #print-goals(
            "formalisieren-pl",
            "beweisen-kdns-pl",
            "beweisen-verzweigt",
        )
    ],

    cell-meeting, [
        *Eingeschränkte prädikatenlogische Ableitungsregeln*
        - die Regeln: $exists$-Bes., $forall$-Einf. und PKS

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        // - LEV #context counter("table-sequence").display()
        - @HardySchamberger2018[S. 182-185, 188-194]
    ], [
        #print-goals(
            "formalisieren-pl",
            "beweisen-kdns-pl",
            "ausfüllen-log-quad",
        )
    ],

    ..plan-sequence[Reserve],
    cell-meeting, table.cell(align: center + horizon, colspan: 2, [
        *Reserve*
    ]),

    // [], table.cell(align: center + horizon, [
    //     *Reserve*
    // ]), [],
)

#place(hide(bibliography("bibliography.bib", style: "/src/citation-style.csl")))