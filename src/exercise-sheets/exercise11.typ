#import "/src/templates/exercise.typ": project, task, subtask, blockquote, todo
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *
#import "/src/packages/log-quad.typ": *

#show: project.with(no: 11,
    date: datetime(year: 2024, month: 1, day: 15),
    show-solutions: true,
    show-todolist: false,
    show-hints: true)

#task[Prädikatenlogische Formalisierung][
    Formalisieren Sie die folgenden PL-Sätze!
][
    + Karthago muss zerstört werden.
    + Romulus und Remus sind Wolfskinder.
    + Die Gründer von Rom sind Wolfskinder.
    + Alle roten Autos gehören Peter.
    + Alle roten Autos gehören jemandem.
    + Niemand mag die Gründer von Rom.
    + Peter reist nach Rom, Helsinki und Seoul.
    + Etwas ist eine Schildkröte genau dann, wenn es langsam ist und einen Panzer hat.
    + Peter ist in Alice oder Petra verliebt.
    + Die Summe zweier natürlicher Zahlen ist größer als jede ihrer Summanden.
][
    + $Z x$: $x$ muss zerstört werden. \

        $a$: Karthago\

        $Z a$

    + $W x$: $x$ ist ein Wolfskind. \

        $a$: Romulus \
        $b$: Remus

        $W a and W b$

    + $G x y$: $x$ ist ein Gründer von $y$. \
        $W x$: $x$ ist ein Wolfskind.

        $a$: Rom \

        $forall x (G x a -> W x)$

    + $A x$: $x$ ist ein Auto. \
        $R x$: $x$ ist rot. \
        $G x y$: $x$ gehört $y$.

        $a$: Peter

        $forall x ((A x and R x) -> G x a)$

    + $A x$: $x$ ist ein Auto. \
        $R x$: $x$ ist rot. \
        $G x y$: $x$ gehört $y$.

        $forall x ((A x and R x) -> exists y G x y)$

    + $M x y$: $x$ mag $y$. \
        $G x y$: $x$ ist Gründer von $y$.

        $a$: Rom \

        $forall x (G x a -> not exists y (M y x))$

    + $R x y$: $x$ reist nach $y$. \

        $a$: Peter \
        $b$: Rom \
        $c$: Helsinki \
        $d$: Seoul \

        $R a b and R a c and R a d$

    + $S x$: $x$ ist eine Schildkröte. \
        $L x$: $x$ ist langsam. \
        $P x$: $x$ hat einen Panzer.

        $forall x (S x <-> (L x and P x))$

    + $V x y$: $x$ ist in $y$ verliebt. \

        $a$: Peter \
        $b$: Alice \
        $c$: Petra

        $V a b and V a c$

    + $N x$: $x$ ist eine natürliche Zahl. \
        $S x y z$: $x$ ist die Summe von $y$ und $z$. \
        $M x y$: $x$ ist ein Summand von $y$. \
        $G x y$: $x$ ist größer als $y$.

        $forall x forall y forall z ((N x and N y and S x y z) -> (G x y and G x z))$
]

#task[Einschränkungen der $forall$-Einführung][
    Nennen Sie die Einschränkungen der $forall$-Einführung!
][][
    + Die generalisierte Variable darf nicht in den Annahmen oder der Konklusion vorkommen.
    + Die generalisierte Variable darf nicht aus einer Existenzquantorbeseitigung stammen.
]

#task[Einschränkungen der $exists$-Beseitigung][
    Nennen Sie die Einschränkungen der $exists$-Beseitigung!
][][
    + Die spezialisierte Variable darf nicht in den Annahmen oder der Konklusion vorkommen.
    + Die spezialisierte Variable darf nicht bereits einer Existenzquantorbeseitigung eingeführt worden sein.
    + Die spezialisierte Variable darf nicht bereits in dem Satz auftauchen, auf den die $exists$-Beseitigung angewendet wurde.
]

/*
#task[Begründung der $forall$-Einführung][
    Erklären Sie an einem Beispiel, unter welchen Umständen sie einen Allquantor einführen dürfen und an welche Regeln sie gebunden sind!
][
    // zwei Schlüsse
][
    todo Lösungen
]

#task[Begründung der $exists$-Beseitigung][
    Erklären Sie an einem Beispiel, unter welchen Umständen sie einen Existenzquantor entfernen dürfen und welche Einschränkungen dafür gelten!
][
    // zwei Schlüsse
][
    todo Hinweise
][
    todo Lösungen

    Fehler:
    - vergessen Konstante in eine Variable umzubenennen
    - unterschiedliche Konstanten durch die gleiche Variable ersetzt
]
*/

#task[$forall$-Einführung I][
    Beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    // zwei Schlüsse
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], inference-raw(```
        $forall x F x and forall x H x$
        ----
        $forall x (F x and G x)$
        ```), h(2em),

        [2.], inference-raw(```
        $forall x (G a -> F x)$
        ----
        $G a -> forall x F x$
        ```)))))
][
    Die anschließend Überprüfung der Regeln muss nicht so ausführlich wie hier stattfinden. Es dient aber zum Verständnis der Regeln, diese jeweils ausführlich zu begründen.

    + #kdns(centered: false, ```
    a, forall x F x and forall x G x, Ann.
    b, forall x F x, $and$-Bes., a
    c, forall x G x, $and$-Bes., a
    d, F a, $forall$-Bes., b
    e, G a, $forall$-Bes., c
    f, F a and G a, $and$-Einf., d&e
    g, forall x (F x and G x), $forall$-Einf., f
    ```)

        Da die _$forall$-Einführung_ angewandt wurde, muss geprüft werden, ob das $a$, das quantifiziert wurde, die folgenden Regeln erfüllt (Siehe im Skript S. 113 / 252):

        + $a$ kommt weder in den Annahmen noch der Konklusion vor. $checkmark$
        + Die Zeile 6, auf die die _$forall$-Einführung_ angewendet wurde, darf keine Konstanten enthalten, die aus einer _$exists$-Beseitigung_ stammen. Es kommt als Konstante nur $a$ vor, die wurde nicht aus einer _$exists$-Beseitigung_ abgeleitet. $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(show_premises: true, centered: false, ```
    a, forall x (G a -> F x), Ann.
    b, G a, ZA
    c, G a -> F b, $forall$-Bes., a
    d, F b, MP, b&c
    e, forall x F x, $forall$-Einf., d
    f, G a -> forall x F x, $->$-Einf., b&e!b
    ```)

        Da die _$forall$-Einführung_ angewandt wurde, muss geprüft werden, ob das $b$, das quantifiziert wurde, die folgenden Regeln erfüllt (Siehe im Skript S. 113 / 252):

        1. $b$ kommt nicht in den Annahmen vor. $checkmark$
        2. $b$ kommt nicht in der Konklusion vor. $checkmark$
        3. Die Zeile 4, auf die die _$forall$-Einführung_ angewendet wurde, darf keine Konstanten enthalten, die aus einer _$exists$-Beseitigung_ stammen. Es kommt als Konstante nur $b$ vor, die wurde nicht aus einer _$exists$-Beseitigung_ abgeleitet. $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.
]

#task[$forall$-Einführung II][
    Formalisieren und beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    + #normalform[
        Alle Menschen sind sterblich.][
        Niemand ist sterblich.][
        Also sind alle unmenschlich.]

    + #normalform[
        Wenn Alice glücklich ist, sind alle glücklich.][
        Für alle gilt, dass wenn Alice glücklich ist, sie glücklich sind.]

    // + #normalform[
    //     Es gibt einen, der, wenn er ein Student ist, dieser lernt.][
    //     Wenn alle Studenten sind, gibt es einen, der lernt.]
][
    + $M x$: $x$ ist ein Mensch. \
        $S x$: $x$ ist sterblich.

        #inference-raw(```
        $forall x (M x -> S x)$
        $not exists x S x$
        ----
        $forall x not M x$
        ```)

        #kdns(```
        a, forall x (M x -> S x), Ann.
        b, not exists x S x, Ann.
        c, not not forall x not S x, QT, b
        d, forall x not S x, $not$-Bes., c
        e, not S a, $forall$-Bes., d
        f, M a -> S a, $forall$-Bes., a
        g, not M a, MT, e&f
        h, forall x not M x, $forall$-Einf., g
        ```)

        In Zeile 8 wurde eine $forall$-Einf. angewandt, es wurde $a$ generalisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    + $G x$: $x$ ist glücklich. \
        $a$: Alice

        #inference-raw(```
        $G a -> forall x G x$
        ----
        $forall x (G a -> G x)$
        ```)

        #kdns(show_premises: true, ```
        a, G a -> forall x G x, Ann.
        b, G a, ZA
        c, forall x G x, MP, a&b
        d, G b, $forall$-Bes., c
        e, G a -> G b, $->$-Einf., b&d!b
        f, forall x (G a -> G x), $forall$-Einf., e
        ```)

        In Zeile 6 wurde eine $forall$-Einf. angewandt, es wurde $b$ generalisiert. Daher gilt zu prüfen:

        + $b$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $b$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    // + $F x$: $x$ ist ein Student. \
    //     $G x$: $x$ lernt. \

    //     #inference-raw(```
    //     $exists x (F x -> G x)$
    //     ----
    //     $forall x F x -> exists x G x$
    //     ```)

    //     #kdns(show_premises: true, centered: false, ```
    //     a, exists x (F x -> G x), Ann.
    //     b, forall x F x, ZA
    //     c, F a -> G a, $exists$-Bes., a
    //     d, F a, $forall$-Bes., b
    //     e, G a, MP, c&d
    //     f, exists x G x, $exists$-Einf., e
    //     g, forall x F x -> exists x G x, "$->$-Einf., Q.E.D.", b&f!b
    //     ```)
]

#task[$forall$-Einführung III][
    Bringen Sie die folgenden Schlüsse in die Normalform, formalisieren und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    + Wenn es einen gibt, der allen hilft, dann ist allen geholfen.

    // zwei Schlüsse
    + #todo[Aufgabe]
][
    + $H x y$: $x$ hilft $y$.

        #normalform[
            Es gibt einen, der allen hilft.][
            Allen wird von jemandem geholfen.]

        #inference-raw(```
        $exists x forall y H x y$
        ----
        $forall x exists y H y x$
        ```)

        #kdns(centered: false, ```
        a, exists x forall y H x y, Ann.
        b, forall y H a y, $exists$-Bes., a
        c, H a b, $forall$-Bes., b
        d, exists y H y b, $exists$-Einf., c
        e, forall x exists y H y x, $forall$-Einf, d
        ```)

        Es wurde sowohl die _$exists$-Beseitigung_ als auch die _$forall$-Einführung_ angewandt. Daher muss die korrektheit der Anwendung beider Regeln betrachtet werden. $a$ stammt aus der $exists$-Beseitigung in Z. 2. $b$ wurde mit der _$forall$-Einführung_ generalisiert in Z. 5.

        + $a$ und $b$ kommen weder in den Annahmen noch in der Konklusion vor. $checkmark$
        + _$exists$-Beseitigung:_ Da es keine anderen Zeilen gibt, in denen eine _$exists$-Beseitigung_ angewendet wurde, wurde nirgendwo die gleiche Konstante zur _$exists$-Beseitigung_ benutzt. Das generalisierte $b$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$
        + Das spezialisierte $a$ kommt nicht bereits in der Zeile vor, auf die die _$exists$-Beseitigung_ angewendet wurde (Z. 1). $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #todo[Lösung] #h(1fr)
]

#task[$exists$-Beseitigung I][
    Beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    // zwei Schlüsse
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], inference-raw(```
        $exists x (G x -> H x)$
        ----
        $forall x G x -> exists x H x$
        ```), h(2em),

        [2.], block(breakable: false, inference-raw(```
        $forall x (F x <-> G x)$
        $exists x F x$
        ----
        $exists x (F x and G x)$
        ```))))))
][
    + #kdns(centered: false, show_premises: true, ```
    a, exists x (G x -> H x), Ann.
    b, forall x G x, ZA
    c, G a -> H a, $exists$-Bes., a
    d, G a, $forall$-Bes., b
    e, H a, MP, c&d
    f, exists x H x, $exists$-Einf., e
    g, forall x G x -> exists x H x, $->$-Einf.,  b&f!b
    ```)

        Da die Regel _$exists$-Beseitigung_ in Z. 9 angewendet wurde, muss überprüft werden, ob sie korrekt angewendet wurde:

        + Das spezialisierte $a$ kommt weder in den Annahmen noch der Konklusion vor. $checkmark$
        + Da es keine anderen Zeilen gibt, in denen eine _$exists$-Beseitigung_ angewendet wurde, wurde nirgendwo die gleiche Konstante zur _$exists$-Beseitigung_ benutzt. $checkmark$
        + $a$ kommt nicht bereits in der Zeile (Z. 1) vor, auf die die _$exists$-Beseitigung_ angewendet wurde. $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(centered: false, show_premises: true, ```
    a, forall x (F x <-> G x), Ann.
    b, exists x F x, Ann.
    c, F a, $exists$-Bes., b
    d, F a <-> G a, $forall$-Bes., a
    e, (F a -> G a) and (G a -> F a), $<->$-Bes., d
    f, F a -> G a, $and$-Bes., e
    g, G a, MP, f&c
    h, F a and G a, $and$-Einf., c&g
    i, exists x (F x and G x), $exists$-Einf., h
    ```)

        Da die Regel _$exists$-Beseitigung_ in Z. 3 angewendet wurde, muss überprüft werden, ob sie korrekt angewendet wurde:

        + Das spezialisierte $a$ kommt weder in den Annahmen noch der Konklusion vor. $checkmark$
        + Da es keine anderen Zeilen gibt, in denen eine _$exists$-Beseitigung_ angewendet wurde, wurde nirgendwo die gleiche Konstante zur _$exists$-Beseitigung_ benutzt. $checkmark$
        + $a$ kommt nicht bereits in der Zeile (Z. 2) vor, auf die die _$exists$-Beseitigung_ angewendet wurde. $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.
]

#task[$exists$-Beseitigung II][
    Formalisieren und beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    // zwei Schlüsse
    + #normalform[
        Alle Piraten sind Menschen.][
        Es gibt Säugetiere, die keine Menschen sind.][
        Es gibt Säugetiere, die keine Piraten sind.]

    + #todo[Aufgabe]
][
    + $F x$: $x$ ist ein Pirat. \
        $G x$: $x$ ist ein Mensch. \
        $H x$: $x$ ist ein Säugetier.

        #inference-raw(```
        $forall x (F x -> G x)$
        $exists x (H x and not G x)$
        ----
        $exists x (H x and not F x)$
        ```)

        #kdns(centered: false, ```
        a, forall x (F x -> G x), Ann.
        b, exists x (H x and not G x), Ann.
        c, F a -> G a, $forall$-Bes., a
        d, H a and not G a, $exists$-Bes., b
        g, H a, $and$-Bes., d
        e, not G a, $and$-Bes., d
        f, not F a, MT, c&e
        h, H a and not F a, $and$-Einf., g&f
        i, exists x (H x and not F x), $exists$-Einf., h
        ```)

        Da die Regel _$exists$-Beseitigung_ in Z. 4 angewendet wurde, muss überprüft werden, ob sie korrekt angewendet wurde:

        + Das spezialisierte $a$ kommt nicht in den Annahmen oder der Konklusion nicht vor. $checkmark$
        + Da es keine anderen Zeilen gibt, in denen eine _$exists$-Beseitigung_ angewendet wurde, wurde nirgendwo die gleiche Konstante zur _$exists$-Beseitigung_ benutzt. $checkmark$
        + $a$ kommt nicht bereits in der Zeile (Z. 2) vor, auf die die _$exists$-Beseitigung_ angewendet wurde. $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #todo[Lösungen] // #h(1fr) Q.E.D.
]

#task[$exists$-Beseitigung III][
    Bringen Sie die folgenden Schlüsse in die Normalform, formalisieren und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    // zwei Schlüsse
    + #todo[Aufgabe]

    + Die Philosophie setzt sich häufig mit Begriffsklärungen auseinander. Zum Beispiel könnte man vorschlagen, dass der Begriff "Besonnenheit" heißt, seine Lüste beherrschen zu können. Seine Lüste beherrschen zu können, heißt sich selbst zu beherrschen. Aber es gibt ein Gegenargument dagegen: Wenn jemand über etwas herrscht, hat der Herrscher mehr Macht als der Beherrschte. Und wenn einer mehr Macht hat als ein anderer, hat der andere nicht mehr Macht als der eine. Also gibt es keine Selbstbeherrschung.#footnote[Also beherrscht niemand sich selbst.]
][
    + #todo[Lösung] // #h(1fr) Q.E.D.

    + Der Text besteht aus einer Einleitung und dem Argument an sich. Die Einleitung ist nicht für das Argument relevant.

        #normalform[
            Wenn jemand über etwas herrscht, hat der Herrschende mehr Macht als der beherrschte.][
            Wenn einer mehr macht als ein anderer hat, hat der andere nicht mehr Macht als der eine.][
            Niemand beherrscht sich selbst.]

        $H x y$: $x$ herrscht über $y$. \
        $M x y$: $x$ hat mehr Macht als $y$.

        #inference-raw(```
        $forall x forall y (H x y -> M x y)$
        $forall x forall y (M x y -> not M y x)$
        ----
        $not exists x H x x$
        ```)

        #kdns(show_premises: true, centered: false, ```
        a, forall x forall y (H x y -> M x y), Ann.
        b, forall x forall y (M x y -> not M y x), Ann.
        c, not not exists x H x x, ZA
        d, exists x H x x, $not$-Bes, c
        e, forall y (H a y -> M a y), $forall$-Bes., a
        f, H a a -> M a a, $forall$-Bes., e
        g, forall y (M a y -> not M a y), $forall$-Bes., b
        h, M a a -> not M a a, $forall$-Bes., g
        i, H a a, $exists$-Bes., d
        j, M a a, MP, f&i
        k, not M a a, MP, h&j
        l, not not not exists x H x x, RAA, j&k&c!c
        m, not exists x H x x, $not$-Bes., l
        ```)

        Da die Regel _$exists$-Beseitigung_ in Z. 9 angewendet wurde, muss überprüft werden, ob sie korrekt angewendet wurde:

        + Das spezialisierte $b$ kommt weder in den Annahmen noch der Konklusion vor. $checkmark$
        + Da es keine anderen Zeilen gibt, in denen eine _$exists$-Beseitigung_ angewendet wurde, wurde nirgendwo die gleiche Konstante zur _$exists$-Beseitigung_ benutzt. $checkmark$
        + $a$ kommt nicht bereits in der Zeile (Z. 4) vor, auf die die _$exists$-Beseitigung_ angewendet wurde. $checkmark$

        Die Bedingungen sind erfüllt, daher ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.
]

#task[Lose Sammlung prädikatenlogischer Schlüsse][
    Beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens.
][
    #align(center, block(align(left, grid(columns: 9,
        column-gutter: 0.5em,
        row-gutter: 1em,
        [1.], inference-raw(```
        $forall x F x$
        $forall x (F x -> G x)$
        ----
        $forall x G x$
        ```), h(2em),

        [2.], inference-raw(```
        $not G a$
        $forall x (F x -> G x)$
        ----
        $not F a$
        ```), h(2em),

        [3.], inference-raw(```
        $forall x (G x -> F x)$
        $exists x (H x and G x)$
        ----
        $exists x (H x and F x)$
        ```), h(2em),

        [4.], inference-raw(```
        $forall x not G x$
        $forall y (H y -> G y)$
        ----
        $exists x not H x$
        ```), h(2em),

        [5.], inference-raw(```
        $forall x (F x -> G x)$
        ----
        $forall x F x -> forall x G x$
        ```), h(2em),

        [6.], inference-raw(```
        $exists x (F x -> G x)$
        ----
        $forall x F x -> exists x G x$
        ```), h(2em),

        [7.], inference-raw(```
        $forall x F x -> exists x G x$
        ----
        $exists x (F x -> G x)$
        ```), h(2em),

        [8.], inference-raw(```
        $not exists x (F x -> G x)$
        ----
        $not exists x (not F x or G x)$
        ```), h(2em),

        [9.], inference-raw(```
        $not exists (F x -> G x)$
        ----
        $forall x not G x$
        ```)))))
][
    + #kdns(centered: false, ```
    a, forall x F x, Ann.
    b, forall x (F x -> G x), Ann.
    c, F a, $forall$-Bes., a
    d, F a -> G a, $forall$-Bes., b
    e, G a, MP, c&d
    f, forall x G x, $forall$-Einf., e
    ```)

        In Zeile 6 wurde eine $exists$-Bes. angewandt, es wurde $a$ generalisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ wurde nicht bereits in einer anderen _$exists$-Beseitigung_ spezialisiert. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion abgeleitet aus den Prämissen abgeleitet werden konnte, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(centered: false, ```
    a, not G a, Ann.
    b, forall x (F x -> G x), Ann.
    c, F a -> G a, $forall$-Bes., b
    d, not F a, "MT, q.e.d.", c
    ```)

    + #kdns(centered: false, ```
    a, forall x (G x -> F x), Ann.
    b, exists x (H x and G x), Ann.
    c, G a -> F a, $forall$-Bes., a
    d, H a and G a, $exists$-Bes., b
    e, G a, $and$-Bes., d
    g, H a, $and$-Bes., d
    f, F a, MP, c&e
    h, F a and H a, $and$-Einf., g&f
    i, exists x (F x and H x), $exists$-Einf., h
    ```)

        In Zeile 4 wurde eine $exists$-Bes. angewandt, es wurde $a$ spezialisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ wurde nicht bereits in einer anderen _$exists$-Beseitigung_ spezialisiert. $checkmark$
        + $a$ kommt nicht bereits in der Zeile vor, die spezialisiert wurde (Z. 2). $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(centered: false, ```
    a, forall x not G x, Ann.
    b, forall y (H y -> G y), Ann.
    c, not G a, $forall$-Bes., a
    d, H a -> G a, $forall$-Bes., b
    e, not H a, MP, c&d
    f, exists x not H x, "$exists$-Einf., q.e.d.", e
    ```)

    + #kdns(centered: false, show_premises: true, ```
    a, forall x (F x -> G x), Ann.
    b, forall x F x, ZA
    c, F b -> G b, $forall$-Bes., a
    d, F b, $forall$-Bes., b
    e, G b, MP, c&d
    f, forall x G x, $forall$-Einf., e
    g, forall x F x -> forall x G x, $->$-Einf., b&c!b
    ```)

        In Zeile 6 wurde eine $forall$-Einf. angewandt, es wurde $b$ generalisiert. Daher gilt zu prüfen:

        + $b$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $b$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(centered: false, show_premises: true, ```
    a, exists x (F x -> G x), Ann.
    b, forall x F x, ZA
    c, F a -> G a, $exists$-Bes., a
    d, F a, $forall$-Bes., b
    e, G a, MP, c&d
    f, exists x G x, $exists$-Einf., e
    g, forall x F x -> exists x G x, $->$-Einf., b&f!b
    ```)

        In Zeile 3 wurde eine $exists$-Bes. angewandt, es wurde $a$ spezialisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ wurde nicht bereits in einer anderen _$exists$-Beseitigung_ spezialisiert. $checkmark$
        + $a$ kommt nicht bereits in der Zeile vor, die spezialisiert wurde (Z. 2). $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(show_premises: true, ```
    a, forall x F x -> exists x G x, Ann.
    b, not exists x (F x -> G x), ZA
    c, not not forall x not (F x -> G x), QT, b
    d, forall x not (F x -> G x), $not$-Bes., c
    e, not (F a -> G a), $not$-Bes., d
    f, F a and not G a, $->$-Ers., e
    g, F a, $and$-Bes., f
    h, not G a, $and$-Bes., f
    i, forall x F x, $forall$-Einf., g
    j, forall x not G x, $forall$-Einf., h
    k, not exists x not not G x, QT, j
    l, not exists x G x, $not$-Bes., k
    m, exists x G x, MP, a&i
    n, not not exists x (F x -> G x), RAA, b&l&m!b
    ```)

        In Zeile 8 und 9 wurde eine $forall$-Einf. angewandt, je wurde $a$ generalisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(```
    a, not exists x (F x -> G x), Ann.
    b, not not forall x not (F x -> G x), QT, a
    c, forall x not (F x -> G x), $not$-Bes.
    d, not (F a -> G a), $forall$-Bes., c
    e, F a and not G a, $->$-Ers., d
    f, not not (F a and not G a), $not$-Einf., e
    g, not (not F a or not not G a), DM, f
    h, not (not F a or G a), $not$-Bes., g
    i, forall x not (not F x or G x), $forall$-Einf., h
    j, not exists x not not (not F x or G x), QT, i
    k, not exists x (not F x or G x), $not$-Bes., j
    ```)

        In Zeile 9 wurde eine $forall$-Einf. angewandt, es wurde $a$ generalisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.

    + #kdns(```
    a, not exists x (F x -> G x), Ann.
    b, not not forall x not (F x -> G x), QT, a
    c, forall x not (F x -> G x), $not$-Bes., b
    d, not (F a -> G a), $forall$-Bes., c
    e, F a and not G a, $->$-Bes., d
    f, not G a, $and$-Bes., e
    g, forall x not G x, $forall$-Einf., f
    ```)

        In Zeile 7 wurde eine $forall$-Einf. angewandt, es wurde $a$ generalisiert. Daher gilt zu prüfen:

        + $a$ kommt weder in den Annahmen noch in der Konklusion vor.~$checkmark$
        + $a$ stammt nicht aus einer _$exists$-Beseitigung_. $checkmark$

        Damit ist die Ableitung fertig und da die Konklusion aus den Prämissen abgeleitet wurde und auch nur von den Prämissen abhängt, ist der Schluss gültig. #h(1fr) Q.E.D.
]

#task(key: "quine", extra: true)[Zählen in der Prädikatenlogik][
    Formalisieren Sie den folgenden Satz:
][
    Es gibt genau zwei Menschen.#footnote[Zur Formalisierung benötigen Sie das Identitätszeichen "$=$". Wenn $a = b$ gilt, dann sprechen $a$ und $b$ von demselben Objekt, also von einem einzigen. "$a = b$" ist eine Aussage in PL und darf auch so behandelt werden. Man könnte "=" als das Prädikat "... ist mit ... identisch." bestimmen. Aus Gewohnheit schreiben wir es aber zwischen zwei Individuen und nicht wie große Buchstaben davor.]
][
    $M x$: $x$ ist ein Mensch. \
    $x = y$: $x$ und $y$ bezeichnen dasselbe Ding.

    $exists x exists y (M x and M y and x eq.not y and forall z (M z -> (z=x or z=y)))$

    Der Satz $exists x exists y (M x and M y)$ hat das Problem, dass nicht ausgeschlossen werden kann, dass $x$ und $y$ dasselbe sind. Dieser Satz ist also bereits wahr, wenn es nur ein einziges Ding gibt, das ein Mensch ist. Das können wir ausschließen, indem wir außerdem festlegen, dass $x$ und $y$ nicht dasselbe sind, mit $x eq.not y$:

    $exists x exists y (M x and M y and x eq.not y)$

    Jetzt ist weiterhin das Problem, dass dieser Satz auch wahr ist, wenn es mehr als zwei Menschen gibt. Es sollen aber genau zwei sein, nicht mehr und nicht weniger. Daher legen wir dazu fest, dass alles, dann und nur dann ein Mensch ist, gdw. es entweder mit $x$ oder mit $y$ identisch ist: $forall z (M z -> (z = x or z = y))$!

    $exists x exists y (M x and M y and x eq.not y and forall z (M z -> (z = x or x = y)))$
]