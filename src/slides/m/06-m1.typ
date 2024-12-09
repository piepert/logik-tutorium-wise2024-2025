#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 1,
    date: datetime(year: 2024, month: 11, day: 27))

#task(time: [GA, 5 min.])[
    Hier finden Sie einige Zeilen eines Kalküls wild durcheinander! Bringen Sie die Zeilen so in eine Ordnung, dass eine korrekte Ableitung entsteht!
]

#columns(2)[

+ #table(
    inset: 0pt,
    row-gutter: 0.5em,
    column-gutter: 1em,
    columns: 3,
    stroke: none,

    $not r and q$, [], [Ann.],
    $s$, [4, 5], [DS, q.e.d.],
    $r or s$, [1, 3], [MP],
    $not r$, [2], [$and$-Bes.],
    $q$, [2], [$and$-Bes.],
    $q -> (r or s)$, [], [Ann.],
)

#colbreak()

// #table(
//     columns: 3,
//     row-gutter: -0.25em,
//     stroke: none,

//     $not r and q$, [], [Ann.],
//     $q -> (r or s)$, [], [Ann.],
//     $q$, [2], [$and$-Bes.],
//     $not r$, [2], [$and$-Bes.],
//     $r or s$, [1, 3], [MP],
//     $s$, [4, 5], [DS, q.e.d.],
// )

// #table(
//     columns: 3,
//     row-gutter: -0.25em,
//     stroke: none,

//     $p -> not (r or q)$, [], [Ann.],
//     $s or q$, [], [Ann.],
//     $t -> not s$, [], [Ann.],
//     $t and r$, [], [Ann.],
//     $t$, [4], [$and$-Bes.],
//     $r$, [4], [$and$-Bes.],
//     $not s$, [5, 3], [MP],
//     $q$, [2, 7], [DS],
//     $r and q$, [6, 8], [$and$-Einf.],
//     $not not (r and q) -> not p$, [1], [KP],
//     $not not (r and q)$, [9], [$not$-Bes.],
//     $not p$, [10, 11], [MP],
// )
]

#task(title: [Zusatzaufgabe])[
    Bearbeiten Sie eine der folgenden Aufgaben!

    + Bringen Sie auch das folgende KdnS in Ordnung!

        #table(
            inset: 0pt,
            row-gutter: 0.5em,
            column-gutter: 1em,
            columns: 3,
            stroke: none,

            $not s$, [5, 3], [MP],
            $r and q$, [6, 8], [$and$-Einf.],
            $p -> not (r or q)$, [], [Ann.],
            $t -> not s$, [], [Ann.],
            $t and r$, [], [Ann.],
            $not p$, [10, 11], [MP, q.e.d.],
            $r$, [4], [$and$-Bes.],
            $q$, [2, 7], [DS],
            $not not (r and q) -> not p$, [1], [KP],
            $s or q$, [], [Ann.],
            $not not (r and q)$, [9], [$not$-Einf.],
            $t$, [4], [$and$-Bes.],
        )

    + Beweisen Sie den folgenden Schluss mit dem KdnS!

        #inference-raw(```
        $not p and q -> r$
        $not r$
        $q$
        ----
        $p$
        ```)
]