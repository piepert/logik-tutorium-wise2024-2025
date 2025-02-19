#import "@preview/cetz:0.3.0"

#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#let otask = task
#let task(title, task, body, hint, solution) = otask(title, task, body, solution)

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 4,
    date: datetime(year: 2024, month: 11, day: 13),
    show-solutions: true,
    show-hints: true)

#task[Syntax der Aussagenlogik I][
    Nennen Sie alle syntaktischen Regeln zur Bildung von Formeln bzw. Sätzen der Sprache AL!
][][
     Siehe im Skript S. 29 / 53: Es gibt...
     + erlaubte Zeichen und
     + Regeln zum Aufbau von AL-Sätzen.
][
    Laut Vorlesung:

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

#task[Syntax der Aussagenlogik II][
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

    #let c(body) = h(0.25em) + emph(text(fill: black.lighten(50%), body))

    + $p$ #c[Regel 1.]
    + $(not p_1 and p_2)$ #c["$not p_1$" ist Regel 2. a), "$(not p_1 and p_2)$" ist Regel 2. b)]
    + $not p and q not$ #c[Die Negation am Ende entspricht keiner Regel.]
    + $(p_2 -> q)$ #c[Regel 2. d)]
    + $((p and q) <-> r)$ #c["$(p and q)$" ist Regel 2. b), "$((p and q) <-> r)$" ist Regel 2. e)]
    + $(s_2 <-> not p_36)$ #c["$not p_36$" ist Regel 2. a), "$(s_2 <-> not p_36)$" ist Regel 2. e)]
    + $(r -> q -> s)$ #c[Es gibt keine Regel, die zwei Konditionale hintereinander erlaubt. Der Ausdruck wäre richtig, wenn man Klammern um eines der beiden Konditionale setzen würde. Also $((r -> q) -> s)$ oder $(r -> (q -> s))$.]
    + $(p -> (q -> (r -> s)))$ #c[Die Regel 2. d) kann auf den Gesamtausdruck und jedes Konsequenz angewandt werden.]
    + $(p)$ #c[Wenn man streng ist: Es gibt keine Regel, die Klammern um einen einzelnen Satzbuchstaben erlaubt.]
    + $p and q$ #c[Die Klammerersparnisregel erlaubt dies.]
]

#task[Syntax der Aussagenlogik III][
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

#task[Syntax der Aussagenlogik IV][
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

    Die Reihenfolge ist (1.) $not$, (2.) $and$ und $or$, (3.) $->$ und $<->$:

    + $(not p and q)$
    + $(((p and q) or q) and r)$
    + $(((p -> q) <-> not q) -> not p)$
    + $((not p or q) and not r)$
    + $(p <-> ((r and q) or p))$
]

#task([Wahrheitstabellen I], [
    Unterstreichen Sie in den folgenden Ausdrücken den Hauptjunktor.
], [
    + $p and q$
    + $not p and not q$
    + $p -> q$
    + $p <-> not q$
    + $p or not (p and r)$
    + $(p and q) and (not r or not q)$
    + $(p or q) -> (r <-> (q and not p))$

], none, [
    + $p underline(and) q$
    + $not p underline(and) not q$
    + $p underline(->) q$
    + $p underline(<->) not q$
    + $p underline(or) not (p and r)$
    + $(p and q) underline(and) (not r or not q)$
    + $(p or q) underline(->) (r <-> (q and not p))$
])

#task[Semantik der Aussagenlogik][
    Interpretieren Sie die folgenden Formeln. Welche Wahrheitswerte haben sie? Sei $p$ falsch, seien $q$ und $r$ wahr.
][
    + $p or q$
    + $q -> p$
    + $r -> p$
    + $r -> not p$
    + $(not r or q) and not p$
    + $(p and q) <-> (p or q)$
    + $(p <-> q) <-> (not p <-> not q)$
    + $(not p -> q) -> not (q -> r)$
    + $(p and q) or (p and not q)$
    + $(p or q) -> (not p <-> (not p and r))$

][
    Werten Sie die Teilausdrücke mit Hilfe der Wahrheitstabellen im Skript auf S. 111 f. / 249 f. von innen nach außen aus.

    Zum Beispiel ist der Ausdruck "$p and q$" laut der Wahrheitstabelle der Konjunktion falsch, denn in der Wahrheitstabelle ist dort, wo $p$ falsch und $q$ wahr ist, die Konjunktion falsch.

    Bei einem komplizierteten Ausdruck wie $(p and q) -> r$ werten Sie zuerst die innen stehenden (hier wieder $p and q$) aus, was falsch wird, und dann den äußeren Ausdruck: $underbrace((p and q), upright(f)) -> underbrace(r, upright(w))$. In der Zeile des Konditionals, in der das Vorderglied falsch und das Hinterglied wahr ist, ist der Gesamtausdruck wahr. Daher ist $(p and q) -> r$ wahr.
][
    #let vars = ("p": false, "q": true, "r": true)
    + #al-run(vars, "p | q", t: "wahr", f: "falsch")
    + #al-run(vars, "q > p", t: "wahr", f: "falsch")
    + #al-run(vars, "r > q", t: "wahr", f: "falsch")
    + #al-run(vars, "r > - p", t: "wahr", f: "falsch")
    + #al-run(vars, "(-r | -p) & -p", t: "wahr", f: "falsch")
    + #al-run(vars, "(p & q) = (p | q)", t: "wahr", f: "falsch")
    + #al-run(vars, "(p = q) = (-p = -q)", t: "wahr", f: "falsch")
    + #al-run(vars, "(- p > q) > - (q > r)", t: "wahr", f: "falsch")
    + #al-run(vars, "(p & q) | (p & - q)", t: "wahr", f: "falsch")
    + #al-run(vars, "(p | q) > (- p = (- p & r))", t: "wahr", f: "falsch")
]

#task([Wahrheitstabellen II], [
    Zeichnen Sie eine Wahrheitstabelle für die folgenden Ausdrücke.

], [
    + $p and q$
    + $p or q$
    + $not p and not q$
    + $p -> q$
    + $r -> r$
    + $p <-> q$
    + $p <-> not q$
    + $p or not p$
    + $(p and q) and (not r or not q)$
    + $(p or q) -> (r <-> (q and not s))$

], none, [
    + #truth-table("p & q")
    + #truth-table("p | q")
    + #truth-table("- p & - q")
    + #truth-table("p > q")
    + #truth-table("r > r")
    + #truth-table("p = q")
    + #truth-table("p = - p")
    + #truth-table("p | - p")
    + #truth-table("(p & q) & (- r | - q)")
    + #truth-table("(p | q) > (r = (q & - s))")
])

/*

#task[Logische Wahrheit I][
    Erklären Sie an einem Beispiel, wann ein AL-Satz als "logisch wahr" bzw. "allgemeingültig" bezeichnet wird.
][][
    Siehe im Skript S. 34 / 89.
][
    Ein Satz ist logisch wahr, gdw. er unter allen Bewertungen wahr ist. Zum Beispiel gibt es für den Satz "$p or not p$" keine mögliche Belegung für $p$, sodass er falsch werden könnte. Somit ist der Satz logisch wahr.
]

#task[Logische Wahrheit II][
    Zeigen Sie, ob die folgenden Sätze logisch wahr sind.

][
    + $p or not p$
    + $q and not q$
    + $p -> p$
    + $(not p and q) <-> (p and not q)$
    + $(p or q) or (not p and not q)$
    + $(p -> q) <-> (not q -> not p)$
    + $(p and q) or (p and not q) or (not p and q) or (not p and not q)$

][
    Eine Wahrheitstabelle gibt alle möglichen Bewertungen für einen Ausdruck an. In einer Wahrheitstabelle kann daher gesehen werden, ob ein Ausdruck logisch wahr ist genau dann, wenn alle seine Zeilen wahr sind, denn dann ist er auch unter allen Bewertungen wahr.

    Für 1. gilt zum Beispiel:
    #truth-table("p | -p")

    Alle Zeilen von $p or not p$ sind wahr, daher ist der Ausdruck logisch wahr.

][
    + #truth-table("p | - p") Der Ausdruck ist logisch wahr.

    + #truth-table("q & - q") Der Ausdruck ist nicht logisch wahr, sondern logisch falsch.

    + #truth-table("p > p") Der Ausdruck ist logisch wahr.

    + #truth-table("(- p & q) = (p & - q)") Der Ausdruck ist nicht logisch wahr, sondern kontingent.

    + #truth-table("(p | q) | (- p & - q)") Der Ausdruck ist logisch wahr.

    + #truth-table("(p > q) = (- q > - p)") Der Ausdruck ist logisch wahr.

    + #truth-table("(p & q) | (p & - q) | (- p & q) | (- p & - q)") Der Ausdruck ist logisch wahr.
]

#task[Logische Folgerung I][
    Definieren Sie logische Folgerung in eigenen Worten.
][][
    Siehe im Skript S. 34 / 89.
][
    Ein Ausdruck $alpha$ folgt logisch aus einem Ausdruck $beta$ genau dann, wenn $alpha$ unter allen Bewertungen wahr ist, wo auch $beta$ wahr ist.

    _... oder ..._

    Ein Ausdruck $alpha$ folgt logisch aus einem Ausdruck $beta$ genau dann, wenn $limits(inline: #false, tack.r.double)_"AL" alpha -> beta$.
]

#task[Logische Folgerung II][
    Peter versucht neue Schlussregeln für den Kalkül des natürlichen Schließens zu finden, damit er einfacher an Lösungen kommt. Entscheiden Sie für jede Regel, ob es sich tatsächlich um logische Folgerung handelt. Beweisen Sie Ihre Antwort.
][

    #align(center, grid(columns: 3,
        column-gutter: 2em,
        row-gutter: 0.65em,

        ```inference
            $not (alpha and beta)$
            $alpha$
            ----
            $not beta$
            ```,

        ```inference
            $alpha or beta$
            $not alpha$
            ----
            $beta$
            ```,

        ```inference
            $alpha -> beta$
            ----
            $beta -> alpha$
            ```,

        [1. Modus ponendo tollens],
        [2. Modus tollendo ponens],
        [3. $->$-Tausch #v(1em)],

        ```inference
            $alpha or beta$
            ----
            $alpha and beta$
            ```,

        ```inference
            $not (alpha and beta)$
            $not alpha$
            ----
            $not beta$
            ```,

        ```inference
            $alpha -> (beta -> gamma)$
            ----
            $(alpha and beta) -> gamma$
            ```,

        [4. Disjunktives Konjunkt],
        [5. Modus abra kadabra],
        [6. Zauberregel]))
][
    Jede Schlussregel ist eine logische Folgerung, also kann Sie mit Hilfe der Wahrheitstafelmethode bewiesen werden: Überall dort, wo die Prämissen wahr sind, darf die Konklusion nicht falsch sein, nur dann handelt es sich um logische Folgerung. Dort, wo die Prämissen falsch sind, ist es egal, wie die Konklusion aussieht. Nur der Fall, in dem die Prämissen wahr sind, zählt.
][
    Für logische Folgerung gilt: Überall dort, wo die Prämissen wahr sind, darf die Konklusion nicht falsch sein, nur dann handelt es sich um logische Folgerung.

    Grün markiert sind Zeilen, in denen die Prämissen sowie die Konklusion wahr sind. Blau markiert sind Zeilen, in denen die Prämissen wahr sind, aber die Konklusion falsch. Gibt es mindestens eine blaue Zeile, liegt *keine* logische Folgerung vor, denn nicht überall dort, wo die Prämissen wahr sind, ist dann auch die Konklusion wahr.

    1. #cetz.canvas({
        import cetz.draw: *

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: green.lighten(60%)),
        )

        rect((-1.1, -0.1), (2.5, -0.75))

        content((0, 0), [Modus ponendo tollens] + truth-table("- (alpha & beta)", "alpha", "- beta"))
    }) Da es nur grüne Zeilen gibt, ist überall dort, wo die Prämissen wahr sind, auch die Konklusion wahr. Also handelt es sich um logische Folgerung, die Regel ist korrekt.

    2. #cetz.canvas({
        import cetz.draw: *

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: green.lighten(60%)),
        )

        rect((-0.77, -0.7), (2.2, -1.35))

        content((0, 0), [Modus tollendo ponens] + truth-table("alpha | beta", "- alpha", "beta"))
    }) Da es nur grüne Zeilen gibt, ist überall dort, wo die Prämissen wahr sind, auch die Konklusion wahr. Also handelt es sich um logische Folgerung, die Regel ist korrekt.

    3. #cetz.canvas({
        import cetz.draw: *

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: green.lighten(60%)),
        )

        rect((-0.89, 0.55), (2.2, -0.1))
        rect((-0.89, -0.7), (2.2, -1.98))

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: blue.lighten(60%)),
        )

        rect((-0.89, -0.7), (2.2, -1.35))

        content((0, 0), [$->$-Tausch] + truth-table("alpha > beta", "beta > alpha"))
    }) Da es mindestens eine blaue Zeile gibt, gibt es Fälle (Z. 3), wo dort, wo die Prämissen wahr, die Konklusion falsch sind. Also handelt es sich nicht um logische Folgerung, die Regel ist nicht korrekt.

    4. #cetz.canvas({
        import cetz.draw: *

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: green.lighten(60%)),
        )

        rect((-0.7, 0.55), (2, -0.1))

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: blue.lighten(60%)),
        )

        rect((-0.70, -0.05), (2, -1.38))

        content((0, 0), [Disjunktives Konjunkt] + truth-table("alpha | beta", "alpha & beta"))
    }) Da es mindestens eine blaue Zeile gibt, gibt es Fälle (Z. 2-4), wo dort, wo die Prämissen wahr, die Konklusion falsch sind. Also handelt es sich nicht um logische Folgerung, die Regel ist nicht korrekt.

    5. Modus abra kadabra #table(columns: (auto,)*5,
            align: center + horizon,
            stroke: 0.5pt,

            $alpha$, table.vline(),
            $beta$, table.vline(stroke: 1.5pt),
            $not alpha and beta$, table.vline(),
            $not alpha$, table.vline(),
            $not beta$, table.hline(),

            [w], [w], [f], [f], [f],
            [w], [f], [w], [f], [w],
            [f], [w], table.cell(fill: blue.lighten(60%))[w], table.cell(fill: blue.lighten(60%))[w], table.cell(fill: blue.lighten(60%))[f],
            [f], [f], table.cell(fill: green.lighten(60%))[w], table.cell(fill: green.lighten(60%))[w], table.cell(fill: green.lighten(60%))[w]) // Modus abra kadabra #truth-table("- (alpha & beta)", "- alpha", "- beta")
        Da es mindestens eine blaue Zeile gibt, gibt es Fälle (Z. 3), wo dort, wo die Prämissen wahr, die Konklusion falsch sind. Also handelt es sich nicht um logische Folgerung, die Regel ist nicht korrekt.

    6. #cetz.canvas({
        import cetz.draw: *

        set-style(
            stroke: (thickness: 0pt),
            rect: (fill: green.lighten(60%)),
        )

        rect((-1.65, 1.8), (3.66, 1.2))
        rect((-1.65, 0.6), (3.66, -3.24))

        content((0, 0), [Zauberregel] + truth-table("alpha > (beta > gamma)", "(alpha & beta) > gamma"))
    }) Da es nur grüne Zeilen gibt, ist überall dort, wo die Prämissen wahr sind, auch die Konklusion wahr. Also handelt es sich um logische Folgerung, die Regel ist korrekt. // Zauberregel #truth-table("alpha > (beta > gamma)", "(alpha & beta) > gamma")
]

#task[Logische Äquivalenz I][
    Welche der folgenden Formalisierungsmöglichkeiten ist/sind logisch äquivalent zu der folgenden Aussage? Beweisen Sie ihre Antwort(en)!
][
    Es ist nicht der Fall, dass es nicht regnet und nicht schneit.

    $p$: Es regnet. \
    $q$: Es schneit. \

    + $not q -> not p$
    + $not p or not q$
    + $not (not p and not q)$
    + $p and q$
    + $not p -> q$
    + $p or q$
    + $not (p and q)$
][
    Äquivalenz bedeutet, dass beide Ausdrücke immer denselben Wahrheitswert haben, egal welchen Wahrheitswert die Satzbuchstaben haben. Als Beweisemethode kann eine Wahrheitstafel dienen. // Es lohnt sich ein Blick auf die letzte(n) Seite(n) des Skripts.

][
    #let cross = box(inset: (bottom: -0.2em), move(dy: -0.2em, text(size: 1.5em, sym.times)))
    #sym.checkmark logisch äquivalent, #box(move(dy: 0.075em, cross)) nicht logisch äquivalent

    #let c(body) = {
        set text(black.lighten(50%))
        emph(body)
    }

    // #set list(marker: sym.checkmark)
    // #set list(marker: cross)

    // #set list(spacing: 2em)

    #set enum(numbering: (n => {
        let s = cross

        if n in (3, 5, 6) {
            s = sym.checkmark
        }

        numbering("1. ", n) + s
    }))

    + $not q -> not p$
    + $not p or not q$
    + $not (not p and not q)$
    + $p and q$
    + $not p -> q$
    + $p or q$
    + $not (p and q)$

    Der Satz wird übersetzt als "$not (not p and not q)$" und ist nach _De Morgans_ Regel äquivalent zu dem Satz "$p or q$" (Siehe im Skript S. 112 / 251). Außerdem ist sie äquivalent zu sich selbst, also "$not (not p and not q)$". Etwas kniffliger zu finden ist "$not p -> q$", aber die Wahrheitstafel zeigt auf, dass beide Sätze gleich sind:

    #truth-table("-(- p & - q)", "p | q", "- p > q")
]

#task[Logische Äquivalenz II][
    Erklären Sie den Unterschied zwischen Äquivalenz und logischer Äquivalenz anhand der beiden Beispiele (a) und (b). Es gelte, dass $p$ wahr und $q$ falsch ist.

][
    #align(center, grid(columns: 5,
        column-gutter: 0.5em,
        row-gutter: 0.65em,

        [(a)], align(left)[
            1. $p or q$
            2. $not (not p and not q)$
        ],
        h(1em),
        [(b)], align(left)[
            1. $p and q$
            2. $p -> q$
        ]))

][
    "Äquivalenz" bedeutet so viel wie, dass zwei Dinge "gleichwertig" sind. In diesem Beispiel sind z.B. $p$ und $q$ nicht äquivalent, weil $p$ wahr und $q$ falsch ist, womit sie nicht den gleichen Wahrheitswert haben. Aber sie können unter einer anderen Belegung äquivalent sein: genau dann nämlich, wenn beide zusammen wahr oder zusammen falsch sind.
][
    "Äquivalenz" bezeichnet die Gleichwertigkeit zweier Ausdrücke unter der aktuellen Interpretation. "Logische Äquivalenz" bezeichnet die Gleichwertigkeit unter allen Interpretationen. Die Wahrheitstabelle zeigt:

    #align(center, grid(columns: 5,
        column-gutter: 0.5em,
        [(a)], truth-table("p | q", "- (-p & -q)"),
        h(1em),
        [(b)], truth-table("p & q", "p > q")))

    In (a) haben in allen Zeilen die Ausdrücke denselben Wahrheitswert, daher gilt es unter allen Bewertungen und es handelt sich um logische Äquivalenz. In (b) ist die aktuelle Interpretation (Z. 2, dort ist $p$ wahr und $q$ falsch) zwar gleich, aber alle Zeilen haben denselben Wahrheitswert, daher gilt Äquivalenz, aber keine logische Äquivalenz.

    _... oder ..._

    Zwei Ausdrücke $alpha$ und $beta$ sind äquivalent, wenn der Ausdruck $alpha <-> beta$ wahr ist. Zwei Ausdrücke $alpha$ und $beta$ sind logisch äquivalent, wenn der Ausdruck $alpha <-> beta$ logisch wahr ist. Die Wahrheitstabelle zeigt diesen Zusammenhang:

    #align(center, grid(columns: 5,
        column-gutter: 0.5em,
        [(a)], truth-table("(p | q) = (- (-p & -q))"),
        h(1em),
        [(b)], truth-table("(p & q) = (p > q)")))

    Wenn $alpha$ für "$p or q$" und $beta$ für "$not (not p and not q)$" steht, dann gilt für (a) logische Äquivalenz, da der Ausdruck "$alpha <-> beta$" allgemeingültig ist (alle Zeilen sind wahr, also ist er unter allen Bewertungen wahr). Für (b) gilt dann, dass, wenn $p$ wahr und $q$ falsch ist (Z. 2), der Ausdruck "$alpha <-> beta$" wahr ist, aber nicht unter allen Bewertungen wahr (Z. 3 und 4).
]

#task[Logische Äquivalenz III][
    Schaffen Sie es, logische Äquivalenz auf logische Folgerung zurückzuführen?
][][
    Vielleicht hilft es, zu wissen, dass für zwei Aussagen $alpha$ und $beta$ gilt:

    + $beta$ folgt logisch aus $alpha$, gdw. $tack.double.r_"AL" alpha -> beta$
    + $alpha$ ist logisch äquivalent zu $beta$, gdw. $tack.double.r_"AL" alpha <-> beta$
    + Sie im Skript S. 112 / 251: $<->$-Beseitigung.
][
    Logische Äquivalenz gilt zwischen zwei Aussagen $alpha$ und $beta$, gdw. $tack.double.r_"AL" alpha <-> beta$. Aufgrund der Regel $<->$-Beseitigung kann der Ausdruck wie folgt umgeformt werden: $tack.double.r_"AL" (alpha -> beta) and (beta -> alpha)$. Also sind zwei Ausdrücke $alpha$ und $beta$ logisch äquivalent, wenn $alpha$ aus $beta$ und $beta$ aus $alpha$ logisch folgt.
]