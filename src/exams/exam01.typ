#import "/src/templates/exercise.typ": *
#import "/src/packages/inference.typ": *

#show: project.with(
    no: 1,
    type: [LEV],
    suffix-title: [Logische Grundlagen],
    show-namefields: true,
    show-lines: true
)

#task(lines: 10, points: 3)[Grundbegriffe][
    Erklären Sie, womit sich die Logik beschäftigt. Nennen Sie außerdem die zwei Gütekriterien von Argumenten.
]

#task(lines: 20, points: 6)[Gütekriterien][
    Beurteilen Sie die folgenden Argumente jeweils im Bezug auf die zwei Gütekriterien!
][
    1. #inference(
        [Wenn ich auf dem Mond laufe, kann ich höher springen als auf der Erde.],
        [Ich laufe auf dem Mond.],
        inference-line,
        [Ich kann höher springen als auf der Erde.])

    2. #inference(
        [Entweder alle Kirschen sind grün oder es regnet Sonnenstrahlen.],
        [Nicht alle Kirschen sind grün.],
        inference-line,
        [Also regnet es Sonnenstrahlen.])

    3. #inference([Alle Menschen können Fleisch essen.],
        inference-line,
        [Alle Menschen sollten Fleisch essen.])
]

#task(lines: 10, points: 3)[logische Folgerung][
    Geben Sie zu jedem Argument eine Konklusion an, die logisch aus den Prämissen folgt!
][
    1. #inference(
        [Alle Vögel können fliegen.],
        [Ein Pinguin ist ein Vogel.],
        inference-line,
        [...])

    2. #inference(
        [Pinguine leben am Südpol und Eisbären am Nordpol.],
        inference-line,
        [...])

    3. #inference(
        [Die Straße ist nass oder es regnet nicht.],
        [Die Straße ist nicht nass.],
        inference-line,
        [...])
]

#task(lines: 10, points: 4, extra: true)[Beweis][
    Beweisen Sie das folgende Argument durch einen indirekten Beweis!
][
    #inference(
        [Alle Affen sind brilliant.],
        [Alle Chimpansen sind Affen.],
        inference-line,
        [Alle Chimpansen sind brilliant.]
    )
]