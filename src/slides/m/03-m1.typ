#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 1,
    suffix-title: [Junktoren],
    date: datetime(year: 2023, month: 11, day: 6))

#task(time: [Stammgruppen, 7 min.])[
    Sammeln Sie aus den Aussagesätzen in Ihrem Material die Ihnen bekannten logischen Operationen heraus und erarbeiten Sie die folgenden Merkmale mit Hilfe des Skripts, euren Aufzeichnungen und der Vorlesung:
        - Name des Junktors/der logischen Operation
        - Beispiele in der natürlichen Sprache
        - Zeichen der Sprache AL
        - Wahrheitsbedingungen (Wahrheitstabelle, einfacher Merksatz)
]

+ Es regnet nicht und die Sonne scheint auch nicht.
+ Es ist nicht der Fall, dass es regnet oder die Sonne scheint.
+ Es ist nicht der Fall, dass genau dann, wenn es regnet die Sonne scheint.