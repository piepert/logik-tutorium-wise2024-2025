#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 1,
    suffix-title: [Logische Wahrheit],
    date: datetime(year: 2024, month: 11, day: 20))

#task(time: [Expertengruppen, 10 min.])[
    Definieren Sie Begriff den Begriff der logischen Wahrheit mit Hilfe Ihres Materials, dem Skript und den Vorlesungsfolien! Erklären Sie anhand eines Beispiels, wie Sie dies innerhalb der Wahrheitstabelle erkennen!
]

#show: line-numbering

Logisch wahre Sätze sind die, die wir wohl als "langweilig" bezeichnen würden. Allein aufgrund der Art und Weise, wie man sie formuliert, sind sie wahr und sie können daher auch gar nicht falsch werden. Das Standardbeispiel ist "Es regnet oder es regnet nicht." -- natürlich ist das war, denn eines der beiden muss ja der Fall sein!

Diese Sätze sind aber nicht immer so einfach. Zum Beispiel ist auch der folgende Satz logisch wahr: "Es ist nicht der Fall, dass: (1.)~die Straße nicht nass ist, und (2.)~dass es regnet, und (3.)~dass wenn es regnet, die Straße nass wird."

Um das zu sehen, kann man sich die Wahrheitstabelle vornehmen, dafür muss der Satz formalisiert werden:

+ Zuordnungsverzeichnis: \
    $p$: "Es regnet." \
    $q$: "Die Straße ist nass."

+ Formalisierung: \
    $not (not q and (p and (p -> q)))$

Kann dieser Satz nun falsch werden? Da die Wahrheitstabelle zeigt, wann überhaupt ein Satz wahr oder falsch ist, je nachdem, ob die Einzelaussagen wahr oder falsch sind, kann man dies leicht überprüfen: Wenn ein Satz in der Wahrheitstabelle in jeder Zeile wahr ist, dann ist er logisch wahr.

#figure(truth-table("-(-q & (p & (p > q)))"))

Alle Zeilen sind wahr, d.~h. dass es unmöglich ist, dass der Satz falsch wird, und das allein aufgrund seiner Form!

Logische Wahrheit eines Satzes $alpha$ wird formal so dargestellt:

#figure($limits(inline: #false, tack.r.double)_"AL" alpha$)