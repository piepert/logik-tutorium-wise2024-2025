#import "/src/templates/exercise.typ": project, colors
#import "/src/packages/inference.typ": *
#import colors: *

#show: project.with(title: [Formelsammlung])

#let rule = rule.with(supplement: none)

= Aussagenlogik

== Formalisierung

#[
    #show table.cell.where(y: 0): set text(fill: white)
    #figure(table(columns: (33.33%,)*3,
        align: left,
        stroke: (x, y) => if y == 0 { purple },
        fill: (x, y) => if y == 0 { purple } else if calc.odd(y) { purple.lighten(90%) },
        table.vline(x: 1, stroke: purple),
        table.vline(x: 2, stroke: purple),

        strong[Logischer Ausdruck],
        strong[Logischer Operator],
        strong[Symbol],


        ["nicht", "un-"], [Negation], ["$not$" bzw. "$~$"],
        ["und", "sowohl -- als auch"], [Konjunktion], ["$\&$" bzw. "$and$"],
        ["oder"], [Disjunktion / Adjunktion], ["$or$"],
        ["wenn -- dann"], [Konditional / Subkunktion], ["$supset$" bzw. "$->$"],
        ["genau dann -- wenn"], [Bikonditional / Bisubjunkion], ["$eq.triple$" bzw. "$<->$"],
    ))
]

== Ableitungsregeln im KdnS

+ Mit "#super[T]" markierte Regeln dürfen auch auf Teilformeln angewandt werden.
+ Seien $alpha$, $beta$ und $gamma$ beliebige Sätze der Aussagenlogik.

#set grid.cell(breakable: false)
#show grid: set text(size: 0.85em)
#show grid.cell: block.with(stroke: purple, inset: 1em, width: 100%)
#grid(columns: 2,
    column-gutter: 0.5cm,
    row-gutter: 0.4cm,
    align: center,

    rule(caption: [Modus ponens (MP)], inference-raw(```
    $alpha -> beta$
    $alpha$
    ----
    $beta$
    ```)),

    rule(caption: [Modus tollens (MT)], inference-raw(```
    $alpha -> beta$
    $not beta$
    ----
    $not alpha$
    ```)),

    rule(caption: [Kettenschluss (KS)], inference-raw(```
    $alpha -> beta$
    $beta -> gamma$
    ----
    $alpha -> gamma$
    ```)),

    rule(caption: [Kontraposition (KP)#super[T]], inference-raw(```
    $alpha -> beta$
    ----
    $not beta -> not alpha$
    ```)),

    rule(caption: [Negations-Beseitigung ($not$-Bes.)#super[T]], inference-raw(```
    $not not alpha$
    ----
    $alpha$
    ```)),

    rule(caption: [Negations-Einführung ($not$-Einf.)#super[T]], inference-raw(```
    $alpha$
    ----
    $not not alpha$
    ```)),

    rule(caption: [Konjunktions-Beseitigung ($and$-Bes.)], inference-raw(```
    $alpha and beta$
    ----
    $alpha$
    ```), inference-raw(```
    $alpha and beta$
    ----
    $beta$
    ```)),

    rule(caption: [Konjunktions-Einführung ($and$-Einf.)], inference-raw(```
    $alpha$
    $beta$
    ----
    $alpha and beta$
    ```)),

    rule(caption: [Disjunktiver Syllogismus (DS)], inference-raw(```
    $alpha or beta$
    $not alpha$
    ----
    $beta$
    ```), inference-raw(```
    $alpha or beta$
    $not beta$
    ----
    $alpha$
    ```)),

    rule(caption: [Disjunktions-Einführung ($or$-Einf.)], inference-raw(```
    $alpha$
    ----
    $alpha or beta$
    ```), inference-raw(```
    $alpha$
    ----
    $beta or alpha$
    ```)),

    rule(caption: [Bikonditional-Beseitigung ($<->$-Bes.)#super[T]], inference-raw(```
    $alpha <-> beta$
    ----
    $(alpha -> beta) and (beta -> alpha)$
    ```)),

    rule(caption: [Bikonditional-Einführung ($<->$-Einf.)], inference-raw(```
    $alpha -> beta$
    $beta -> alpha$
    ----
    $alpha <-> beta$
    ```)),

    grid.cell(colspan: 2, rule(caption: [De Morgan'sche Gesetze (DM)#super[T]], inference-raw(```
    $alpha or beta$
    ----
    $not (not alpha and not beta)$
    ```), inference-raw(```
    $not (alpha and beta)$
    ----
    $not alpha or not beta$
    ```), inference-raw(```
    $alpha and beta$
    ----
    $not (not alpha or not beta)$
    ```), inference-raw(```
    $not (alpha or beta)$
    ----
    $not alpha and not beta$
    ```))),

    rule(caption: [Konditional-Ersetzung ($->$-Ers.)#super[T]], inference-raw(```
    $not (alpha -> beta)$
    ----
    $alpha and not beta$
    ```)),

    grid.cell(colspan: 1, rule(caption: [Kommutation (KM)#super[T]], inference-raw(```
    $alpha and beta$
    ----
    $beta and alpha$
    ```), inference-raw(```
    $alpha or beta$
    ----
    $beta or alpha$
    ```), inference-raw(```
    $alpha <-> beta$
    ----
    $beta <-> alpha$
    ```))),

    rule(caption: [Konditional-Einführung ($->$-Einf.)], inference-raw(```
    $x, alpha tack.r beta$
    ----
    $x tack.r alpha -> beta$
    ```)),

    rule(caption: [Reductio ad absurdum (RAA)], inference-raw(```
    $x, alpha tack.r beta, not beta$
    ----
    $x tack.r not alpha$
    ```))
)

= Prädikatenlogik

== Formalisierung

#[
    #show table.cell.where(y: 0): set text(fill: white)
    #figure(table(columns: 3,
        align: left,
        stroke: (x, y) => if y == 0 { purple },
        fill: (x, y) => if y == 0 { purple } else if calc.odd(y) { purple.lighten(90%) },
        table.vline(x: 1, stroke: purple),
        table.vline(x: 2, stroke: purple),

        strong[Logischer Ausdruck],
        strong[Logischer Operator],
        strong[Symbol],


        ["alle(s)", "für jeden Gegenstand gilt"], [Allquantor], ["$forall$"],
        ["einige(s)", "für mindestens einen Gegenstand gilt"], [Existenzquantor], ["$exists$"],
    ))
]

== Ableitungsregeln im KdnS

+ Mit "#super[T]" markierte Regeln dürfen auch auf Teilformeln angewandt werden.
+ Seien $alpha$, $beta$ und $gamma$ beliebige Sätze der Prädikatenlogik.
+ Seien $psi$ und $rho$ beliebige, in $alpha$ frei vorkommende Individuenvariablen.
+ Sei $pi$ eine Individuenkonstante.
+ "$alpha[psi\/pi]$" bedeutet, dass in dem Satz $alpha$ die Variable $psi$ durch die Konstante $pi$ ersetzt wird.

#grid(columns: 2,
    column-gutter: 0.5cm,
    row-gutter: 0.4cm,
    align: center,

    rule(caption: [Quantorentausch (QT)#super[T]], inference-raw(```
    $forall psi alpha$
    ----
    $not exists psi not alpha$
    ```), inference-raw(```
    $exists psi alpha$
    ----
    $not forall psi not alpha$
    ```)),

    rule(caption: [Allquantor-Beseitigung ($forall$-Bes.)], inference-raw(```
    $forall psi alpha$
    ----
    $alpha[psi\/pi]$
    ```)),

    rule(caption: [Existenzquantor-Einführung ($exists$-Einf.)], inference-raw(```
    $alpha$
    ----
    $exists psi alpha[pi\/psi]$
    ```)),

    rule(caption: [Prädikatenlogischer Kettenschluss (PKS)], inference-raw(```
    $forall psi (alpha -> beta)$
    $forall psi (beta -> gamma)$
    ----
    $forall psi (alpha -> gamma)$
    ```)),

    block(align(left)[
        Voraussetzungen:
        + $pi$ kommt _nicht_ in den Annahmen vor.
        + $pi$ kommt _nicht_ in der Konklusion vor.
        + Bei mehrfacher Anwendung der $exists$-Bes. innerhalb eines Beweises oder Zweigs ist für $pi$ jedes mal eine neue Konstante zu verwenden.
    ]+rule(caption: [Existenzquantor-Beseitigung ($exists$-Bes.)], inference-raw(```
    $exists psi alpha$
    ----
    $alpha[psi\/pi]$
    ```))),

    block(align(left)[
        Voraussetzung:
        + $pi$ kommt _nicht_ in den Annahmen vor.
        + $pi$ kommt _nicht_ in der Konklusion vor.
        + Die Zeile, auf die Sie die Allquantor-Einführung anwenden, enthält keinen Namensbuchstaben, den Sie zuvor durch eine Existenzquantor-Beseitigung abgeleitet haben.
    ])+rule(caption: [Allquantor-Einführung ($forall$-Einf.)], inference-raw(```
    $alpha$
    ----
    $forall psi alpha[pi\/psi]$
    ```)),
)