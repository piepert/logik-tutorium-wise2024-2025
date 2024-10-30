#import "/src/templates/exercise.typ": *
#import "/src/packages/inference.typ": *

#show: project.with(no: [--- AL-Grundlagen],
    date: datetime(year: 2023, month: 10, day: 23),
    show-solutions: true,
    show-hints: true)

#task[#ref-goal("definieren-grundkonzepte"): Aussagesätze identifizieren][
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
    #sym.checkmark Aussagen, #box(move(dy: 0.075em, cross)) keine Aussagen

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
    + Wie viel Uhr ist es gerade? #c[Fragen sind keine Aussagen.]
    + Hasen sind Säugetiere.
    + Nachts ist es kälter als. #c[Der Satz ist nicht vollständig und kann daher weder wahr noch falsch sein, also ist er keine Aussage.]
    + Ich habe mich letztens gefragt, ob ich mal wieder Kegeln gehen sollte. #c[Man könnte überprüfen, ob ich mich das tatsächlich gefragt habe, von daher ist der Satz entweder wahr oder falsch und somit eine Aussage.]
    + Manchmal regnet es.
    + Sieben mal sieben macht feinen Sand.
    + Dann geh doch zu Netto! #c[Aufforderungen sind keine Aussagen.]
    + Ich hatte heute einen schönen Tag.
    + Reden ist Schweigen und Silber ist Gold.
    + Hoffentlich scheint morgen die Sonne. #c[Hoffnungssätze sind keine Aussagen.]
    + Peter hofft, dass morgen die Sonne scheint. #c[Entweder man hofft es, oider man hofft es nicht. Das kann wahr oder falsch sein.]
    + $1+1=3$ #c[Der Satz ist falsch, aber auch falsche Sätze sind Ausagen.]
    + Wenn ich morgens erwache, dann stehe ich auf.
    + $x$ kann schwimmen. #c[Hier fehlt ein Subjekt, daher ist der Satz so lange nicht wahr oder falsch, bis man etwas für "$x$" einsetzt, bis dahin ist es keine Aussage.]
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

#task([Notwendige und hinreichende Bedingungen I], [
    Welche Auswirkgung hat das Wort "nur" auf die Formalisierung des folgenden Satzes? Formalisieren Sie den Satz und beschreiben Sie kurz, warum Sie sich so entschieden haben und was sie anders getan hätten, wenn das "nur" nicht im Satz vorkäme.

], [
    Nur wenn meine Zähne in der Münze eine Spur hinterlassen, ist sie aus Gold.

], [
    $p$: Meine Zähne hinterlassen eine Spur auf der Münze. \
    $q$: Die Münze ist aus Gold.

    Die Formalisierung ist $not p -> not q$ oder $q -> p$, etc. Das "nur" wirkt sich wie eine Negation in beiden Teilsätzen aus, aus dem Satz wird dann: "Wenn meine Zähne in der Münze keine Spur hinterlassen, dann ist sie nicht aus Gold," was die erste Formalisierungsmöglichkeit erklärt. Ohne das "nur" wäre die hinreichende und notwendige Bedingung (das Vorder- und Hinterglied des Konditionals) vertauscht, also: $p -> q$.

])

#task[Notwendige und hinreichende Bedingungen II][
    Finden Sie jeweils einen AL-Satz, für den gilt:
][
    + $p$ ist eine hinreichende Bedingung für $q$.
    + $p$ ist eine notwendige Bedingung für $q$.
    + $q$ ist eine hinreichende Bedingung für $p$.
    + $q$ ist eine notwendige Bedingung für $p$.
][
    + $p -> q$
    + $not p -> not q$
    + $q -> p$
    + $not q -> not p$
]

#task(extra: true)[Was sind Aussagen?][
    Finden Sie den Unterschied zwischen dem folgenden Satz und einer Aussage? Was ist überhaupt der Unterschied zwischen einem Aussagesatz und einer Aussage?
][
    Die Sonne scheint.
][
    Ein Satz ist eine Aneinanderreihung an Wörtern, die jeweils aus Buchstaben bestehen. Eine Aussage ist derjenige Sachverhalt, der von dem Satz dargestellt wird. Eine Aussage ist wahr, wenn dieser Sachverhalt wirklich der Fall ist, sonst ist sie falsch. Ein Aussagesatz kann also aus zwei Perspektiven beleuchtet werden: einmal aus der Sicht des Sachverhalts, den er darstellt (die Aussage), und einmal aus Sicht des Wahrheitswertes (also ob die Aussage wirklich der Fall ist). Das Erstere wird die _Intension_ des Satzes genannt, das Zweite seine _Extension_.
]