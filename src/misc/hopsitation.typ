#import "@preview/grape-suite:1.0.0": exercise, colors
#import colors: *

#set text(lang: "de")
#show: exercise.project.with(
    title: [Hospitation],
    date: datetime(year: 2024, month: 11, day: 7),

    university: "Universität Rostock",
    institute: "Institut für Philosophie",
    seminar: "Tutorium: Sprache, Logik, Argumentation"
)

#grid(columns: (35%, 25%, 35%),
    column-gutter: 1em,
    row-gutter: 1em,
    align: bottom,

    strong[Lehrperson:],
    strong[Anzahl Teilnehmende:],
    strong[Raum/Datum:],

    box(inset: (top: 0.75em), line(length: 100%)),
    box(inset: (top: 0.75em), line(length: 100%)),
    box(inset: (top: 0.75em), line(length: 100%)),
)

= Hospitation
#[
#set text(size: 9pt, lang: "de")
#block(stroke: 1pt, table(columns: (50%, 50%),
    stroke: none,
    table.hline(y: 1),
    table.vline(x: 1), [
        *Methoden, Medien und Transfer:*
        #v(8cm)
    ], [
        *Sozialformen, Kommunikation, Gesprächsführung:*
        #v(8cm)
    ], [
        *Aufbau, Organisation, Struktur:*
        #v(8cm)
    ], [
        *Inhalt:*
        #v(8cm)
    ],

    table.hline()
) + block(inset: (left: 5pt, top: -2pt), [*Sonstiges:* #v(1fr)]))
]

= Auswertung

+ Wurden die geplanten Ziele bei allen Schülern bzw. bei der adressierten Gruppe der Schüler erreicht? Woran haben Sie das erkennen können?

+ Erwies sich das geplante Vorgehen als günstig? (Planung des Stundenverlaufs, Art und Umfang der Schülertätigkeit, Agieren des Lehrers)

+ Wie geht es nach dieser Stunde weiter?

+ Was würden Sie beim nächsten Mal anders machen? Was nehmen Sie aus dieser Stunde mit?