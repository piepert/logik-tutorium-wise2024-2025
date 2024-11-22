#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *

#let otask = task
#let task(title, task, body, hint, solution) = otask(title, task, body, solution, hint)

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 3,
    date: datetime(year: 2023, month: 11, day: 6),
    show-solutions: true,
    show-hints: true)

#task([Formalisierung von Argumenten I], [
    Beschreiben Sie, wie die Normalform von Argumenten aussieht. Bringen Sie das folgende Argument in die Normalform und formalisieren Sie es!

], [
    Alle Menschen können lügen. Ich bin ein Mensch, also kann ich lügen.

], none, [
    Alle Prämissen und Konklusionen sind explizit ausformuliert. Die Prämissen stehen voneinander getrennt am Anfang des Arguments, die Konklusion ist durch ein "Also:" gekennzeichnet und steht am Ende.

    Die Normalform des Arguments ist:

    #block(inset: (left: 2em), table(
        columns: (auto, auto),
        align: bottom,
        inset: 0em,
        stroke: none,
        column-gutter: 1em,

        emph[Also:],
        [
            Alle Menschen können lügen. \
            Ich bin ein Mensch. \
            Ich kann lügen.
        ]
    ))

    Die Formalisierung ist:

    $p$: Alle Menschen können lügen. \
    $q$: Ich bin ein Mensch. \
    $r$: Ich kann lügen.

    ```inference
    $p$
    $q$
    ----
    $r$
    ```
])

#task([Formalisierung von Argumenten II], [
    Bringen Sie das folgende Argument in die Normalform und formalisieren Sie!

], [
    Wenn ich motiviert bin, dann erstelle ich Aufgaben für das Logik-Tutorium. Ich erstelle Aufgaben für das Logik-Tutorium, denn ich bin motiviert!

], none, [
    Die Normalform des Arguments ist:

    #block(inset: (left: 2em), table(
        columns: (auto, auto),
        align: bottom,
        inset: 0em,
        stroke: none,
        column-gutter: 1em,

        emph[Also:],
        [
            Wenn ich motiviert bin, dann erstelle ich Aufgaben für das Tutorium. \
            Ich bin motiviert. \
            Ich erstelle Aufgaben für das Tutorium.
        ]
    ))

    Die Formalisierung ist:

    $p$: Ich bin motiviert. \
    $q$: Ich erstelle Aufgaben für das Tutorium.

    ```inference
    $p -> q$
    $p$
    ----
    $q$
    ```
])

#task([Formalisierung von Argumenten III], [
    Bringen Sie das folgende Argument in die Normalform und formalisieren Sie!

], [
    Weder Peter noch Johannes schießen ein Tor, denn wenn Johannes ein Tor schießt, dann auch Peter. Aber Peter hat kein Tor geschossen.

], none, [
    #normalform[
        Wenn Johannes ein Tor schießt, dann schießt auch Peter ein Tor.][
        Peter schießt kein Tor.][
        Weder Peter noch Johannes schießen ein Tor.#footnote["Weder $p$ noch $q$." bedeutet das gleiche, wie "$p$ ist nicht der Fall und $q$ ist nicht der Fall."]]

    $p$: Johannes schießt ein Tor. \
    $q$: Peter schießt ein Tor.

    ```inference
    $p -> q$
    $not q$
    ----
    $not p and not q$
    ```
])

#task([Formalisierung von Argumenten IV], [
    Schaffen Sie es, das folgende Argument in die Normalform zu bringen?

], [
    In seinen _Meditationen_ untersucht René Descartes unter anderem, wie sich sichere Erkenntnis gewinnen lässt. Ich bezweifle, dass ich meinen Sinnen völlig glauben kann, denn ich lese in der ersten Meditation:

    #blockquote[
        [I]ch habe aber entdeckt, dass [meine Sinne] mich manchmal täuschen; und es ist ein Gebot der Klugheit, niemals denen völlig zu glauben, die uns auch nur einmal getäuscht haben.
    ][Descartes, René: AT VII, 18]

], none, [
    #normalform[
        Meine Sinne täuschen mich manchmal.][
        Man sollte niemandem völlig glauben, der einen auch nur einmal getäuscht hat.][
        Ich sollte meinen Sinnen nicht völlig glauben.]
])

#task([Formalisierung von Argumenten V], [
    Bringen Sie das folgende Argument in die Normalform und formalisieren Sie!

], [
    Gott existiert nicht, denn wenn er existieren würde, dann wäre er allgütig, allwissend und allmächtig.
    Ein allwissender, allgütiger und allmächtiger Gott wüsste von einer Welt ohne Leid und Schmerz, könnte sie herbeiführen und würde das auch tun.
    Dann wäre die Welt ohne Leid und Schmerz, wenn er sie kannte, sie herbeiführen wollte und sie herbeiführen konnte.
    Die Welt ist aber nicht ohne Leid und Schmerz.

], none, [
    #normalform[
        Wenn Gott existiert, ist Gott allgütig, allwissend und allmächtig.][
        Wenn Gott allwissend, allgütig und allmächtig ist, wüsste er von einer Welt ohne Leid und Schmerz, könnte sie herbeiführen und würde das auch tun.][
        Wenn Gott eine Welt ohne Leid und Schmerz kennt, herbeiführen will und konnte, dann ist die Welt ohne Leid und Schmerz.][
        Die Welt ist nicht ohne Leid und Schmerz.][
        Gott existiert nicht.]

    Formalisierung:

    $p$: Gott ist allgütig, allwissend und allmächtig. \
    $q$: Gott weiß von einer Welt ohne Schmerz und Leid. \
    $r$: Gott will eine Welt ohne Schmerz und Leid herbeiführen. \
    $s$: Gott kann eine Welt ohne Schmerz und Leid herbeiführen. \
    $t$: Die Welt ist ohne Leid und Schmerz. \
    $u$: Gott existiert.

    ```inference
    $u -> p$
    $p -> (q and r and s)$
    $(q and r and s) -> t$
    $not t$
    ----
    $not u$
    ```
])

#task([Notwendige und hinreichende Bedingungen I], [
    Beschreiben Sie jeweils in eigenen Worten, wann zwischen zwei Aussagen $alpha$ und $beta$ folgendes gilt:
], [
    + $alpha$ ist eine hinreichende Bedingung für $beta$.
    + $alpha$ ist eine notwendige Bedingung für $beta$.
    + $beta$ ist eine hinreichende Bedingung für $alpha$.
    + $beta$ ist eine notwendige Bedingung für $alpha$.
], none, [
    Unter anderem sind solche Lösungen möglich:

    + $alpha$ ist genau dann eine hinreichende Bedingung für $beta$, wenn $alpha$ das Vorderglied des Konditionals (das Antezedens) in $alpha -> beta$ ist.

    + $alpha$ ist genau dann eine hinreichende Bedingung für $beta$, wenn $alpha$ das Hinterglied des Konditionals (das Konsequenz) in $beta -> alpha$ ist.

    + $beta$ ist genau dann eine hinreichende Bedingung für $alpha$, wenn $beta$ das Vorderglied des Konditionals (das Antezedens) in $beta -> alpha$ ist.

    + $beta$ ist genau dann eine hinreichende Bedingung für $alpha$, wenn $beta$ das Hinterglied des Konditionals (das Konsequenz) in $alpha -> beta$ ist.

    #align(center)[... oder ...]

    + Wenn $alpha$ der Fall ist, dann auch $beta$.
    + Nur wenn $alpha$ der Fall ist, dann auch $beta$.
    + Wenn $beta$ der Fall ist, dann auch $alpha$.
    + Nur wenn $beta$ der Fall ist, dann auch $alpha$.

    #align(center)[... oder ...]

    + Nur wenn $beta$ der Fall ist, dann auch $alpha$.
    + Wenn $alpha$ nicht der Fall ist, dann auch nicht $beta$.
    + Nur wenn $alpha$ der Fall ist, dann auch $beta$.
    + Wenn $beta$ nicht der Fall ist, dann auch nicht $alpha$.

    #align(center)[... oder ...]

    ...

    Die Erklärung dafür: In "$alpha -> beta$" ist $alpha$ die hinreichende und $beta$ die notwendige Bedingung. Die hinreichende Bedingung ist also immer vorne, die hinreichende hinten. Es gibt aber eine Ausnahme:

    Wendet man nun das Gesetz der Kontraposition an, wird aus $alpha -> beta$ der Term $not beta -> not alpha$, beide sind logisch äquivalent. Da beide Sätze also gleichwertig sind, ist auch in $not beta -> not alpha$ das $alpha$ die hinreichende und $beta$ die notwendige Bedingung. Die Negation kann also die hinreichende und notwendige Bedingung vertauschen! Wenn man die Negation mit dazu nimmt, ist natürlich wieder das Vorderglied $not beta$ die hinreichende und das Hinterglied $not alpha$ die notwendige Bedingung.
])

#task([Notwendige und hinreichende Bedingungen II], [
    Erklären Sie, welche Auswirkgung hat das Wort "nur" auf die Formalisierung des folgenden Satzes hat. Formalisieren Sie den Satz und beschreiben Sie kurz, warum Sie sich so entschieden haben und was sie anders getan hätten, wenn das "nur" nicht im Satz vorkäme.

], [
    Nur wenn meine Zähne in der Münze eine Spur hinterlassen, ist sie aus Gold.

], none, [
    $p$: Meine Zähne hinterlassen eine Spur auf der Münze. \
    $q$: Die Münze ist aus Gold.

    Die Formalisierung ist $not p -> not q$ oder $q -> p$, etc. Das "nur" wirkt sich wie eine Negation in beiden Teilsätzen aus, aus dem Satz wird dann: "Wenn meine Zähne in der Münze keine Spur hinterlassen, dann ist sie nicht aus Gold," was die erste Formalisierungsmöglichkeit erklärt. Ohne das "nur" wäre die hinreichende und notwendige Bedingung (das Vorder- und Hinterglied des Konditionals) vertauscht, also: $p -> q$.

])

#task([Notwendige und hinreichende Bedingungen III], [
    Finden Sie jeweils einen AL-Satz, für den gilt:
], [
    + $p$ ist eine hinreichende Bedingung für $q$.
    + $p$ ist eine notwendige Bedingung für $q$.
    + $q$ ist eine hinreichende Bedingung für $p$.
    + $q$ ist eine notwendige Bedingung für $p$.
], none, [
    + $p -> q$
    + $not p -> not q$
    + $q -> p$
    + $not q -> not p$
])