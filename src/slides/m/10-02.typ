#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 1,
    suffix-title: [Existenzquantorregeln],
    date: datetime(year: 2024, month: 12, day: 11))

#task(time: [GA, 20 min.])[
    + Erarbeiten Sie sich in Ihren Gruppen die Existenzquantorbeseitigung und Existenzquantoreinführung.
    + Präsentieren Sie Ihr Ergebnis im Plenum anhand mindestens eines Beispiels! (Hinweise dazu auf dem Material.)
]

= Existenzquantoreinführung ($exists$-Einf.)
- Motivieren Sie kurz an einem Beispiel aus dem Alltag, warum die Regel gültig sein könnte.

- Was muss eine Zeile erfüllen, damit man darauf die Existenzquantorbeseitigung anwenden kann?

- Welche Stolperfallen könnte es geben? Als Anreiz und Beispiel können Sie die folgenden Schlüsse betrachten und entscheiden, ob diese gültig sind. Wenn Sie diese als gültig klassifizieren, dann geben Sie eine kurze Erklärung an. Wenn Sie diese als ungültig klassifizieren, müssen Sie diese durch ein Gegenbeispiel widerlegen:

    #figure(stack(dir: ltr, spacing: 1.5em,
        inference-raw(```
        $F a a$
        ----
        $exists x F x x$
        ```),

        inference-raw(```
        $F a a$
        ----
        $exists x F a x$
        ```),

        inference-raw(```
        $F a a$
        ----
        $exists x exists y F x y$
        ```),

        inference-raw(```
        $F a b$
        ----
        $exists x F x x$
        ```),
    ))

- Sie können als größeres Beispiel das Folgende beweisen:

    #inference-raw(```
    $forall x (F x <-> G x)$
    ----
    $exists z F z$
    ```)

= Existenzquantorbeseitigung ($exists$-Bes.)
- Erklären Sie zunächst an einem Beispiel, warum die Regel in vielen Fällen _inkorrekt_ angewendet wird.

- Erklären Sie die zwei Einschränkungen, unter denen man die Regel doch machen darf.#footnote[Siehe Formelsammlung. Siehe auch @HardySchamberger2018[S. 181 ff., 254 f]]

- Vergleichen Sie die Anwendung der Regel an einem Beispiel, es ist ähnlich wie das obige:

    #inference-raw(```
    $forall y (F y or not G y)$
    $exists x G x$
    ----
    $exists x F x$
    ```)