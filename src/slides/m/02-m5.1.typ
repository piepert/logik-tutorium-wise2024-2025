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
    Was ich nicht messen kann, ist sinnlos.][
    Für "Gott" gibt es keine messbaren Eigenschaften.][
    Gott ist sinnlos.]

+ #inference-wl[
    Der Entschluss des Richters steht nur fest, wenn alle Beweismittel gesammelt wurden.][
    Es wurden alle Beweismittel gesammelt, wenn die Ermittlungen abgeschlossen sind.][
    Die Polizei hat die Ermittlungen abgeschlossen.][
    Der Entschluss des Richters steht fest.]