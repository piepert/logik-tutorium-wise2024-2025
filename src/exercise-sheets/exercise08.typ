#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#let ha = highlight.with(fill: colors.blue.lighten(50%))
#let hb = highlight.with(fill: colors.magenta.lighten(50%))
#let hc = highlight.with(fill: colors.brown.lighten(50%))
#let hd = highlight.with(fill: colors.purple.lighten(50%))
#let he = highlight.with(fill: colors.yellow.lighten(50%))

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 8,
    date: datetime(year: 2024, month: 12, day: 11),
    show-solutions: true,
    show-hints: true)

#task[Begrenztheit der Aussagenlogik][
    Beurteilen und beweisen Sie mit der Aussagenlogik, ob der folgende Schluss aussagenlogisch gültig ist!
][
    #inference-raw(```
    Jeder kennt jeden.
    ----
    Jeder kennt sich selbst.
    ```)
][
    Der Schluss ist gültig, jedoch nicht mit den Hilfsmitteln der Aussagenlogik beweisbar. Die Wahrheitstafel zeigt:

    $p$: Jeder kennt jeden. \
    $q$: Jeder kennt sich selbst.

    #truth-table("p", "q")

    Nach der Wahrheitstafel wäre der Schluss nicht gültig. Aber angenommen, nicht jeder kennt sich selbst. Das würde bedeuten, dass es mindestens einen gibt, der sich selbst nicht kennt. Selbst wenn er sonst alle kennen würde, fehlt ihm doch einer: er selbst. Damit widerspricht das der Prämisse, dass jeder jeden kennt. Damit ist der Schluss gültig.

    Anscheinend ist die Aussagenlogik nicht mächtig genug, um solche Schlüsse korrekt darstellen zu können. Der Ausweg: die Prädikatenlogik.
]

#task[Namen][
    Markieren Sie in den folgenden Sätzen die Nominatoren derselben Individuen mit derselben Farbe.
][
    Peter ist in Rom. Darüber freut er sich, denn sie ist eine schöne Stadt. Sie ist die Hauptstadt von Italien. Jener fährt auch nach Venedig, welche er aber gar nicht mag.
][
    #ha[Peter] ist in #hb[Rom]. Darüber ist #ha[er] erfreut, denn #hb[sie] ist eine schöne Stadt. #hb[Sie] ist #hb[die Hauptstadt von Italien]. #ha[Jener] fährt auch nach #hc[Venedig], #hc[welche] #ha[er] aber gar nicht mag.
]

#task[Prädikate I][
    Erklären Sie, was Prädikate sind. Beschreiben Sie den Unterschied zwischen Prädikaten und Nominatoren.
][][
    Prädikate beschreiben Eigenschaften und Beziehungen zwischen Individuen. In dem Satz "Diese Katze ist orange." ist etwa "orange sein" eine Eigenschaft, also ein Prädikat.

    Unter Prädikaten fallen häufig mehrere Gegenstände, während Nominatoren nur eine einzige Sache bezeichnen sollen. "orange sein" bezeichnet nicht nur eine Katze, darunter fallen alle orangen Katzen, orangen Hunde, eben alles, was orange ist. Aber der Nominator "diese Katze" bezeichnet nur eine einzige Sache.
]

#task[Prädikate II][
    Markieren Sie in den folgenden Sätzen dieselben Prädikate mit derselben Farbe.
][
    Meine Katze ist schwarz, trotzdem bringt sie kein Pech. Die meisten Katzen haben Schwänze. Außerdem haben sie Haare und Augen. Auch Hunde haben Schwänze. Es ist ebenfalls der Fall, dass Hunde Haare und Augen haben. Viele Katzen können springen. Mein Hamster kann springen und er bringt Pech, aber er ist nicht schwarz.
][
    Meine Katze #ha[ist schwarz], trotzdem #hb[bringt] sie nicht #hb[Pech]. Die meisten Katzen #hc[haben Schwänze]. Außerdem #hd[haben] sie #hd[Haare und Augen]. Auch Hunde #hc[haben Schwänze]. Es ist ebenfalls der Fall, dass Hunde #hd[Haare und Augen haben]. Viele Katzen #he[können springen]. Mein Hamster #he[kann springen] und er #hb[bringt Pech], aber er #ha[ist] nicht #ha[schwarz].
]

#task[Prädikatenlogische Formalisierung I][ // Prädikate, Individuen und Junktoren
    Formalisieren Sie die folgenden Aussagen!
][
    + Peter trägt eine Brille.
    + Anna und Claudia verabreden sich mit Peter.
    + Trägt Peter eine Brille, sieht er gut.
    + Wenn Peter sich mit Anna verabredet, dann auch mit Claudia.
    + Peter trägt eine Brille genau dann, wenn auch Claudia das tut.
][
    $a$: Peter \
    $b$: Anna \
    $c$: Claudia

    $B x$: $x$ trägt eine Brille. \
    $V x y$: $x$ verabredet sich mit $y$. \
    $S x$: $x$ sieht gut.

    + $B a$
    + $V b a and V c a$
    + $B a -> S a$
    + $V a b -> V a c$
    + $B a <-> B c$
]

#task[Prädikatenlogische Formalisierung II][ // Prädikate, Individuen und Junktoren
    Übersetzen Sie die folgenden PL-Sätze zurück in die natürliche Sprache!
][
    $h$: Herbie \
    $j$: Jim Douglas \
    $p$: Paris

    $K x$: $x$ ist ein Käfer. \
    $T x$: $x$ ist toll. \
    $G x y$: $x$ wird von $y$ gefahren. \
    $F x y z$: $x$ fährt mit $y$ nach $z$.

    + $K h$
    + $K h and T h$
    + $not T h -> not (T h and K h)$
    + $G h j$
    + $not T j -> not G h j$
    + $F j h p$
    + $G h j -> F h j p$
][
    + Herbie ist ein Käfer.
    + Herbie ist ein toller Käfer. bzw. Herbie ist toll und ein Käfer.
    + Wenn Herbie nicht toll ist, dann ist Herbie nicht sowohl toll als auch ein Käfer.
    + Herbie wird von Jim Douglas gefahren.
    + Wenn Jim Douglas nicht toll ist, dann wird Herbie nicht von Jim Douglas gefahren.
    + Jim Douglas fährt mit Herbie nach Paris.
    + Wenn Herbie von Jim Douglas gefahren wird, dann fährt Jim Douglas mit Herbie nach Paris.
]

#task[Quantoren I][
    Beschreiben Sie die Bedeutung der prädikatenlogischen Symbole "$forall$" und "$exists$"!
][][
    Das Symbol "$forall$" wird verwendet, um Allaussagen zu bilden, d.h. Aussagen, die für jedes Individuum wahr sind. Umgangssprachlich kann es übersetzt werden mit: "Für alle Sachen gilt, dass ..."

    Das Symbol "$exists$" wird verwenet, um Existenzaussagen zu bilden, d.h. Aussgen, die für mindestens ein Individuum wahr sind. Umgangssprachlich kann es übersetzt werden mit: "Es existiert mindestens eine Sache, für die gilt, dass ..."

    // Beide Symbole werden "Quantoren" genannt. Um einen vollwertigen PL-Satz mit ihnen zu bilden, folgt auf die Quantoren zuerst der Name einer Individuenvariable und dann ein weiterer PL-Satz, in dem die Variable mindestens einmal vorkommt. Zum Beispiel "$exists x (F x and G x)$".
]

#task[Quantoren II][
    Erklären Sie den folgenden Ausdruck! Nennen Sie eine Möglichkeit, wie man den Ausdruck in die Normalsprache übersetzen könnte.
][
    $F x$: $x$ lügt.

    $forall x F x$
][
    Der Ausdruck besagt, dass jedes Individuum die Eigenschaft $F$ hat. Wenn "$F x$" für "$x$ lügt." steht, dann bedeutet der Ausdruck, dass _alles_ lügt.

    Der Ausdruck könne mit "Alles lügt." in die Normalsprache übersetzt werden.
]

/*
#task[Quantoren III][
    Formalisieren Sie den Satz "Nichts ist rot." mit einer geeigneten Zurodnungsliste!
][][
    $R x$: $x$ ist rot.

    Möglich wäre z.B.:
    - $forall x not R x$
    - $not exists x R x$
]

#task[Prädikatenlogische Formalisierung II][ // einfach mit Allquantor und Existenzquantor
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
    + $not exists x (M x and not S x)$ _oder_ $forall x not (M x and not S x)$ _oder_ $forall x (M x -> S x)$
]

#task[Freie und gebundene Variablen][
    Erklären Sie, wann eine Variable als "gebunden" beschrieben wird. Dürfen in Sätzen Variablen "ungebunden" bzw. "frei" vorkommen?
][][
    Eine Variable ist gebunden genau dann, wenn sie in dem Bindungsbereich eines Quantors vorkommt und die gleiche ist wie die, die hinter dem Quantor steht. Der Bindungsbereich eines Quantors ist der nächstmöglich kürzeste Satz direkt hinter dem Quantor und seiner Variable.

    #align(center, $#text(fill: ca.darken(20%), [$forall x$]) #bha[$(F x and (G x -> not H x))$]$)

    Für das Beispiel ist der kürzeste Satz hinter dem Quantor derjenige, der eingeklammer ist, also: $F x and (G x -> not H x)$. Dort kann nun für $x$ alles eingesetzt werden. Nur wenn der Satz unter allen Belegungen wahr ist, wird der Allquantor wahr. Im Falle des Existenzquantors reicht ein einziges Individuum zu finden, für den der Satz wahr wird, dann ist der Existenzquantor wahr. Hier ein weiteres Beispiel für die Bindungsbereiche:

    #align(center, $#text(fill: ca.darken(20%), [$forall x$]) #bha[$#text(fill: cb.darken(20%), [$forall y$]) #bhb[$F x y <-> #text(fill: cd.darken(20%), [$exists z$]) #bhd[$G x z and G y z$]$]$]$)

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
    + Jeder liebt jemanden.
    + Jemand wird von allen geliebt.
][
    $L x y$: $x$ liebt $y$.

    + $forall x exists y L x y$
    + $exists y forall x L x y$

    Die Reihenfolge der Quantoren scheint das normalsprachliche Aktiv und Passiv zu vertauschen. Außerdem ist im 1. Satz davon die Rede, dass jeder irgendwen liebt, aber im zweiten Satz, dass _mindestens eine einzige_ Person von _allen_ geliebt wird. Die Aussagen stehen also für verschiedene Dinge!
]