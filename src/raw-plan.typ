#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, vlinex, hlinex, cellx
#import "/src/templates/exercise.typ": *

#state("seminar-dates").update((datetime.today(),))

#let plan-sequence(content) = (

    colspanx(3, cellx(fill: none, v(-1.5em))),
    hlinex(stroke: purple + 1pt),
    colspanx(3, cellx(fill: purple, align(center,
        strong(
            text(fill: white,
                counter("table-sequence").step() +
                [Abschnitt #counter("table-sequence").display() - #content]))))),
    hlinex(stroke: purple + 1pt)
)

#tablex(
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

    map-cells: cell => {
        if cell.x == 0 and cell.y >= 1 and cell.colspan == 1 {
            cell.content = align(center + top, counter("plan-table").step() + locate(loc => [
                *#counter("plan-table").at(loc).first(). Sitzung* \
                #if state("seminar-dates").at(loc).len() > (counter("plan-table").at(loc).first() - 1) {
                    state("seminar-dates").at(loc).at(counter("plan-table").at(loc).first() - 1).display("[day].[month].[year]")
                } else {
                    [N/A]
                }
            ]))
        }

        return cell
    },

    map-rows: (row, cells) => {
        let index = 0

        while index < cells.len() {
            if cells.at(index) == none {
                index += 1
                continue
            }

            cells.at(index).content = [
                #set par(justify: false)
                #set text(size: 0.75em)

                #if row <= 0 {
                    v(0.25em)
                    cells.at(index).content
                    v(0.25em)

                } else {
                    v(0.5em)
                    cells.at(index).content
                    v(0.5em)
                }
            ]

            index += 1
        }

        return cells
    },


    // Nr., Datum, Thema + organisatorisches (Lernevaluation?), Lektüre, Aufgabenblatt

    text(fill: white, strong[Sitzung]),
    vlinex(stroke: purple),

    text(fill: white, strong[Inhalt, Material]),
    vlinex(stroke: purple),

    text(fill: white, strong[Ziele]),

    ..plan-sequence[logische Grundlagen],
    [], [
        *Einführung in die Logik*
        - Einführung und Motivation logischer Analyse
        - philosophische Argumente und ihre Gütekriterien

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
    ], [
        - Ich kann den Begriff "Logik" definieren.
        - Ich kann den Aufbau eines philosophischen Argumentes erklären.
        - Ich kann den Begriff "Argument" definieren.
        - Ich kann die Gütekriterien von philosophischen Argumenten nennen.
    ],

    [], [
        *Folgern und Folgerung Beweisen*
        - Vertiefung der Gütekriterien
        - logische Folgerung
        - metasprachliches Beweisen


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        - Ich kann die Gütekriterien von philosophischen Argumenten definieren und voneinander abgrenzen.
        - Ich kann "logische Folgerung" definieren.
        - Ich kann einen Beweis korrekt aufbauen.
        - Ich kann einen einfachen indirekten Beweis führen.
    ],

    ..plan-sequence[Aussagenlogik],
    [], [
        *Grundlagen der Formalisierung*
        - aussagenlogische Zusammenhänge in der natürlichen Sprache
        - aussagenlogische Satzbausteine der natürlichen Sprache
        - notwendige und hinreichende Bedingungen


        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        // - Ich kann die Formalisierung von gültigen Schlüssen motivieren.
        - Ich kann die aussagenlogische Struktur der deutschen Sprache identifizieren.
        - Ich kann die hinreichende und notwendige Bedingung in einem Wenn-Dann-Satz bestimmen.
    ],

    [], [
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
        - Ich kann erkennen, ob ein Ausdruck syntaktisch korrekt nach den Regeln von AL gebildet wurde.
        - Ich kann syntaktisch korrekte Ausdrücke nach den Bildungsregeln von AL bilden.
        - Ich kann die aussagenlogischen Junktoren in der natürlichen Sprache erkennen und korrekt formalisieren.
        - Ich kann die Phänomene "nur" und "genau dann, wenn" im Wenn-Dann-Satz bzw. Genau-Dann-Wenn-Satz korrekt formalisieren.
    ],

    ..plan-sequence[Wahrheitstabelle],
    [], [
        *Semantik der Aussagenlogik*
        - Semantik der Junktoren
        - logische Wahrheit, logische Falschheit
        - logische Folgerung und logische Äquivalenz

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        - Ich kann äquivalente AL-Sätze für Wenn-Dann-Sätze bilden, besonders im Zusammenhang von "nur" und der Kontraposition des Konditionals.
        - Ich kann die Wahrheitsbedingungen der Junktoren natürlich-sprachlich wiedergeben.
        - Ich kann die Wahrheitsbedingungen der Junktoren mit der Wahrheitstabelle darstellen.
        - Ich kann AL-Ausdrücke mit der Wahrheitstabelle auswerten.
        - Ich kann "logische Wahrheit", "logische Falschheit" und "logische Äquivalenz" definieren.
    ],

    ..plan-sequence[Kalkül des natürlichen Schließens (KdnS)],
    [], [
        *Ableiten mit dem KdnS*
        - Einführung des KdnS
        - die Regeln: KM, MP, MT, KP, $not$-Bes. und $not$-Einf.

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        - Ich kann den KdnS korrekt aufbauen.
        - Ich kann Schemata für Ableitungsregeln im KdnS erkennen und anwenden.
        - Ich kann für jede Spalte des KdnS erklären, was ich in sie eintragen muss.
        - Ich kann einfache bis mittelkomplexe Beweise im Kalkül des natürlichen Schließens führen.
    ],

    [], [
        *Beweise mit Zusatzannahmen*
        - die Regeln: $and$-Bes., $and$-Einf., $or$-Einf., DS
        - linke Beweisspalte
        - die Regel der $->$-Einführung

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        - Ich kann die linke Beweisspalte korrekt herstellen und darin die Abhängigkeiten einer Zeile ablesen.
        - Ich kann erkennen, wann eine $->$-Einf. gefordert ist.
        - Ich weiß, wann und wie ich die Abhängigkeiten meiner abgeleiteten Konklusion prüfen muss.
    ],

    [], [
        *Reductio ad absurdum*
        - die Regeln: DM, $<->$-Bes., $<->$-Einf., $->$-Ers. und $->$-Einf.
        - die Regel des Reductio ad absurdums (RAA)

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        - Ich kann einen Beweis mittels der Regel RAA im KdnS korrekt führen.
    ],

    ..plan-sequence[Prädikatenlogik],
    [], [
        *Motivation und Syntax der Prädikatenlogik, prädikatenlogische Formalisierung*
        - Syllogismen, Prädikatierung und Modelltheorie
        - Syntax der Prädikatenlogik
        - Formalisierung unquantifizierter Beispiele

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        - Ich kann korrekte Sätze der Sprache PL bilden.
        - Ich kann einfache bis mittelkomplexe prädikatenlogische unquantifizierte Sachverhalte formalisieren.
    ],

    [], [
        *Quantoren und das logische Quadrat*
        - das logische Quadrat
        - Formalisierung quantifizierter Sätze

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        - Ich kann einfache prädikatenlogische quantifizierte Sachverhalte formalisieren.
        - Ich kann die Begriffe des logischen Quadrats benennen.
        - Ich kann zu einem gegebenen Satz im logischen Quadrat weitere Sätze für die freien Stellen im logischen Quadrat bilden.
        - Ich kann das Negationszeichen vor Quantoren durch Umwandlung entfernen.
    ],

    ..plan-sequence[Prädikatenlogisches Kalkül des natürlichen Schließens],
    [], [
        *Uneingeschränkte prädikatenlogische Ableitungsregeln*
        - die Regeln: $forall$-Bes., $exists$-Einf. und QT

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
    ], [
        - Ich kann allquantifizierte Sätze korrekt mit der $forall$-Bes. spezialisieren.
        - Ich kann unquantifizierte Sätze korrekt mit der $exists$-Einf. generalisieren.
    ],

    [], [
        *Eingeschränkte prädikatenlogische Ableitungsregeln*
        - die Regeln: $exists$-Bes., $forall$-Einf. und PKS

        *Material:*
        - Skript p. / S.
        - Aufgabenserie #counter("plan-table").display()
        - LEV #counter("table-sequence").display()
    ], [
        - Ich kann unquantifizierte Sätze unter Berücksichtigung der Einsränkungen korrekt mit der $forall$-Einf. generalisieren.
        - Ich kann existenzquantifizierte Sätze unter Berücksichtigung der Einsränkungen korrekt mit der $exists$-Bes. spezialisieren.
        - Ich kann die Bedingungen der $exists$-Bes. und $forall$-Einf. in meiner Ableitung korrekt prüfen.
    ],
)
