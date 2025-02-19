#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *
#import "/src/packages/log-quad.typ": *

#let ca = colors.blue.lighten(50%)
#let cb = colors.magenta.lighten(50%)
#let cc = colors.brown.lighten(50%)

#let ha = highlight.with(fill: ca)
#let hb = highlight.with(fill: cb)
#let hc = highlight.with(fill: cc)

#let bha = block.with(outset: (y: 5pt), fill: ca)
#let bhb = block.with(outset: (y: 5pt), fill: cb)
#let bhc = block.with(outset: (y: 5pt), fill: cc)

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 9,
    date: datetime(year: 2024, month: 12, day: 18),
    show-solutions: true,
    show-hints: true)

#task[Prädikatenlogische Formalisierung][ // einfach mit Allquantor und Existenzquantor
    Formalisieren Sie die folgenden Sätze!
][
    + Alle Menschen sind sterblich.
    + Alice liebt Bob.
    + Alice und Bob hassen Mallory.
    + Jeder hasst Mallory.
    + Niemand hasst Mallory.
    + Alle Menschen sind nicht sterblich.
    + Kein Mensch ist unsterblich.
][
    $M x$: $x$ ist ein Mensch. \
    $S x$: $x$ ist sterblich. \
    $L x y$: $x$ liebt $y$. \
    $H x y$: $x$ hasst $y$.

    $a$: Alice \
    $b$: Bob \
    $c$: Mallory

    + $forall x (M x -> S x)$
    + $L a b$
    + $H a c and H b c$
    + $forall x H x c$
    + $not exists x H x c$
    + $forall x (M x -> not S x)$
    + $not exists x (M x and not S x)$ _oder_ $forall x not (M x and not S x)$ // _oder_ $forall x (M x -> S x)$
]

#task[Freie und gebundene Variablen][
    Erklären Sie, wann eine Variable als "gebunden" beschrieben wird. Dürfen in Sätzen Variablen "ungebunden" bzw. "frei" vorkommen?
][][
    Eine Variable ist gebunden genau dann, wenn sie in dem Bindungsbereich eines Quantors vorkommt und die gleiche ist wie die, die hinter dem Quantor steht. Der Bindungsbereich eines Quantors ist der nächstmöglich kürzeste Satz direkt hinter dem Quantor und seiner Variable.

    #align(center, $#text(fill: ca.darken(20%), [$forall x$]) #bha[$(F x and (G x -> not H x))$]$)

    Für das Beispiel ist der kürzeste Satz hinter dem Quantor derjenige, der eingeklammer ist, also: $F x and (G x -> not H x)$. Dort kann nun für $x$ alles eingesetzt werden. Nur wenn der Satz unter allen Belegungen wahr ist, wird der Allquantor wahr. Im Falle des Existenzquantors reicht ein einziges Individuum zu finden, für den der Satz wahr wird, dann ist der Existenzquantor wahr. Hier ein weiteres Beispiel für die Bindungsbereiche:

    #align(center, $#text(fill: ca.darken(20%), [$forall x$]) #bha[$#text(fill: cb.darken(20%), [$forall y$]) #bhb[$F x y <-> #text(fill: cc.darken(20%), [$exists z$]) #bhc[$G x z and G y z$]$]$]$)

    Variablen dürfen in Sätzen niemals frei vorkommen. Die einzigen Namen, die frei vorkommen dürfen sind Individuenkonstanten wie $a$, $b$, $c$, ... (siehe im Skript S. 72 f. / 115 ff. sowie S. 84 / 175 ganz am Ende der Seite).
]

#task[Bindungsbereiche von Quantoren][
    Markieren Sie den Bindungsbereich der Quantoren durch Unterstreichung in verschiedenen Farben.
][
    + $forall x (F x and G x)$

    + $forall x F x -> exists x G x$

    + $exists x not ((G x and not H x) -> not forall x (F x <-> not H x))$

    + $exists x not forall y (F x -> exists z H x y z)$

    + $F a -> forall x (G b and F x and exists y forall z (H z y))$
][
    #set enum(tight: false,  spacing: 2em)
    + #place(line(length: 4em), dy: 1em, dx: 1.5em)
        $forall x (F x and G x)$

    + #place(line(length: 1.4em), dy: 1em, dx: 1.25em)
        #place(line(length: 1.6em), dy: 1em, dx: 5.1em)
        $forall x F x -> exists x G x$

    + #place(line(length: 16em), dy: 1.25em, dx: 1.2em)
        #place(line(length: 5.5em), dy: 1em, dx: 11.25em)
        $exists x not ((G x and not H x) -> not forall x (F x <-> not H x))$

    + #place(line(length: 9em), dy: 1.5em, dx: 1.25em)
        #place(line(length: 7em), dy: 1.25em, dx: 3em)
        #place(line(length: 2.5em), dy: 1em, dx: 7.4em)
        $exists x not forall y (F x -> exists z H x y z)$

    + #place(line(length: 10.25em), dy: 1.5em, dx: 4.25em)
        #place(line(length: 4em), dy: 1.25em, dx: 10.25em)
        #place(line(length: 2.75em), dy: 1em, dx: 11.5em)
        $F a -> forall x (G b and F x and exists y forall z (H z y))$
]

#task[Quantorenreihenfolge][
    Formalisieren Sie die folgenden beiden Sätze. Beschreiben Sie, was Ihnen auffällt.
][
    $L x y$: $x$ liebt $y$.

    + Jeder liebt jemanden.
    + Jemand wird von allen geliebt.
][
    $L x y$: $x$ liebt $y$.

    + $forall x exists y L x y$
    + $exists y forall x L x y$

    Die Reihenfolge der Quantoren scheint das normalsprachliche Aktiv und Passiv zu vertauschen. Außerdem ist im 1. Satz davon die Rede, dass jeder irgendwen liebt, aber im zweiten Satz, dass _mindestens eine einzige_ Person von _allen_ geliebt wird. Die PL-Sätze stehen also für verschiedene Dinge!
]

#task[Logisches Quadrat][
    Vervollständigen Sie das folgende logische Quadrat!
][
    #let b = [?] // box(inset: (top: 1em), line(length: 3cm))

    #block(width: 100%, figure(log-quad(
        a: [
            Alles ist einzigartig.\
            $forall x E x, not exists x not E x$],
        i: b,
        e: b,
        o: b,

        k: b,
        kd: b,
        sk: b
    )))
][
    #block(width: 100%, figure(log-quad(
        a: [
            Alles ist einzigartig.\
            $forall x E x$, $not exists x not E x$],
        i: [
            Es gibt einzigartiges.\
            $exists x E x$, $not forall x not E x$
        ],
        e: [
            Nichts ist einzigartiges.\
            $forall x not E x$, $not exists x E x$
        ],
        o: [
            Einiges ist nicht einzigartig.\
            $exists x not E x$, $not forall x E x$
        ],
    )))
]