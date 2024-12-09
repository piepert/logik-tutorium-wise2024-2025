#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *

#show: project.with(no: 2,
    date: datetime(year: 2023, month: 10, day: 30),
    show-solutions: true,
    show-hints: true)

#task([schlüssige Argumente], [
    Beschreiben Sie, was schlüssige und gültige Argumente unterscheidet.
], [], [
    Ein schlüssiges Argument ist ein gültiges Argument, bei dem alle Prämissen wahr sind.
])

#task[gültige Argumente][
    Beurteilen und begründen Sie, ob das folgende Argument gültig ist.
][
    Haarausfall ist vererblich, \
    Fisch ist leicht verderblich \
    und darum bin ich sterblich!
][
    Das Argument ist ungültig. Wenn ich das Gegenteil der Konklusion annehme, also: "Ich bin nicht sterblich.", steht dies weder im Widerspruch zu "Haarausfall ist vererblich." noch zu "Fisch ist leicht verderblich." Daher folgt die Konklusion nicht notwendigerweise aus den Prämissen und der Schluss ist nicht gültig.
]

#task[Aussagesätze identifizieren][
    Können Sie die Aussagesätze identifizieren?
][
    + Der Stift ist blau.
    + Wie viel Uhr ist es gerade?
    + Hasen sind Säugetiere.
    + Nachts ist es kälter als.
    + Ich habe mich letztens gefragt, ob ich mal wieder Kegeln gehen sollte.
    + Manchmal regnet es.
    + Sieben mal sieben macht feinen Sand.
    + Dann geh doch zu Netto!
    + Ich hatte heute einen schönen Tag.
    + Reden ist Schweigen und Silber ist Gold.
    + Hoffentlich scheint morgen die Sonne.
    + Peter hofft, dass morgen die Sonne scheint.
    + $1+1=3$
    + Wenn ich morgens erwache, dann stehe ich auf.
    + $x$ kann schwimmen.
    + Es ist nicht der Fall, dass der Stift blau ist.
    + Ich kam, sah und siegte.

][
    #let cross = box(inset: (bottom: -0.2em), move(dy: -0.2em, text(size: 1.5em, sym.times))) // box(text(size: 0.8em, sym.times.big))
    #sym.checkmark Aussagesatz, #box(move(dy: 0.075em, cross)) kein Aussagesatz

    #let c(body) = {
        set text(black.lighten(50%))
        emph(body)
    }

    // #set list(marker: sym.checkmark)
    // #set list(marker: cross)

    // #set list(spacing: 2em)

    #set enum(numbering: (n => {
        let s = sym.checkmark

        if n in (2, 4, 8, 11, 15) {
            s = cross
        }

        numbering("1. ", n) + s
    }))

    + Der Stift ist blau.
    + Wie viel Uhr ist es gerade? #c[Fragen sind keine Aussagesätze.]
    + Hasen sind Säugetiere.
    + Nachts ist es kälter als. #c[Der Satz ist nicht vollständig und kann daher weder wahr noch falsch sein, also ist er kein Aussagesatz.]
    + Ich habe mich letztens gefragt, ob ich mal wieder Kegeln gehen sollte. #c[Man könnte überprüfen, ob ich mich das tatsächlich gefragt habe, von daher ist der Satz entweder wahr oder falsch und somit ein Aussagesatz.]
    + Manchmal regnet es.
    + Sieben mal sieben macht feinen Sand.
    + Dann geh doch zu Netto! #c[Aufforderungen sind keine Aussagesätze.]
    + Ich hatte heute einen schönen Tag.
    + Reden ist Schweigen und Silber ist Gold.
    + Hoffentlich scheint morgen die Sonne. #c[Hoffnungssätze sind keine Aussagesätze.]
    + Peter hofft, dass morgen die Sonne scheint. #c[Entweder man hofft es, oder man hofft es nicht. Das kann wahr oder falsch sein.]
    + $1+1=3$ #c[Der Satz ist zwar falsch, aber auch falsche Sätze sind Aussagesätze.]
    + Wenn ich morgens erwache, dann stehe ich auf.
    + $x$ kann schwimmen. #c[Hier fehlt ein Subjekt, daher ist der Satz so lange nicht wahr oder falsch. Bis man etwas für $x$ einsetzt, ist es kein Aussagesatz.]
    + Es ist nicht der Fall, dass der Stift blau ist.
    + Ich kam, sah und siegte.

    // #set list(marker: sym.checkmark)
    // - Der Stift ist blau.
    // #set list(marker: cross)
    // - Wie viel Uhr ist es gerade? #c[Fragen sind keine Aussagen.]
    // #set list(marker: sym.checkmark)
    // - Hasen sind Säugetiere.
    // #set list(marker: cross)
    // - Nachts ist es kälter als. #c[Der Satz ist nicht vollständig und kann daher weder wahr noch falsch sein, also ist er keine Aussage.]
    // #set list(marker: sym.checkmark)
    // - Ich habe mich letztens gefragt, ob ich mal wieder Kegeln gehen sollte. #c[Man könnte überprüfen, ob ich mich das tatsächlich gefragt habe, von daher ist der Satz entweder wahr oder falsch und somit eine Aussage.]
    // - Manchmal regnet es.
    // - Sieben mal sieben macht feinen Sand.
    // #set list(marker: cross)
    // - Dann geh doch zu Netto! #c[Aufforderungen sind keine Aussagen.]
    // #set list(marker: sym.checkmark)
    // - Ich hatte heute einen schönen Tag.
    // - Reden ist Schweigen und Silber ist Gold.
    // #set list(marker: cross)
    // - Hoffentlich scheint morgen die Sonne. #c[Wünsche sind keine Aussagen.]
    // #set list(marker: sym.checkmark)
    // - $1+1=3$ #c[Der Satz ist falsch, aber auch falsche Sätze sind Ausagen.]
    // - Wenn ich morgens erwache, dann stehe ich auf.
    // #set list(marker: cross)
    // - $x$ kann schwimmen. #c[Hier fehlt ein Subjekt, daher ist der Satz so lange nicht wahr oder falsch, bis man etwas für "$x$" einsetzt, bis dahin ist es keine Aussage.]
    // #set list(marker: sym.checkmark)
    // - Es ist nicht der Fall, dass der Stift blau ist.
    // - Ich kahm, sah und siegte.
]


#task([Normalform von Argumenten], [
    Bilden Sie für die folgenden Argumente die Normalform!

], [
    #subtask[
        John S. Mill behauptet, es gäbe ein Prinzip, das die Natur des Menschen bestimmt: das Prinzip des größten Glücks. Mills Argument dabei ist etwa Folgendes:

        Der Mensch sucht ständig nach dem größten Glück und versucht Leid zu meiden. Eine Handlung kann nur entweder das Glück von Betroffenen dieser Handlung erhöhen oder verringern. Dementsprechend sollten wir nur Handlungen ausführen, die das Glück der Betroffenen so weit wie möglich erhöhen oder es zumindest nicht verringern.
    ]

    #subtask[
        Sokrates endet tragisch: Er wird vor Gericht angeklagt und beschuldigt, die Jugend zu verderben. Dabei unterstellt man ihm, daimonische Lehren zu verbreiten und die Götter zu verachten. Sokrates hatte jedoch ein Gegenargument, das in etwa so ging:

        Sokrates verdirbt die Jugend nicht dadurch, dass er ihnen Daimonisches lehrt, denn Daimonen sind Kinder von Göttern. Wenn Sokrates aber nicht an die Götter glaubt, dann auch nicht an die Kinder von Göttern. Und wer an etwas nicht glaubt, kann dasjenige auch nicht lehren. Sokrates glaubt nicht an die Götter.
    ]

], [
    #subtask(inference-wl[
        Der Mensch sucht ständig nach dem größten Glück und versucht Leid zu meiden.][
        Eine Handlung kann nur entweder das Glück von Betroffenen dieser Handlung erhöhen oder verringern. ][
        Wir sollten nur Handlungen ausführen, die das Glück der Betroffenen so weit wie möglich erhöhen oder es zumindest nicht verringern.])

    #subtask(inference-wl[
        Der Mensch sucht ständig nach dem größten Glück und versucht Leid zu meiden.][
        Wenn Sokrates aber nicht an die Götter glaubt, dann auch nicht an die Kinder von Göttern.][
        Sokrates verdirbt die Jugend nicht dadurch, dass er ihnen daimonisches lehrt])
])

#task(extra: true, [#smallcaps[Def.] Fehlschluss], [
    Definieren Sie in eigenen Worten, was ein Fehlschluss ist. Nennen und erklären Sie eine Fehlschluss-Art! Geben Sie ein Beispiel für ein ungültiges Argument, das unter diesen Fehlschluss fällt.

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

                2. Aber angenommen, dass alles, was ich weiß, wahr ist: Wenn ich nicht rausgehe, weiß ich nicht, dass es warm ist. Nur weil "Es ist warm." wahr ist, kann ich damit noch lange nicht darauf schließen, dass auch "Ich weiß, dass es warm ist." wahr ist. Vielleicht ist die String-Theorie wahr, aber wissen werde ich es wahrscheinlich nie. → ungültiger Schluss
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
            In einem Wenn-Dann-Satz wird aufgrund der Wahrheit des Dann-Teils auf die Wahrheit des Wenn-Teils geschlossen. Z.B.:

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