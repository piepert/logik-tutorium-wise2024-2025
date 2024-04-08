#import "/src/templates/exercise.typ": *
#import "/src/packages/inference.typ": *

#show: project.with(
    no: 1,
    type: [LEV],
    suffix-title: [Logische Grundlagen],
    show-point-distribution-in-tasks: true,
    show-namefields: true,
    show-timefield: true,
    max-time: 25,
    show-solutions: false,
    show-lines: true,
    solutions-as-matrix: true
)

#task(lines: 10, points: 3, [Grundbegriffe], [
    Erklären Sie, womit sich die Logik beschäftigt. Nennen Sie außerdem die zwei Gütekriterien von Argumenten.
], [], (
    (1, [Bestimmung der Logik als Lehre vom gültigen, formalen Schließen.]),
    (2, [Benennen der Gütekriterien Gültigkeit und Schlüssigkeit.]),
))

#task(lines: 20, points: 6, [Gütekriterien], [
    Beurteilen Sie die folgenden Argumente jeweils in Bezug auf die zwei Gütekriterien! Begründen Sie ihre Antworten kurz.
], [
    1. #inference-raw(```
        Wenn ich auf dem Mond laufe, kann ich höher springen als auf der Erde.
        Ich kann nicht höher als auf der Erde springen.
        ----
        Ich bin nicht auf dem Mond.
        ```)

    2. #inference-raw(```
        Entweder alle Kirschen sind grün oder es regnet Sonnenstrahlen.
        Nicht alle Kirschen sind grün.
        ----
        Also regnet es Sonnenstrahlen.
        ```)

    3. #inference-raw(```
        Alle Menschen können Fleisch essen.
        ----
        Alle Menschen sollten Fleisch essen.
        ```)
], (
    (2, [
        1. Das Argument wurde als schlüssig und gültig charakterisiert, da die Prämissen wahr und die Konklusion logisch aus den Prämissen folgt. Wurde es als unschlüssig beurteilt, so muss eine Begründung erfolgen.
    ]),

    (2, [
        2. Das Argument wurde als gültig, aber nicht schlüssig beurteilt, da die Prämissen falsch sind aber die Konklusion logisch aus den Prämissen folgt. Weder sind alle Kirschen grün, noch regnet es Sonnenstrahlen, daher ist die erste Prämisse falsch. Für eine andere Bewertung muss eine angemessene Begründung vorgebracht werden.
    ]),

    (2, [
        3. Das Argument ist weder schlüssig noch gültig. Da das Argument nicht gültig ist und auch nicht als gültig gesehen werden kann, kann es ebenfalls nicht schlüssig sein.
    ]),
))

#task(lines: 10, points: 3, [logische Folgerung], [
    Geben Sie zu jedem Argument eine Konklusion an, die logisch aus den Prämissen folgt!
], [
    1. #inference-raw(```
        Alle Vögel können fliegen.
        Ein Pinguin ist ein Vogel.
        ----
        ...
        ```)

    2. #inference-raw(```
        Pinguine leben am Südpol und Eisbären am Nordpol.
        ----
        ...
        ```)

    3. #inference-raw(```
        Die Straße ist nass.
        ----
        ...
        ```)
], (
    (1, [
        Eines der folgenden:
        - "Alle Vögel können fliegen."
        - "Ein Pinguin ist ein Vogel."
        - "Ein Pinguin kann fliegen."
        - äquivalente oder allgemeingültige Aussagen
    ]),

    (1, [
        Eines der folgenden:
        - "Pinguine leben am Südpol und Eisbären am Nordpol."
        - "Pinguine leben am Südpol."
        - "Eisbären leben am Nordpol."
        - äquivalente oder allgemeingültige Aussagen
    ]),

    (1, [
        Eines der folgenden:
        - "Die Straße ist nass."
        - "Es ist nicht der Fall, dass die Straße nicht nass ist."
        - äquivalente oder allgemeingültige Aussagen
    ]),
))

#task(lines: 10, points: 4, extra: true, [Beweis], [
    Beweisen Sie die Gültigkeit des folgenden Arguments durch einen indirekten Beweis!
], [
    #inference(
        [Alle Ärzte sind brilliant.],
        [Alle Chirurgen sind Ärzte.],
        inference-line,
        [Alle Chirurgen sind brilliant.]
    )
], (
    (1, [Die Konklusion wurde verneint.]),
    (1, [Weitere Beweisschritte sind nachvollziehbar.]),
    (1, [Der Widerspruch wurde gefunden.]),
    (1, [Der Beweis wurde mit "QED" beendet.]),
))