#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 4,
    suffix-title: [Logische Äquivalenz],
    date: datetime(year: 2024, month: 11, day: 20))

#task(time: [Expertengruppen, 10 min.])[
    Definieren Sie Begriff den Begriff der logischen Wahrheit mit Hilfe Ihres Materials, dem Skript und den Vorlesungsfolien! Erklären Sie anhand eines Beispiels, wie Sie dies innerhalb der Wahrheitstabelle erkennen!
]

"Einen Satz verstehen, heißt, wissen was der Fall ist, wenn er wahr ist."#footnote[Ludwig Wittgenstein: Tractatus logico-philosophicus, 4.024.] -- das kann man bezweifeln, aber es gibt eine gute intuitive Grundlage: Wenn unter diesem Verständnis zwei Sätze äquivalent sind, dann heißt das, dass sie immer in denselben Situationen wahr und in denselben Situationen falsch sind. Sie bedeuten damit quasi das gleiche, ihre Wahrheitswerte können überhaupt nicht unterschiedlich sein.

Logische Äquivalenz bedeutet genau das. Die Sätze "Es regnet." und "Es ist nicht der Fall, dass es nicht regnet." sind immer zusammen wahr. Wenn der eine wahr ist, dann ist auch der andere wahr, wenn der andere wahr ist, auch der eine. Hier ist das vielleicht noch intuitiv, denn klar: eine doppelte Verneinung hebt sich gegenseitig auf. Aber wie ist es mit den Sätzen (1)~"Wenn Weihnachten ist, kommt der Weihnachtsmann." und (2)~"Wenn der Weihnachtsmann nicht kommt, ist nicht Weihnachten."?

Die Wahrheitstafel ist eine Auflistung für alle Bedingungen, in denen ein Satz wahr oder falsch ist. Damit können wir prüfen, ob unter allen Möglichkeiten gilt, dass die Sätze denselben Wahrheitswert haben. Um die beiden oberen Sätze mit der Wahrheitstafel zu prüfen, müssen wir sie zuerst formalisieren:

+ Zuordnungsverzeichnis: \
    $p$: Es ist Weihnachten. \
    $q$: Der Weihnachtsmann kommt.

+ Formalisierung:
    #set enum(numbering: "(1)")
    + $p -> q$
    + $not q -> not p$

#figure(truth-table("p > q", "-q > -p"))

Man sieht, dass beide Sätze in allen Zeilen immer zusammen wahr oder zusammen falsch sind. Damit gilt, dass die Sätze (1) und (2) tatsächlich logisch äquivalent sind. Möchte man formal schreiben, dass ein Satz $alpha$ und ein Satz $beta$ logisch äquivalent sind, dann schreibt man das so:

#figure($alpha tack.r.double limits(inline: #false, tack.l.double)_"AL" beta$)