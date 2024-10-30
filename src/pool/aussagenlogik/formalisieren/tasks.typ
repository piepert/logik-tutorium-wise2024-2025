#import "/src/templates/exercise.typ": *

#let sätze-formalisieren1 = task([Aussagen formalisieren],[
    Formalisieren Sie die folgenden Aussagen und vergessen Sie das Zuordnungsverzeichnis nicht!

], [
    + Die Sonne scheint.
    + Max isst einen Apfel.
    + Wenn es regnet, dann bleibt Peter zu Hause.
    + Peter hat geschlafen oder er war nicht müde.
    + Anna liebt Musik, aber jetzt liest sie ein Buch.
    + Wenn Peter nichts isst, hat er Hunger.
    + Das Auto startet nicht, obwohl der Tank voll ist.
    + Weder Clara noch Lukas haben heute Zeit für Peter.
    + Lukas und Clara haben immer nur zusammen Zeit für Peter.
    + Entweder ist der Kuchen Schokolade oder Vanille.
    + Obgleich auch wenn der Jupiter und Saturn im Zentrum stehen, auch die Sonne nicht scheint, so ist doch trotzdem die Erde keine Scheibe.

], [
    Hier wurden die Buchstaben "$p$", "$q$", ..., "$t$" für die Aussagenvariablen verwendet. Welche Variablennamen Sie verwendet haben, spielt (noch) keine Rolle, hauptsache die Form stimmt überein.

    #set table(columns: (50%, 50%),
        inset: 0em,
        stroke: none,
        column-gutter: 1em,
        row-gutter: 0.65em)

    #enum(tight: false, spacing: 2em)[
        $p$: Heute geht Tom nach Hause.

        $p$
    ][
        $p$: Die Sonne scheint.

        $p$
    ][
        $r$: Es regnet. \
        $s$: Peter bleibt zu Hause.

        $r -> s$
    ][
        $p$: Peter hat geschlafen. \
        $q$: Peter war müde.

        $p or not q$
    ][
        $t$: Anna liebt Musik. \
        $p$: Anna liest jetzt ein Buch.

        $t and p$
    ][
        $p$: Peter isst etwas. \
        $q$: Peter hat Hunger.

        $¬p -> q$
    ][
        $r$: Das Auto startet. \
        $s$: Der Tank ist voll.

        $¬r and s$
    ][
        $p$: Clara hat Ziet für Peter. \
        $q$: Lucas hat Zeit für Peter.

        $not p and not q$
    ][
        $p$: Clara hat Ziet für Peter. \
        $q$: Lucas hat Zeit für Peter.

        $p <-> q$
    ][

        $q$: Der Kuchen ist Schokolade. \
        $r$: Der Kuchen ist Vanille.

        $(q or r) and not (q and r)$ \
        oder auch \
        $not (p <-> q)$
    ][

        $p$: Jupiter steht im Zentrum. \
        $q$: Saturn steht im Zentrum. \
        $r$: Sonne scheint. \
        $s$: Die Erde ist eine Scheibe.

        $((p and q) -> not r) and not s$
    ]
])

#let sätze-formalisieren-umkehr1 = task[Formeln in natürliche Sprache][
    Übersetzen Sie die Aussagenverknüpfungen in Worte, nutzen Sie dazu das folgende Vokabular.
][
    $p$: Die Temperatur steigt. \
    $q$: Es hat geregnet. \
    $r$: Der Kirschbaum blüht.

    + $(p and q) -> r$
    + $(p -> q) <-> (not p or q)$
    + $not (r -> q)$
    + $not p or (r -> q)$
    + $p <-> not q$
    + $r -> (q or not p)$
][
    + Wenn die Temperatur steigt und es geregnet hat, dann blüht der Kirschbaum.
    + Es ist genau dann der Fall, dass wenn die Temperatur steigt, es regnet, wenn die Temperatur nicht steigt oder es regnet.
    + Es ist nicht der Fall, dass wenn der Kirschbaum blüht, es regnet.
    + Die Temperatur steigt nicht oder wenn der Kirschbaum blüht, dann hat es geregnet.
    + Die Temperatur steigt genau dann, wenn es nicht geregnet hat.
    + Wenn der Kirschbaum blüht, dann hat es geregnet oder die Temperatur steigt nicht.
]

#let grundlagen-argumente-formalisieren1 = task([Formalisierung von Argumenten], [
    Beschreiben Sie das Ziel der Formalisierung eines Arguments.

], [], [
    Die Formalisierung eines Arguments soll das Argument eines Autors als formalen und -- wenn möglich -- gültigen Schluss darstellen. Sollte es der Fall sein, dass ein Autor von einem Fehlschluss gebrauch macht, ist dieser beizubehalten. Die Argumentationsweise sollte so übernommen werden, dass die Meinung des Autors nicht verfälscht wird, unabhängig davon, ob Sie ihm zustimmen oder nicht. Durch diese Rekonstruktion wird es einfacher zu verstehen, wie ein Autor eine Meinung begründet und wie gut das Argument ist, das er dazu benutzt.
])

#let grundlagen-argumente-formalisieren2 = task([Formalisierung von Argumenten], [
    Nennen Sie Ihnen bekannte Signalwörter, die darauf hinweisen, dass ein Satz eine Konklusion sein könnte. Werden diese Wörter immer verwendet?

], [], [
    #list(..ct(full: true, "Beckermann2014/S. 6.+HardySchamberger2018/S. 97."))

    Folgendes sind Signalwörter:
    - also, ergo
    - folglich, infolgedessen, demzufolge, somit
    - daher, deshalb, darum
    - aus .. folgt ...
    - aus ... lässt sich ableiten/ist zu schließen, dass ...
    - ... beweist/zeigt/rechtfertigt/impliziert, dass ...

    Diese Wörter sind gute Hinweise, dass es sich um eine Konklusion handelt, jedoch heißt das nicht, dass ein Satz keine Konklusion ist, wenn die Wörter nicht verwendet werden. Manchmal kann die Konklusion auch ziemlich versteckt sein.
])

#let grundlagen-argumente-formalisieren3 = task([Formalisierung von Argumenten], [
    Nennen Sie Ihnen bekannte Signalwörter, die darauf hinweisen, dass ein Satz eine Prämisse sein könnte. Werden diese Wörter immer verwendet?

], [], [
    #list(..ct(full: true, "Beckermann2014/S. 6.+HardySchamberger2018/S. 96 f."))

    Folgendes sind Signalwörter:
    - da
    - weil
    - denn
    - nämlich
    - aufgrund
    - infolge
    - wegen

    Diese Wörter sind gute Hinweise, dass es sich um eine Prämisse handelt, jedoch heißt das nicht, dass ein Satz keine Prämisse ist, wenn die Wörter nicht verwendet werden. Manchmal kann die Konklusion auch ziemlich versteckt sein.
])

#let grundlagen-argumente-formalisieren4 = task([Formalisierung von Argumenten], [
    Erklären Sie, wie Sie Argumente formalisieren, wenn keine Signalwörter für Prämissen und Konklusionen erkennbar sind. Beschreiben Sie weitere Probleme, die die Formalisierung eines Arguments erschweren können.

], [], [
    Im Skript gibt es dazu eine Passage:
    - #fullcite("HardySchamberger2018", postfix: "S. 97.")

    Die Fragen "Wovon soll ich überzeugt werden?" (für die Konklusion) und "Welche Annahmen müsste ich machen, um in dem Glauben an die Konklusion gerechtfertigt zu sein?" (für die Prämissen) können helfen, Prämissen und Konklusionen zu identifizieren, wenn keinerlei Signalwörter vorhanden sind.

    Häufig enthalten Argumente Auslassungen: Nicht alle Prämissen sind gegeben, da Sie manchmal als "trivial" angesehen werden. Wurde eine Prämisse ausgelassen, muss diese fehlende Prämissen ergänzt werden. Daneben gibt es häufig rhetorische Feinheiten und Erklärungen, die nicht zum Argument gehören, aber als Stütze für den Leser dienen sollen. Diese dürfen nicht mit formalisiert werden.
])

#let argumente-formalisieren-1 = task([Formalisierung von Argumenten], [
    Formalisieren Sie das folgende Argument!
], [
    Immanuel oder Sören kommen dann zur Philosophenparty, wenn Theodor auch kommt. Es ist jedoch ausgeschlossen, dass sowohl Theodor als auch Hannah auf der Party anzutreffen sind. Immanuel kommt zur Philosophenparty. Also bleibt Hannah zu Hause.
], [
    $p$: Immanuel kommt zur Philosophenparty. \
    $q$: Sören kommt zur Philosophenparty. \
    $r$: Theodor kommt zur Philosophenparty. \
    $s$: Hannah kommt zur Philosophenparty.

    #inference-raw(```
    $(p or q) -> r$
    $not (r or s)$
    $p$
    ----
    $not s$
    ```)
])