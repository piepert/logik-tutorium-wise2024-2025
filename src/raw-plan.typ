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
                [Abschnitt #counter("table-sequence").display() - #content])))),

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

    // map-cells: cell => {
    //     if cell.x == 0 and cell.y >= 1 and cell.colspan == 1 {
    //         cell.content = align(center + top, counter("plan-table").step() + locate(loc => [
    //             *#counter("plan-table").at(loc).first(). Sitzung* \
    //             #if state("tut-dates").at(loc).len() > (counter("plan-table").at(loc).first() - 1) {
    //                 state("tut-dates").at(loc).at(counter("plan-table").at(loc).first() - 1).display("[day].[month].[year]")
    //             } else {
    //                 [N/A]
    //             }
    //         ]))
    //     }

    //     return cell
    // },

    // map-rows: (row, cells) => {
    //     let index = 0

    //     while index < cells.len() {
    //         if cells.at(index) == none {
    //             index += 1
    //             continue
    //         }

    //         cells.at(index).content = [
    //             #set par(justify: false)
    //             #set text(size: 0.75em)

    //             #if row <= 0 {
    //                 v(0.25em)
    //                 cells.at(index).content
    //                 v(0.25em)

    //             } else {
    //                 v(0.5em)
    //                 cells.at(index).content
    //                 v(0.5em)
    //             }
    //         ]

    //         index += 1
    //     }

    //     return cells
    // },


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
    ], [
        // - Ich kann den Begriff "Logik" definieren.
        // - Ich kann den Aufbau eines philosophischen Argumentes erklären.
        // - Ich kann den Begriff "Argument" definieren.
        // - Ich kann die Gütekriterien von philosophischen Argumenten nennen.

        @definieren-logik[Ich kann den Begriff "Logik" definieren.]

        #multi-goal-ref([Ich weiß, was ein philosophisches Argument ist und wie es aufgebaut ist.], "wissen-phil-argumente", "erkennen-phil-argumente")

        @definieren-argument[Ich kann den Begriff "Argument" definieren.]

        #multi-goal-ref([Ich kann die Gütekriterien von philosophischen Argumenten nennen.], "definieren-gültigkeit", "definieren-schlüssigkeit")
    ],

    cell-meeting, [
        *Folgern und Folgerung Beweisen*
        - Vertiefung der Gütekriterien
        - logische Folgerung
        - einfaches Beweisen


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        @identifizieren-aussagesätze[Ich kann Aussagesätze identifizieren.]

        #multi-goal-ref([Ich kann die Gütekriterien von philosophischen Argumenten definieren und voneinander abgrenzen.], "definieren-gültigkeit", "definieren-schlüssigkeit")

        @definieren-logische-folgerung[Ich kann "logische Folgerung" definieren.]

        @kennen-aufbau-beweis[Ich kann einen Beweis korrekt aufbauen.]

        // @beweise-metasprache[Ich kann einen einfachen indirekten Beweis führen.]
    ],

    ..plan-sequence[Aussagenlogik],
    cell-meeting, [
        *Grundlagen der Formalisierung*
        - aussagenlogische Zusammenhänge in der natürlichen Sprache
        - aussagenlogische Satzbausteine der natürlichen Sprache
        - notwendige und hinreichende Bedingungen


        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        // - Ich kann die Formalisierung von gültigen Schlüssen motivieren.
        @identifizieren-al-strukturen[Ich kann die aussagenlogische Struktur der deutschen Sprache identifizieren.]
        @identifizieren-hinr-notw-bed[Ich kann die hinreichende und notwendige Bedingung in einem Wenn-Dann-Satz bestimmen.]
    ],

    cell-meeting, [
        *Syntax der Aussagenlogik, AL-Formalisierung*

        - Schemata und Mustererkennung
        - Syntax der Aussagenlogik
        - aussagenlogische Junktoren
        - Formalisieren von Ausdrücken natürlicher Sprache in die Sprache AL


        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        #multi-goal-ref([Ich kann erkennen, ob ein Ausdruck syntaktisch korrekt nach den Regeln von AL gebildet wurde.], "entwickeln-gefühl-al-syntax",
"erkennen-suchen-schemata")

        #multi-goal-ref([Ich kann syntaktisch korrekte Ausdrücke nach den Bildungsregeln von AL bilden.], "entwickeln-gefühl-al-syntax", "bilden-ausdrücke-schemata")

        #multi-goal-ref([Ich kann die aussagenlogischen Junktoren in der natürlichen Sprache erkennen und korrekt formalisieren.], "identifizieren-junktoren", "formalisieren-al")

        @formalisieren-wd-gdw-nur[Ich kann die Phänomene "nur" und "genau dann, wenn" im Wenn-Dann-Satz bzw. Genau-Dann-Wenn-Satz korrekt formalisieren.]
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
        - LEV #counter("table-sequence").display()
    ], [
        @bilden-notw-hinr-äquivalenz[Ich kann äquivalente natürlichsprachliche Sätze für Wenn-Dann-Sätze bilden, besonders im Zusammenhang von "nur" und der Kontraposition des Konditionals.]

        @definieren-semantik-junktoren[Ich kann die Wahrheitsbedingungen der Junktoren natürlich-sprachlich wiedergeben.]

        @darstellen-junktoren-wahrheitstabelle[Ich kann die Wahrheitsbedingungen der Junktoren mit der Wahrheitstabelle darstellen.]

        @auswerten-ausdrücke-wahrheitstabelle[Ich kann AL-Ausdrücke mit der Wahrheitstabelle auswerten.]

        #multi-goal-ref([Ich kann "logische Wahrheit", "logische Falschheit" und "logische Äquivalenz" mit der Wahrheitstabelle beweisen.], "beweisen-logische-wahrheit", "beweisen-logische-folgerung", "beweisen-logische-äquivalenz")
    ],

    ..plan-sequence[Kalkül des natürlichen Schließens (KdnS)],
    cell-meeting, [
        *Ableiten mit dem KdnS*
        - Einführung des KdnS
        - die Regeln: DS, KM, KP, $not$-Bes. und $not$-Einf.

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        @aufbauen-kdns[Ich kann den KdnS korrekt aufbauen.]

        #multi-goal-ref([Ich kann Schemata für Ableitungsregeln im KdnS erkennen und anwenden.], "verstehen-direkte-regeln", "beweise-kdns-einfach")

        @beweise-kdns-einfach[Ich kann einfache bis mittelkomplexe Beweise im Kalkül des natürlichen Schließens führen.]
    ],

    cell-meeting, [
        *Beweise mit Zusatzannahmen*
        - die Regeln: $and$-Bes., $and$-Einf., $or$-Einf., MP, MT
        - linke Beweisspalte
        - die Regel der $->$-Einführung

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        @bilden-linke-beweisspalte[Ich kann die linke Beweisspalte korrekt herstellen und darin die Abhängigkeiten einer Zeile ablesen.]

        @erkennen-konditionalisierung[Ich kann erkennen, wann eine $->$-Einf. gefordert ist.]

        @prüfen-abhängigkeiten[Ich weiß, wann und wie ich die Abhängigkeiten meiner abgeleiteten Konklusion prüfen muss.]
    ],

    cell-meeting, [
        *Reductio ad absurdum, verzweigte Beweise*
        - die Regeln: DM, $<->$-Bes., $<->$-Einf., $->$-Ers. und $->$-Einf.
        - die Regel des Reductio ad absurdums (RAA)
        - verzweigte Beweise

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        #multi-goal-ref([Ich kann einen Beweis mittels der Regel RAA im KdnS korrekt führen.], "wissen-raa-verfahren", "beweisen-mittels-raa")

        @beweisen-verzweigt[Ich kann einen einfachen verzweigten Beweis führen.]
    ],

    ..plan-sequence[Prädikatenlogik],
    cell-meeting, [
        *Motivation und Syntax der Prädikatenlogik, prädikatenlogische Formalisierung*
        - Syllogismen, Prädikatierung und Modelltheorie
        - Syntax der Prädikatenlogik
        - Formalisierung unquantifizierter Beispiele
        - Formalisierung quantifizierter Beispiele

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        @formalisieren-pl-unquantifiziert[Ich kann einfache bis mittelkomplexe prädikatenlogische unquantifizierte Sachverhalte formalisieren.]
        @formalisieren-pl-quantifiziert[Ich kann einfache prädikatenlogische quantifizierte Sachverhalte formalisieren.]
    ],

    cell-meeting, [
        *Quantoren und das logische Quadrat*
        - das logische Quadrat
        - Formalisierung quantifizierter Sätze

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        @benennen-begriffe-log-quad[Ich kann die Begriffe des logischen Quadrats benennen.]
        @finden-beispiele-log-quad[Ich kann zu einem gegebenen Satz im logischen Quadrat weitere Sätze für die freien Stellen im logischen Quadrat bilden.]
        @umrechnen-quantoren[Ich kann das Negationszeichen vor Quantoren durch Umwandlung entfernen.]
    ],

    ..plan-sequence[Prädikatenlogisches Kalkül des natürlichen Schließens],
    cell-meeting, [
        *Uneingeschränkte prädikatenlogische Ableitungsregeln*
        - die Regeln: $forall$-Bes., $exists$-Einf. und QT

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        @variablen-spezialisieren[Ich kann allquantifizierte Sätze korrekt mit der $forall$-Bes. spezialisieren.]
        @konstanten-generalisieren[Ich kann unquantifizierte Sätze korrekt mit der $exists$-Einf. generalisieren.]
    ],

    cell-meeting, [
        *Eingeschränkte prädikatenlogische Ableitungsregeln*
        - die Regeln: $exists$-Bes., $forall$-Einf. und PKS

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        #multi-goal-ref([Ich kann unquantifizierte Sätze unter Berücksichtigung der Einsränkungen korrekt mit der $forall$-Einf. generalisieren.], "kennen-einschränkung-allq-einf", "konstanten-generalisieren")

        #multi-goal-ref([Ich kann existenzquantifizierte Sätze unter Berücksichtigung der Einsränkungen korrekt mit der $exists$-Bes. spezialisieren.], "kennen-einschränkung-exq-bes", "variablen-spezialisieren")

        #multi-goal-ref([Ich kann die Bedingungen der $exists$-Bes. und $forall$-Einf. in meiner Ableitung korrekt prüfen.],  "kennen-einschränkung-allq-einf", "kennen-einschränkung-exq-bes")
    ],

    ..plan-sequence[Reserve],
    cell-meeting, table.cell(align: center + horizon, [
        *Reserve*
    ]), [],

    // [], table.cell(align: center + horizon, [
    //     *Reserve*
    // ]), [],
)
