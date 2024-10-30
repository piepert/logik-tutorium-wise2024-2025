#import "/src/templates/exercise.typ": project, task, blockquote
#import "/src/packages/inference.typ": *

#let studipath(..args) = {
    args.pos().map(e => box(smallcaps(e))).join([ $»$ ])
}

#let ssc(body) = strong(smallcaps(body))

#show: project.with(no: 1,
    date: datetime(year: 2023, month: 10, day: 23),
    show-solutions: true,
    show-hints: true)

/* #task[Einführung][Lesen Sie den folgenden Text.][
    #ssc[Was ist das hier?] Hier gibt es einige Übungsaufgaben, angelehnt an die Inhalte der Vorlesung. Die Aufgaben sind freiwillig und können genutzt werden, um bekannte Dinge zu üben sowie Wissenslücken aufzudecken. Sehen Sie diese Aufgaben als Möglichkeit, sich selbst herauszufordern! Wenn Sie an einer Aufgabe verzweifeln, stellen Sie Ihren Kommilitonen, dem Tutor Ihres Vertauens oder sogar dem Internet Fragen. Andere Kommilitonen stellen sich die Frage wahrscheinlich auch! Etwas nicht zu wissen oder zu können, bietet die Möglichkeit, Neues zu lernen.

    #ssc[Niemand weiß alles.] Da wir Menschen alle unterschiedlich sind und mit unterschiedlichen Voraussetzungen dieses Studium antreten, werden diese Aufgaben in unterschiedlichen Kategorien mit unterschiedlicher Komplexität gestellt, damit alle ein eigenes Lerntempo finden können. Aufgaben am Anfang des Blattes sollen einfacher, Richtung Ende sollen schwerer sein. Außerdem wird es _Knobeleien_ geben, die den Stoff aus einer anderen, meist philosophisch-argumentativen und praxisnahen Perspektive darstellen sollen. Lesen Sie sich diese ruhig durch und staunen Sie, wozu Sie in der Lage sind, wenn Sie sich selbst nur die Möglichkeit dazu geben! Sind Ihnen Aufgaben zu schwer, lassen Sie sie weg oder holen Sie sich Hilfe. Wenn Sie etwas ausgelassen haben, kommen Sie zu einem späteren Zeitpunkt auf diese Aufgaben zurück und versuchen Sie diese erneut zu bearbeiten.

    #ssc[Schwierigkeit & Vergleich.] Da wir alle jedoch wie gesagt unterschiedlich sind, kann eine Aufgabe für Sie sehr einfach, aber für Ihren Sitznachbarn sehr schwer sein. Suchen Sie sich Aufgaben heraus, die Sie bewältigen können, und trauen Sie sich außerdem, Aufgaben auszuwählen, an denen Sie wachsen können! Messen Sie sich an keinem außer sich selbst. Sie sind einzigartig, machen Sie davon Gebrauch! Ihnen werden bewusst mehr Aufgaben gegeben, als dass Sie diese zeitlich im Tutorium lösen könnten. Wählen Sie Aufgaben, die Sie üben wollen und die sie eventuell nicht alleine schaffen. Die restlichen können Sie z.B. als Klausurvorbereitung und Aufbereitung im Selbststudium benutzen.

    #ssc[Weitere Materialien.] Zusätzlich zu den Aufgaben werden Lösungsvorschläge bereitgestellt, falls sie Ihre Antowrt kontrollieren wollen. Richtig zu liegen heißt jedoch nicht, selbst genau den gleichen Weg zu haben wie in den Lösungsvorschlägen. Ihr Weg kann auch richtig sein, wenn er nicht dem Lösungsvorschlag entspricht, oder wenn sich der Lösungsvorschlag und Ihre Lösung widersprechen! Manchmal gehen die Lösungvorschläge über die eigentliche Antwort hinaus, um den Sachverhalt genauer zu erklären oder weitere Denkanstöße zu geben. Sie müssen nicht alles so ausführlich wie in den Lösungsvorschlägen beantworten! Vertrauen Sie Ihrem Können und lassen Sie uns gemeinsam über Ihre Gedanken diskutieren!

    #ssc[Letzte Hinweise.] Für einen optimalen Lernerfolg bietet es sich an, die Aufgaben zuerst alleine zu bearbeiten und erst nach dem eigenen Versuch diese mit einem Partner zu besprechen, einen Tutor Ihres Vertrauens dazu zu holen oder die Lösungsvorschläge zu konsultieren. Was und wann Sie von etwas Gebrauch machen, ist jedoch komplett Ihnen überlassen. Für noch mehr Lernerfolg: Sie haben Schwierigkeiten mit einer Aufgabe? Formulieren Sie genau, wo Ihr Problem ist, bevor Sie sich auf die Suche nach einer Antwort machen. Was fehlt Ihnen und warum könnte es Ihnen fehlen? Durch diese Selbstreflexion wird Ihnen schneller klar, wo Sie ansetzen können und es wird für andere einfacher, Ihnen zu helfen.

    Außerdem: Sie haben Vorschläge, Anregungen oder Feedback? Zögern Sie nicht, es zu äußern!

    #ssc[Viel Spaß und Erfolg!]
] */

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
    In welchem Verhältnis stehen Logik und Argumentationstheorie?

], [], [
    Die Logik ist der Teil der Argumentationstheorie, der sich auf einen speziellen Aspekt der Güte von Argumenten beschränkt: auf ihre deduktive Gültigkeit.

])

#task(extra: true)[Argumentationstheorie][
    Nennen Sie das, was sie brauchen, um mit jemandem diskutieren zu können. Begründen Sie ihre Entscheidung kurz.
][
    Angenommen, Peter ist Ihr Diskussionsteilnehmer. Peter widerspricht Ihnen in allen Ihren Punkten, egal wie plausibel sie sind. Irgendwie haben Sie nichts, womit Sie Peter überzeugen können. Auch wenn Sie sagen würden "Der Himmel ist blau." würde Peter Ihnen widersprechen. Auf Nachfrage warum, meint Peter: "Ich glaube dir halt nicht!" Warum können Sie so nicht mit Peter diskutieren?
][
    Sie brauchen (1.) eine Bereitschaft zur Diskussion und (2.) eine Diskussionsbasis, eine kleinste gemeinsame Wirklichkeit. Sie können Peter nicht überzeugen, wenn Sie keine gemeinsame Diskussionsgrundlage finden, auf der Sie diskutieren können. Alle Ihre Argumente sind vergebens, wenn Peter sie ignoriert oder nicht akzeptiert.
]

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

#task([Argument vs. Schluss], [
    Gibt es laut der Vorlesung einen Unterschied zwischen logischen Argumenten und Schlüssen?
], [], [
    Nein. Die Wörter "Argument" und "Schluss" werden in der Vorlesung synonym verwendet.
])

#task([Schlüssige Argumente], [
    Beschreiben Sie, was schlüssige und gültige Argumente unterscheidet.
], [], [
    Ein Schlüssiges Argument ist ein gültiges Argument, bei dem alle Prämissen wahr sind.
])

#task[Gültige Argumente][
    Beurteilen und begründen Sie, ob das folgende Argument gültig ist.
][
    Haarausfall ist vererblich, \
    Fisch ist leicht verderblich \
    und darum bin ich sterblich!
][
    Das Argument ist ungültig. Wenn ich das Gegenteil der Konklusion annehme, also: "Ich bin nicht sterblich.", steht dies weder im Widerspruch zu "Haarausfall ist vererblich." noch zu "Fisch ist leicht verderblich." Daher folgt die Konklusion nicht notwendigerweise aus den Prämissen und der Schluss ist nicht gültig.
]

#task[Ungültigkeit, Gültigkeit, Schlüssigkeit][
    Beurteilen und begründen Sie, welche der folgenden Argumente ungültig, gültig und/oder schlüssig sind.

][
    + #[
        Wenn ich meinen Stift fallen lasse, dann wird er von der Erde angezogen, denn die Erde zieht alles an.
    ]

    + #[
        Wenn alle Menschen auf einmal hüpfen, dann gibt es ein riesiges Erdbeben. \
        Nicht alle Menschen haben auf einmal gehüpft. \
        Also gibt es kein Erdbeben.
    ]

    + #[
        Vögel können nicht fliegen. \
        Also kann Peter nicht fliegen, wenn er ein Vogel ist.
    ]

][
    + Das Argument ist gültig und auch schlüssig. Es ist gültig, da das Gegenteil der Konklusion ("Der Stift wird nicht von der Erde angezogen.") der zweiten Prämisse ("Die Erde zieht alles an.") widerspricht. Es ist schlüssig, da alles, was eine Masse hat, andere Objekte mit einer Masse anzieht.

    + Das Argument ist ungültig, denn es kann auch ohne, dass alle Menschen hüpfen, ein Erdbeben geben. Das schließen die Prämissen nicht aus. Es geht nur darum, _wenn_ alle Menschen hüpfen, dass es ein Erdbeben gibt, es wird aber nicht gesagt, dass es _nur_ dann passiert.

    + Das Argument ist gültig, aber nicht schlüssig. Angenommen, Vögel können nicht fliegen. Dann kann Peter nicht fliegen, wenn er ein Vogel ist. Das kann man sich vorstellen. Aber die Prämisse, dass Vögel nicht fliegen können, ist nicht auf die Realität zutreffend und daher ist das Argument nicht schlüssig.
]

#task([#smallcaps[Def.] Fehlschluss], [
    Definieren Sie in eigenen Worten, was ein Fehlschluss ist. Nennen und erklären Sie einen Fehlschluss! Geben Sie ein Beispiel für ein ungültiges Argument, das unter diesen Fehlschluss fällt.

], [], [
    Fehlschlüsse sind Muster ungültiger Argumente oder auch einzelne ungültige Argumente.

    Einige gängige Fehlschlüsse mit Erklärung:

    #[#set text(size: 0.8em)
    #align(center, block(align(left, grid(columns: (17.5%, auto),
        column-gutter: 0.125cm,
        row-gutter: 2em,

        strong[Fehlschluss], strong[Erklärung],

        emph[Sein-Sollen-\ Fehlschluss], [
            Der Sein-Sollen-Fehlschluss bezeichnet ein Argument, bei dem von einer deskriptiven (beschreibende) Aussage auf eine normative (wertende) Aussage geschlossen wird. Z.B.:

            #blockquote[
                #normalform[
                    Menschen können Fleisch essen.][
                    Menschen sollen Fleisch essen.]

                Problem: Nur weil man etwas kann, heißt es nicht, dass man es auch tun muss.  Von daher kann die Konklusion falsch sein, während die Prämissen wahr sind, der Schluss ist nicht gültig.
            ][]

            #blockquote[
                #normalform[
                    Dein Schreibtisch ist unordentlich.][
                    Du solltest deinen Schreibtisch aufräumen.]

                Problem: Vielleicht wollen wir ja unordentliche Schreibtische, das wurde nirgendwo spezifiziert. Von daher kann die Konklusion falsch sein, während die Prämissen wahr sind, der Schluss ist nicht gültig. (Den Satz kürze ich in Zukunft mit "→ ungültiger Schluss" ab.)
            ][]

            In all diesen Schlüssen fehlt eine Prämisse, die den Schluss stützen und damit gültig machen kann:

            #blockquote[
                #normalform[
                    Menschen können Fleisch essen.][
                    #emph[Was der Mensch kann, soll er tun. (neue Prämisse)]][
                    Menschen sollen Fleisch essen.]

                #normalform[
                    Dein Schreibtisch ist unordentlich.][
                    #emph[Wenn etwas unordentlich ist, sollte aufgeräumt werden. (neue Prämisse)]][
                    _Also:_ Du solltest aufräumen.
                ]
            ][]
        ],

        emph[Intensionaler\ Fehlschluss], [
            Der intensionale Fehlschluss ist nicht ganz leicht zu verstehen. Grundlegend beschäftigt er sich damit, dass man die Wahrheit bzw. Falschheit einer Aussage nicht indirekt aus der einer anderen ableiten kann. Z.B.:

            #blockquote[
                #normalform[
                    Ich weiß, dass die Sonne scheint.][
                    Wenn die Sonne scheint, dann ist es warm.][
                    Ich weiß, dass es warm ist.]

                Problem:

                1. Wie ist "wissen" hier zu verstehen? Kann man daraus, dass man etwas weiß, auf die Wahrheit dieses Wissens schließen? Skeptizisten würden das verneinen, sie sind der Meinung: Wir können gar nichts gesichert wissen. Das, was wir als "Wissen" bezeichnen, könnte nach einem radikalen Skeptizisten falsch sein. Von daher kann ich von "Ich weiß, dass die Sonne scheint." nicht darauf schließen, dass die Sonne tatsächlich scheint. Nur weil ich etwas weiß, heißt es nicht, dass es wahr ist, dafür fehlt eine Prämisse, die das festlegt. → ungültiger Schluss

                2. Aber angenommen, dass alles, was ich weiß, wahr ist: Wenn ich nicht rausgehe, weiß icht nicht, dass es warm ist. Nur weil "Es ist warm." wahr ist, kann ich damit noch lange nicht darauf schließen, dass auch "Ich weiß, dass es warm ist." wahr ist. Vielleicht ist die String-Theorie wahr, aber wissen werde ich es wahrscheinlich nie. → ungültiger Schluss
            ][]

            Das gilt nicht nur für "wissen, dass", sondern auch etwa "glauben, dass", "meinen, dass" oder auch "Es ist schön, dass". Es tritt ziemlich häufig bei dass-Sätzen auf, wenn also _über_ einen Satz gesprochen wird.

            Gültig machen, könnte man ihn durch eine weitere Prämisse:

            #blockquote[
                #normalform[
                Ich weiß, dass die Sonne scheint.][
                Wenn die Sonne scheint, dann ist es warm.][
                    #emph[Ich weiß etwas genau dann, wenn es wahr ist. (neue Prämisse)]
                ][
                Ich weiß, dass es warm ist.]
            ][]
        ],

        emph[Verletzung der\ Kontraposition\ (Verneinung des\ Antezedens)], [
            In einem Wenn-Dann-Satz wird aufgrund der Verneinung des Wenn-Teils auf eine Verneinung des Dann-Teils geschlossen. Z.B.:

            #blockquote[
                #normalform[
                    Wenn es regnet, wird die Straße nass.][
                    Wenn es nicht regnet, wird die Straße nicht nass.]

                Problem: Es ist nicht ausgeschlossen, dass z.B. ein Eimer Wasser die Straße nass machen kann.
            ][]

            #blockquote[
                #normalform[
                    Wenn ich Rasen pflanze, dann gibt es Rasen.][
                    Wenn ich keinen Rasen pflanze, dann gibt es keinen Rasen.]

                Problem: Das wäre einfach verrückt, oder? Vor mir haben ja schon andere Leute Rasen gepflanzt. Also ja, es ist sicher, dass, wenn ich Rasen pflanze, es dann auch Rasen gibt (ich habe ihn immerhin gepflanzt), aber nur allein von den Prämissen her ist es nicht ausgeschlossen, dass bereits vor mir schon jemand Rasen gepflanzt hat. → ungültiger Schluss
            ][]
        ],

        emph[Verletzung der\ Kontraposition\ (Bejahung des\ Konsequens)], [
            In einem Wenn-Dann-Satz wird aufgrund der Wahrheit des Dann-Teils auf die Warheit des Wenn-Teils geschlossen. Z.B.:

            #blockquote[
                #normalform[
                    Wenn es regnet, wird die Straße nass.][
                    Wenn die Straße nass ist, dann hat es geregnet.]

                Problem: Was ist mit dem Eimer Wasser? Dann wäre die Straße nass, ohne dass es geregnet hat. → ungültiger Schluss
            ][]

            #blockquote[
                #normalform[
                    Wenn ich Rasen pflanze, dann gibt es Rasen.][
                    Wenn es Rasen gibt, dann pflanze ich Rasen.]

                Problem: Ich bin aber faul, dagegen spricht nichts, und Rasen gibt es trotzdem. → ungültiger Schluss
            ][]
        ]))))]

        Der _Sein-Sollen-Fehlschluss_, die _Verneinung des Antezedens_ und die _Bejahung des Konsequens_ sind neben einem _Strohmann_-Argument oder einem _Argumentum ad hominam_ beliebte Fehlschlüsse, die häufig in freier Wildbahn gesichtet werden können. Jetzt können Sie sie erkennen!
])

#task(key: "nh-bed1")[Notwendige und hinreichende Bedingungen][
    Beschreiben Sie jeweils in eigenen Worten, wann zwischen zwei Aussagen $alpha$ und $beta$ folgendes gilt:
][
    + $alpha$ ist eine hinreichende Bedingung für $beta$.
    + $alpha$ ist eine notwendige Bedingung für $beta$.
    + $beta$ ist eine hinreichende Bedingung für $alpha$.
    + $beta$ ist eine notwendige Bedingung für $alpha$.
][
    Besteht zwischen zwei Aussagen $gamma$ und $delta$ ein Zusammenhang $gamma -> delta$, dann ist $gamma$ die hinreichende Bedingung für $delta$ und $delta$ ist die notwendige Bedingung für $gamma$.
][
    Unter anderem sind solche Lösungen möglich:

    + $alpha$ ist genau dann eine hinreichende Bedingung für $beta$, wenn $alpha$ das Vorderglied des Konditionals (das Antezedens) in $alpha -> beta$ ist.

    + $alpha$ ist genau dann eine hinreichende Bedingung für $beta$, wenn $alpha$ das Hinterglied des Konditionals (das Konsequenz) in $beta -> alpha$ ist.

    + $beta$ ist genau dann eine hinreichende Bedingung für $alpha$, wenn $beta$ das Vorderglied des Konditionals (das Antezedens) in $beta -> alpha$ ist.

    + $beta$ ist genau dann eine hinreichende Bedingung für $alpha$, wenn $beta$ das Hinterglied des Konditionals (das Konsequenz) in $alpha -> beta$ ist.

    oder

    + Wenn $alpha$ der Fall ist, dann auch $beta$.
    + Nur wenn $alpha$ der Fall ist, dann auch $beta$.
    + Wenn $beta$ der Fall ist, dann auch $alpha$.
    + Nur wenn $beta$ der Fall ist, dann auch $alpha$.

    oder

    + Nur wenn $beta$ der Fall ist, dann auch $alpha$.
    + Wenn $alpha$ nicht der Fall ist, dann auch nicht $beta$.
    + Nur wenn $alpha$ der Fall ist, dann auch $beta$.
    + Wenn $beta$ nicht der Fall ist, dann auch nicht $alpha$.

    oder

    ...

    Die Erklärung dafür: In "$alpha -> beta$" ist $alpha$ die hinreichende und $beta$ die notwendige Bedingung. Die hinreichende Bedingung ist also immer vorne, die hinreichende hinten. Es gibt aber eine Ausnahme:

    Wendet man nun das Gesetz der Kontraposition an, wird aus $alpha -> beta$ der Term $not beta -> not alpha$, beide sind logisch äquivalent. Da beide Sätze also gleichwertig sind, ist auch in $not beta -> not alpha$ das $alpha$ die hinreichende und $beta$ die notwendige Bedingung. Die Negation kann also die hinreichende und notwendige Bedingung vertauschen! Wenn man die Negation mit dazu nimmt, ist natürlich wieder das Vorderglied $not beta$ die hinreichende und das Hinterglied $not alpha$ die notwendige Bedingung.
]