#import "/src/templates/exercise.typ": *

#let syntax-regeln = task[Syntax der Aussagenlogik][
    Nennen Sie alle syntaktischen Regeln zur Bildung von Formeln bzw. Sätzen der Sprache AL!
][][
     Siehe im Skript S. 29 / 53: Es gibt...
     + erlaubte Zeichen und
     + Regeln zum Aufbau von AL-Sätzen.
][
    Siehe im Skript S. 29 / 53:

    + Erlaubte Zeichen sind:
        #set enum(numbering: "a)")
        + Satzbuchstaben: $p$, $p_1$, $p_2$, $q$, $r$, ...,
        + Junktoren: $not$, $and$, $or$, $->$ und $<->$,
        + Klammern: $($ und $)$,

    + Wenn $alpha$ ein Satzbuchstabe ist, dann ist $alpha$ ein Satz von AL.

    + Wenn $alpha$ und $beta$ AL-Sätze sind, dann auch:
        #set enum(numbering: "a)")
        + $not alpha$
        + $(alpha and beta)$
        + $(alpha or beta)$
        + $(alpha -> beta)$
        + $(alpha <-> beta)$

    Jede Syntax besteht aus erlaubten Zeichen (1.) und Regeln, wie diese Zeichen kombiniert werden dürfen (2. und 3.). Dies gilt nicht nur für die Aussagenlogik, sondern für alle Sprachen: für Deutsch etwa wären die erlaubtern Zeichen das lateinische Alphabet mit Umlauten und Sonderzeichen, die Regeln, wonach diese Zeichen kombiniert werden dürfen, findet man in der Linguistik dann in der "Morphologie" und "Grammatik". Für natürliche Sprachen sind diese Regeln extrem kompliziert, für die Aussagenlogik sind es nur ganz wenige.
]

#let syntax-erkennen1 = task[Syntax der Aussagenlogik][
    Welcher der folgenden Zeichenketten sind Sätze der Sprache AL?
][
    + $p$
    + $(not p_1 and p_2)$
    + $not p and q not$ // x
    + $(p_2 -> q)$
    + $((p and q) <-> r)$
    + $(s_2 <-> not p_36)$
    + $(r -> q -> s)$ // x
    + $(p -> (q -> (r -> s)))$
    + $(p)$ // x, strikt
    + $p and q$ // x, strikt
][
    Siehe im Skript S. 29 f. / 52 ff. für eine Liste gültiger Regeln für den Syntax der Aussagenlogik.
][
    Hier ist die vollständige Liste der Syntaxregeln von AL aus dem Skript S. 29 f. / 52 ff.:

    + Wenn $alpha$ ein Satzbuchstabe ist, dann ist $alpha$ ein Satz von AL.

    + Wenn $alpha$ und $beta$ AL-Sätze sind, dann sind auch die folgenden Sätze jeweils Sätze von AL:

        #set enum(numbering: "a)")
        + $not alpha$
        + $(alpha and beta)$
        + $(alpha or beta)$
        + $(alpha -> beta)$
        + $(alpha <-> beta)$

    + Äußerste Klammern dürfen weggelassen werden.

    Eine Zeichenkette ist nun ein Satz von AL, gdw. sie durch die oben genannten Regeln vollständig aufgeschlüsselt werden kann:

    #let cross = box(inset: (bottom: -0.2em), move(dy: -0.2em, text(size: 1.5em, sym.times)))
    #sym.checkmark Satz von AL, #box(move(dy: 0.075em, cross)) kein Satz von AL

    #let c(body) = {
        set text(black.lighten(50%))
        emph(body)
    }

    // #set list(marker: sym.checkmark)
    // #set list(marker: cross)

    // #set list(spacing: 2em)

    #set enum(numbering: (n => {
        let s = sym.checkmark

        if n in (3, 7, 9) {
            s = cross
        }

        numbering("1. ", n) + s
    }))

    #let c(body) = h(0.25em) + comment(body)

    + $p$ #c[Regel 1.]
    + $(not p_1 and p_2)$ #c["$not p_1$" ist Regel 2. a), "$(not p_1 and p_2)$" ist Regel 2. b)]
    + $not p and q not$ #c[Die Negation am Ende entspricht keiner Regel.]
    + $(p_2 -> q)$ #c[Regel 2. d)]
    + $((p and q) <-> r)$ #c["$(p and q)$" ist Regel 2. b), "$((p and q) <-> r)$" ist Regel 2. e)]
    + $(s_2 <-> not p_36)$ #c["$not p_36$" ist Regel 2. a), "$(s_2 <-> not p_36)$" ist Regel 2. e)]
    + $(r -> q -> s)$ #c[Es gibt keine Regel, die zwei Konditionale hintereinander erlaubt. Der Ausdruck wäre richtig, wenn man Klammern um eines der beiden Konditionale setzen würde. Also $((r -> q) -> s)$ oder $(r -> (q -> s))$.]
    + $(p -> (q -> (r -> s)))$ #c[Die Regel 2. d) kann auf den Gesamtausdruck und jedes Konsequenz angewandt werden.]
    + $(p)$ #c[Wenn man streng ist: Es gibt keine Regel, die Klammern um einen einzelnen Satzbuchstaben erlaubt.]
    + $p and q$ #c[Die Klammerersparnisregel wird auf S. 30 / 54 erklärt.]

    Den Lösungsvorschlag für 9. kann mit der richtigen Begründung (z.B. indem man den Junktoren eine Ordnung zuweist, wie in der Mathematik mit "Punkt vor Strich" oder "KlaPoPuS") auch als korrekt angenommen werden.
]

#let syntax-junktorenordnung1 = task[Syntax der Aussagenlogik][
    Listen Sie die aussagenlogischen Junktoren ihrer Ordnung nach auf!
][][
    Siehe im Skript S. 30 / 54.
][
    // + $not$
    // + $and$
    // + $or$
    // + $->$
    // + $<->$

    + $not$
    + $and$, $or$
    + $->$, $<->$

    Weiteres regeln Klammern.
]

#let syntax-junktorenordnung2 = task[Syntax der Aussagenlogik][
    Setzen Sie die Klammern so, dass die Ordnung der Operatoren erhalten bleibt!
][
    + $not p and q$
    + $p and q or q and r$
    + $p -> q <-> not q -> not p$
    + $not p or q and not r$
    + $p <-> r and q or p$
][
    Siehe im Skript S. 30 / 54.
][
    // Die Reihenfolge ist $not$, $and$, $or$, $->$, $<->$:

    // + $(not p and q)$
    // + $((p and q) or (q and r))$
    // + $((p -> q) <-> (not q -> not p))$
    // + $(not p or (q and not r))$
    // + $(p <-> ((r and q) or p))$

    Die Reihenfolge ist $not$, $and$ und $or$, $->$ und $<->$:

    + $(not p and q)$
    + $(((p and q) or q) and r)$
    + $(((p -> q) <-> not q) -> not p)$
    + $((not p or q) and not r)$
    + $(p <-> ((r and q) or p))$
]