#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 2,
    suffix-title: [Logische Falschheit und Erfüllbarkeit],
    date: datetime(year: 2024, month: 11, day: 20))

#task(time: [Expertengruppen, 10 min.])[
    Definieren Sie Begriff den Begriff der logischen Falschheit und der Erfüllbarkeit mit Hilfe Ihres Materials, dem Skript und den Vorlesungsfolien! Erklären Sie anhand eines Beispiels, wie Sie dies innerhalb der Wahrheitstabelle erkennen!
]

#show: line-numbering

Unter einigen komisch klingenden Sätzen kann man sich etwas vorstellen: "Ein pinker Elefant schwebt durch den Raum." Das hat sicher schon ein Bild in Ihrem Kopf ausgelöst. Dann gibt es aber auch Sätze, darunter kann man sich nicht wirklich etwas vorstellen: "Es regnet und es regnet nicht." -- Welches Bild soll da entstehen? Wie sieht eine Welt aus, in der es sowohl in der selben Zeit und am selben Ort regnet und nicht regnet? Das kann ja beides gar nicht zusammen der Fall sein.

Einige dieser unmöglichen Sätze (die wir sonst "Widersprüche" oder "Kontradiktionen" nennen), sind allein aufgrund ihrer Form falsch.#footnote[Es gibt auch widersprüchliche Sätze, die nicht aufrund ihrer Form falsch sind, z.~B. "Ich male einen viereckigen Kreis." Seine Form ist nicht widersprüchlich, sondern die Bedeutung der Wörter, die kombiniert wurden.] "Es regnet." und "Es regnet nicht." (jeweils einzeln betrachtet) können schon wahr werden, aber "Es regnet und es regnet nicht." kann nicht mehr wahr werden.

Dass der Satz komisch ist, sieht man direkt. Aber wie ist es mit dem Satz folgenden Satz? "Die Straße ist nicht nass und es regnet und wenn es regnet, dann ist die Straße nass." -- hier dauert es schon ein paar Sekunden länger, bis man das erkennt. Ganz sicher kann uns das aber die Wahrheitstabelle zeigen. In jeder Zeile gibt sie an, was passiert, wenn die Teilsätze wahr oder falsch sind. Wenn ein Satz in einer Wahrheitstabelle keine Zeile hat, in der er wahr ist, dann nennt man ihn "logisch falsch". Dafür müssen wir zuerst formalisieren:

#columns(2)[
1. Zuordnungsverzeichnis: \
    $p$: Es regnet. \
    $q$: Die Straße ist nass.
#colbreak()
2. Formalisierung: \
    $(not q and (p and (p -> q)))$
]

Dann sieht man, dass keine Zeile wahr und der Satz damit logisch falsch ist:

#figure(truth-table("(-q & (p & (p > q)))"))

Sätze, die nicht logisch falsch sind (die also mindestens eine Zeile in der Wahrheitstabelle haben, die wahr ist) nennt man "erfüllbar". Denn es ist theoretisch möglich, dass sie wahr werden oder sein könnten, sie könnten erfüllt werden, daher "erfüllbar".