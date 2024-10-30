#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 1,
    suffix-title: [deduktive Gültigkeit],
    date: datetime(year: 2023, month: 10, day: 30))

#task(time: [10 min.])[
    + Definieren Sie, was ein deduktiv-gültiges Argument ist.
    + Erklären Sie die Probe, mit der man auf Gültigkeit prüfen kann!
    + Erklären Sie kurz, warum deduktive Gültigkeit allein kein gutes Argument ausmacht!

    Sie können den folgenden Text oder das Skript benutzen.
]

#show: line-numbering

Deduktiv-gültige Argumente können etwas besonderes von sich behaupten: Ihre Konklusion kann niemals falsch werden, wenn ihre Prämissen tatsächlich wahr sind. Die Prämissen erzwingen die Konklusion nämlich, man sagt genauer, dass die Konklusion logisch aus den Prämissen folgt. Zum Beispiel:

#figure(align(left, inference-raw(```
    Gott hat alle perfekten Eigenschaften.
    Was existiert ist perfekter, als das, was nicht existiert.
    ----
    Gott existiert.
```)))

Machen wir doch mal die Probe: Kann ich annehmen, dass die Prämissen wahr aber die Konklusion falsch ist, ohne dass ein Widerspruch entsteht? Hier der Check:

+ Angenommen der Schluss ist nicht deduktiv-gültig. Also gibt es eine Möglichkeit, unter der die Prämissen wahr sind, aber die Konklusion falsch ist:
    #set enum(numbering: "a)")
    + Gott hat tatsächlich alle perfekten Eigenschaften. #h(1fr) (Prämisse 1 ist wahr.)
    + Existenz ist so eine perfekte Eigenschaft. #h(1fr) (Prämisse 2 ist wahr.)
    + Gott existiert aber gar nicht. #h(1fr) (Konklusion sei falsch.)

+ Da Gott nicht existiert und existenz eine perfekte Eigenschaft ist, hat Gott nicht alle perfekten Eigenschaften.

+ *Widerspruch!* 2. und a) widersprechen sich!

+ Also war es falsch anzunehmen, dass die Prämissen wahr, aber die Konklusion falsch sein könnte.

+ Die Konklusion muss also wahr sein, wenn auch die Prämissen es sind. Damit ist der Schluss deduktiv-gültig. #h(1fr) Q.E.D.

Deduktiv-gültige Argumente sind also diejenigen, bei denen die Konklusion logisch aus den Prämissen folgt. Man könnte sagen, dass die Konklusion schon in den Prämissen versteckt ist und wir als Logiker nur Archäologen spielen, die "freibuddeln", was schon längst da war.

Aber müssen wir jetzt an Gott glauben? Wir haben zwar bewiesen, dass _wenn_ man die Prämissen für wahr hält, Gott existieren _muss_, aber wir haben nie bewiesen, _dass_ die Prämissen _tatsächlich_ wahr sind! Wir haben es nur mal für die Probe angenommen. Gültige Argumente zwingen uns also, die Konklusion zu akzeptieren, _wenn_ wir die Prämissen akzeptieren. Sie zwingen uns aber nicht, die Prämissen zu akzeptieren!