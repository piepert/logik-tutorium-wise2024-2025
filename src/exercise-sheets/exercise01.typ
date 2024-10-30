#import "/src/templates/exercise.typ": project, task, blockquote
#import "/src/packages/inference.typ": *

#show: project.with(no: 1,
    date: datetime(year: 2023, month: 10, day: 23),
    show-solutions: true,
    show-hints: true)

#task([#smallcaps[Def.] Argumentationstheorie], [
    Beschreiben Sie in eigenen Worten, womit sich die Argumentationstheorie beschäftigt.
], [], [
    Die Argumentationstheorie beschäftigt sich mit der Untersuchung der Kriterien und Prinzipien, mit deren Hilfe sich gute von schlechten Argumenten unterscheiden lassen.
])

#task([#smallcaps[Def.] Logik], [
    Beschreiben Sie in eigenen Worten, womit sich die Logik beschäftigt.

], [], [
    Logik ist /*die Wissenschaft des Wörtchens "also" (und entsprechend funktionierender Wörter anderer Sprachen), d. h.*/ die Wissenschaft, die zu systematisieren versucht, unter welchen Bedingungen die Behauptung, einen gültigen Schluss vorgebracht zu haben, als gerechtfertigt gelten kann.

])

#task([Logik und Argumentationstheorie], [
    Erklären Sie, in welchem Verhältnis die Logik und Argumentationstheorie stehen!

], [], [
    Die Logik ist der Teil der Argumentationstheorie, der sich auf einen speziellen Aspekt der Güte von Argumenten beschränkt: auf ihre deduktive Gültigkeit.

])

#task(key: "def-argument", [#smallcaps[Def.] Argument], [
    Definieren Sie in eigenen Worten, was ein philosophisches Argument ist.

], [], [
    Ein Argument ist eine Folge von Aussagesätzen, die aus Prämissen und einer Konklusion besteht. Von dieser Folge wird behauptet, dass die Prämissen die Konklusion stützen, d.h. es mache Sinn, die Konklusion für wahr zu halten, falls die Prämissen wahr sind.
])

#task(key: "def-gültiger-schluss", [#smallcaps[Def.] Gültiger Schluss / Logische Folgerung], [
    Definieren Sie in eigenen Worten, was ein gültiger Schluss ist.

], [], [
    Ein gültiger Schluss besteht aus mindestens einer Prämisse und genau einer Konklusion, sodass gilt: Wenn die Prämissen wahr sind, dann ist es notwendigerweise auch die Konklusion.
])

#task(extra: true)[Argumentationstheorie][
    Nennen Sie das, was sie brauchen, um mit jemandem diskutieren zu können. Begründen Sie ihre Entscheidung kurz.
][
    Angenommen, Peter ist Ihr Diskussionsteilnehmer. Peter widerspricht Ihnen in allen Ihren Punkten, egal wie plausibel sie sind. Irgendwie haben Sie nichts, womit Sie Peter überzeugen können. Auch wenn Sie sagen würden "Der Himmel ist blau.", würde Peter Ihnen widersprechen. Auf Nachfrage meint Peter: "Ich glaube dir gar nichts!" Warum können Sie so nicht mit Peter diskutieren?
][
    Sie brauchen (1.) eine Bereitschaft zur Diskussion und (2.) eine Diskussionsbasis, eine kleinste gemeinsame Wirklichkeit. Sie können Peter nicht überzeugen, wenn Sie keine gemeinsame Diskussionsgrundlage finden, auf der Sie diskutieren können. Alle Ihre Argumente sind vergebens, wenn Peter sie ignoriert oder nicht akzeptiert.
]