#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, vlinex, hlinex
#import "/src/templates/exercise.typ": *

#state("seminar-dates").update((datetime.today(),))

#let plan-sequence(content) = (
    hlinex(stroke: purple + 1pt),
    colspanx(3, align(center, strong(
        counter("table-sequence").step() +
        [Abschnitt #counter("table-sequence").display() - #content]))),
    hlinex(stroke: purple + 1pt)
)

#tablex(
    columns: (15%, auto, auto),
    stroke: none,

    fill: (col, row) => (
        purple,
        none,
        blue.lighten(75%)
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
        - Vertiefung der Gütekriterien
        - logische Folgerung
        - metasprachliches Beweisen


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - Testat 1
    ], [
        - Ich kann die Gütekriterien von philosophischen Argumenten definieren und voneinander abgrenzen.
        - Ich kann "logische Folgerung" definieren.
        - Ich kann einfache Beweise metasprachlich führen.
        - Ich kann einen Beweis korrekt aufbauen.
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
        - Ich kann die Formalisierung von gültigen Schlüssen motivieren.
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
        - Testat 2
    ], [
        - Ich kann erkennen, ob ein Ausdruck syntaktisch korrekt nach den Regeln von AL gebildet wurde.
        - Ich kann syntaktisch korrekte Ausdrücke nach den Bildungsregeln von AL bilden.
        - Ich kann die aussagenlogischen Junktoren in der natürlichen Sprache erkennen und korrekt formalisieren.
        - Ich kann die Phänomene "nur" und "genau dann, wenn" im Wenn-Dann-Satz bzw. Genau-Dann-Wenn-Satz korrekt formalisieren.
    ],

    ..plan-sequence[Wahrheitstabelle],
    [], [
        *Semantik der Aussagenlogik, AL-Formalisierung*
        - Semantik der Junktoren

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - Testat 3
    ], [
        - Ich kann äquivalente AL-Sätze für Wenn-Dann-Sätze bilden, besonders im Zusammenhang von "nur" und der Kontraposition des Konditionals.
        - Ich kann die Wahrheitsbedingungen der Junktoren natürlich-sprachlich wiedergeben.
        - Ich kann die Wahrheitsbedingungen der Junktoren mit der Wahrheitstabelle darstellen.
        - Ich kann AL-Ausdrücke mit der Wahrheitstabelle auswerten.
    ],

    ..plan-sequence[Kalkül des natürlichen Schließens],
    [], [

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
    ], [

    ],

    [], [

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
    ], [

    ],

    [], [


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - Testat 4
    ], [

    ],

    ..plan-sequence[Prädikatenlogik],
    [], [


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
    ], [

    ],

    [], [


        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - Testat 5
    ], [

    ],

    ..plan-sequence[Prädikatenlogisches Kalkül des natürlichen Schließens],
    [], [

        *Material:*
        - Aufgabenserie #counter("plan-table").display()
        - Testat 6
    ], [

    ],
)
