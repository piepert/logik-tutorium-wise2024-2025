#import "/src/templates/exercise.typ": project, task, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/kdns.typ": *

#show: project.with(no: [--- Semantik und KdnS für AL],
    date: datetime(year: 2023, month: 10, day: 23),
    show-solutions: true,
    show-hints: true)

#task(extra: true)[Ontologischer Gottesbeweis][
    Beweisen Sie das folgende Argument!
][
    #blockquote[Wir glauben nämlich, dass Du [Gott] etwas bist, über das hinaus nichts Größeres gedacht werden kann. [...] Und gewiss kann das, über das hinaus Größeres nicht gedacht werden kann, nicht allein nur im Verstand sein. Wenn es nämlich wenigstens allein nur im Verstand ist, dann kann gedacht werden, dass es auch in Wirklichkeit ist, was größer ist. Wenn also das, über das hinaus Größeres nicht gedacht werden kann, allein nur im Verstand ist, dann ist das, über das hinaus Größeres nicht gedacht werden kann, etwas, über das hinaus Größeres gedacht werden kann. Das aber kann gewiss nicht sein. Es existiert also ohne Zweifel etwas, über das hinaus Größeres nicht gedacht werden kann, sowohl im Verstand als auch in Wirklichkeit.][
        Anselm von Canterburry: Proslogion, Kapitel II.
    ]

    Sie können die folgende Normalform als Hilfestellung benutzen:

    #inference-raw(```
        [P1] Wir glauben nämlich, dass du [Gott] etwas bist, über das hinaus nichts Größeres gedacht werden kann.
        [P2] Wenn es nämlich wenigstens allein nur im Verstand ist, dann kann gedacht werden, dass es auch in Wirklichkeit ist, was größer ist [dann ist Gott nicht das, über das hinaus nichts Größeres gedacht werden kann].
        [ZA] Das, über das hinaus Größeres nicht gedacht werden kann, ist allein nur im Verstand.
        ----
        [C1: P2, ZA] Das, über das hinaus Größeres nicht gedacht werden kann, ist nicht etwas, über das hinaus Größeres nicht gedacht werden kann.
        ----
        [C2: C1, P1] Das aber kann gewiss nicht sein. Gewiss kann das, über das hinaus Größeres nicht gedacht werden kann, nicht allein nur im Verstand sein.
        ----
        [C3] Es existiert also ohne Zweifel etwas, über das hinaus Größeres nicht gedacht werden kann, sowohl im Verstand als auch in Wirklichkeit.
    ```)
][
    $h$: das, worüber hinaus Größeres nicht gedacht werden kann

    $g$: Gott ist $h$. \
    $v$: $h$ ist nur im Verstand. \
    $w$: $h$ ist in Wirklichkeit.

    #kdns(show_premises: true, ```
    a, g, P
    b, v -> not g, P
    c, v, ZA
    d, not g, MP, a&c
    e0, not v -> w, P
    e, not v, RAA, a&d&c
    f, w, MP, e0&e
    ```)
]