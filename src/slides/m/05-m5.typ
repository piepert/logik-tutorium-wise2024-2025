#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 5,
    date: datetime(year: 2024, month: 11, day: 20))

#task(title: [Aufgabe 1], time: [Stammgruppen, 5 min.])[
    Bestimmen Sie jeweils mit der Wahrheitstabelle, ob die Aussage logisch wahr, erfüllbar oder logisch falsch ist!

    #set list(marker: sym.square)
    + $p and not p$
    + $(p and q) or not p$
    + $(p <-> not q)$
    + $not (p and not p)$
]

#task(title: [Aufgabe 2], time: [Stammgruppen, 5 min.])[
    Zeigen Sie, aus welchen der beiden Sätze "$p$" logisch folgt.
    + $(p or not q) and q$
    + $not q and (q <-> not p)$
]


#task(title: [Aufgabe 3], time: [Stammgruppen, 5 min.])[
    Zeigen Sie, welche der folgenden Aussagen logisch äquivalent zu "$p -> q$" ist!

    + $not p or q$
    + $q -> p$
    + $not q -> not p$
    + $not (p and not q)$
]

#v(1fr)

#task(title: [Zusatz])[
    Beweisen Sie, dass aus den folgenden Sätzen "$not q$" logisch folgt!

    - $not p -> not q$
    - $not r -> not p$
    - $r -> s$
    - $not s$

    Tipp: Bei vier Satzbuchstaben (16 Zeilen in der Wahrheitstabelle) macht es sich eventuell einfacher, eine andere Methode zum Beweisen zu verwenden, wie etwa den Kalkül des natürlichen Schließens.
]