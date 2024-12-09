#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 3,
    suffix-title: [Schlüssigkeit],
    date: datetime(year: 2024, month: 10, day: 30))

#task(time: [10 min.])[
    + Definieren Sie, was ein schlüssiges Argument ist.
    + Erklären Sie Probleme, die mit Schlüssigkeit einhergehen!

    Sie können den folgenden Text oder das Skript benutzen.
]

#show: line-numbering

Deduktiv-gültige Argumente sind ein guter Start, wenn man ein wasserfestes Argument bauen will. Hier sind zwei Beispiele für deduktiv-gültige Argumente:

#figure(grid(columns: 2, column-gutter: 1cm,
    align(left, inference-raw(```
    Wenn der Himmel blau ist, regnet es Gold.
    Der Himmel ist blau.
    ----
    Es regnet Gold.
    ```)),
    align(left, inference-raw(```
    Wenn es Winter wird, dann wird es kälter.
    Es wird Winter.
    ----
    Es wird kälter.
    ```))))

Aber nur eins davon wirkt überzeugend, oder? Das erste ist ziemlicher Quatsch. Warum eigentlich? Beide sind doch deduktiv-gültig. Deduktiv-gültig bedeutet aber nicht, dass die Annahmen oder die Konklusion tatsächlich wahr sind. Genau deshalb brauchen wir noch eine Unterscheidung, die ein Argument gut macht: Wir müssen wahre -- am besten gut begründete -- Prämissen verwenden.

Wir befinden uns am Anfang des Wintersemesters, also gehen dem Winter entgegen. Und es ist Allgemeinwissen, dass wenn wir dem Winter näher kommen, es kälter wird, zumindest in unserer Region. Dadurch, dass wir dies so bereitwillig akzeptieren, wirkt das zweite Argument so viel besser als das erste, es spricht etwas tatsächlich wahres aus.

Schlüssige Argumente sind deduktiv-gültige Argumente, deren Prämissen wahr sind. Fraglich ist nur, woran wir festmachen, dass eine Prämisse tatsächlich wahr ist. Wie begründen wir unsere Prämissen daher? Die Antwort ist einfach: mit weiteren Argumenten! Aber was macht dann diese Argumente gut? Wenn sie schlüssig sein müssen, dann müssten wir sie ja auch begründen, und deren Begründung wiederum auch... solange, bis wir uns im Kreis drehen oder unendlich weitermachen. Das wäre irgendwie blöd. Wie verbleibt man da? Ganz einfach: Irgendwo ist Schluss. Wir brauchen gemeinsame Grundlagen, auf denen wir uns stützen. Diese können z.~B. gemeinsam festgelegt werden. Tatsächlich besitzen wir so eine Festlegung bereits: Wir nennen Sie Allgemeinwissen.

Fassen wir zusammen: Schlüssige Argumente sind deduktiv-gültige Argumente, deren Prämissen wahr sind. Deduktive Gültigkeit macht einen Schluss alleine nicht gut, Schlüssigkeit dagegen Hilft schon sehr. Trotzdem kann man auch ein schlüssiges Argument angreifen und unterstellen, es sei nicht schlüssig -- also mindestens eine seiner Prämissen wäre falsch.