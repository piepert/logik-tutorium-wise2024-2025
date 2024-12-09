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
    Das Glück ist das höchste Ziel des Menschen.][
    Glück entsteht, wenn wir unsere Lust erhöhen.][
    Wenn wir unsere Lust erhöhen, entsteht das höchste Ziel des Menschen.]

+ #inference-wl[
    Obwohl Robert ohne Fernseher lebt, kauft er sich am Kiosk das Fernsehprogramm.][
    Außerdem kauft er noch eine Packung Zigaretten.][
    Also kauft er sowohl eine Packung Zigaretten als auch das Fernsehprogramm.]