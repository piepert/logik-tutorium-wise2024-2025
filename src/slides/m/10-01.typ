#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 1,
    suffix-title: [Allquantorregeln],
    date: datetime(year: 2024, month: 12, day: 11))

#task(time: [GA, 20 min.])[
    + Erarbeiten Sie sich in Ihren Gruppen die Allquantorbeseitigung und Allquantoreinführung.
    + Präsentieren Sie Ihr Ergebnis im Plenum anhand mindestens eines Beispiels! (Hinweise dazu auf dem Material.)
]

= Allquantorbeseitigung ($forall$-Bes.)
- Motivieren Sie kurz an einem Beispiel aus dem Alltag, warum die Regel gültig sein könnte.

- Was muss eine Zeile erfüllen, damit man darauf die Allquantorbeseitigung anwenden kann?

- Welche Stolperfallen könnte es geben? Als Anreiz und Beispiel können Sie die folgenden Schlüsse betrachten und entscheiden, ob diese gültig sind. Wenn Sie diese als gültig klassifizieren, dann geben Sie eine kurze Erklärung an. Wenn Sie diese als ungültig klassifizieren, müssen Sie diese durch ein Gegenbeispiel widerlegen:

    #figure(stack(dir: ltr, spacing: 1.5em,
        inference-raw(```
        $forall x forall y F x y$
        ----
        $F a a$
        ```),

        inference-raw(```
        $forall x forall y F x y$
        ----
        $F a b$
        ```),

        inference-raw(```
        $forall x F x x$
        ----
        $F a a$
        ```),

        inference-raw(```
        $forall x F x x$
        ----
        $F a b$
        ```),
    ))

- Sie können als größeres Beispiel das Folgende beweisen:

    #inference-raw(```
    $F a$
    $forall z ((F z or G z) -> H z)$
    ----
    $H a$
    ```)

= Allquantoreinführung ($forall$-Einf.)
- Erklären Sie zunächst an einem Beispiel, warum die Regel auf den ersten Blick _inkorrekt_ zu sein scheint (und in den meisten Fällen auch ist).

- Erklären Sie die vier Einschränkungen, unter denen man die Regel doch machen darf.#footnote[Siehe Formelsammlung. Siehe auch @HardySchamberger2018[S. 181 ff., 254 f]]

- Vergleichen Sie die Anwendung der Regel an einem Beispiel, es ist ähnlich wie das obige:

    #inference-raw(```
    $forall x F x$
    $forall z ((F z or G z) -> H z)$
    ----
    $forall x H x$
    ```)