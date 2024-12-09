#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 2,
    suffix-title: [Junktoren],
    date: datetime(year: 2024, month: 11, day: 6))

#task(time: [Stammgruppen, 7 min.])[
    Sammeln Sie aus den Aussagesätzen in Ihrem Material die Ihnen bekannten logischen Operationen heraus und erarbeiten Sie die folgenden Merkmale mit Hilfe des Skripts, euren Aufzeichnungen und der Vorlesung:
        - Name des Junktors/der logischen Operation
        - Beispiele in der natürlichen Sprache
        - Zeichen der Sprache AL
        - Wahrheitsbedingungen (Wahrheitstabelle, einfacher Merksatz)
]

+ Genau dann wird jemand bekämpft, wenn einer gegen jemanden kämpft.
+ Wenn einer spricht, hören alle zu.
+ Alle schlafen oder mindestens einer ist wach.