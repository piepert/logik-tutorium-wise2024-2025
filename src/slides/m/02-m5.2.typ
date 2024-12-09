#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 5.1,
    suffix-title: [Normalform],
    date: datetime(year: 2024, month: 10, day: 30))

#task(time: [Stammgruppen, 10 min.])[
    Bringen Sie die folgenden Argumente aus der Normalform in eine natürliche Textform! Benutzen Sie dazu die Hinweiswörter, die Prämissen und Konklusionen kennzeichnen.

    _Hinweis:_ Sie können die Konklusion an jede beliebige Stelle bringen.
]

+ #inference-wl[
    Wenn alle Menschen auf einmal hüpfen, dann gibt es ein riesiges Erdbeben.][
    Nicht alle Menschen haben auf einmal gehüpft.][
    Es gibt kein Erdbeben.]

+ #inference-wl[
    Etwas, was nur Zeichen verarbeitet, kann keinen Inhalt verstehen.][
    Computer verarbeiten nur Zeichen.][
    Computer können keinen Inhalt verstehen.]