#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *
#import "/src/packages/log-quad.typ": *

#show: project.with(no: 10,
    date: datetime(year: 2024, month: 1, day: 8),
    show-solutions: true,
    show-hints: true)

#task[Prädikatenlogische Formalisierung][
    Formalisieren Sie die folgenden PL-Sätze!
][
    + Auch ein blindes Huhn findet mal ein Korn.
    + Niemand hat Lust auf den Schokokuchen von Oma.
    + Jeder Dussel hat mindestens einen Fussel.
    + Niemand hat Lust auf Schokokuchen.
    + Das sind die Weisen, die durch den Irrtum zur Wahrheit reisen; die bei dem Irrtum verharren, das sind die Narren.
    + Wenn jeder jedem hilft, helfen einige sich selbst.
    + Ein Auto hat vier Räder.
][
    + $B x$: $x$ ist blind. \
        $H x$: $x$ ist ein Huhn. \
        $K x$: $x$ ist ein Korn. \
        $F x y$: $x$ findet $y$. \

        $exists x (B x and H x and exists y (K x y and F x y))$

        _oder_

        $exists x exists y (B x and H x and K x y and F x y)$

    + $L x y$: $x$ hat Lust auf $y$. \

        $a$: der Schokokuchen von Oma \

        $not exists x L x a$

        _oder_

        $K x$: $x$ ist ein Schokokuchen. \
        $B x y$: $x$ hat $y$ gebacken.

        $b$: Oma

        $not exists x exists y (L x y and K y and B b y)$

    + $D x$: $x$ ist ein Dussel. \
        $G x$: $x$ ist ein Fussel. \
        $H x$: $x$ hat \'nen $y$. \

        $forall x (D x -> exists y (G y and H x y))$

    + $S x$: $x$ ist ein Schokokuchen. \
        $G x y$: $x$ hat Lust auf $y$.

        $forall x (S x -> not exists y (L x y))$

    + $H x y$: $x$ hilft $y$.

        $forall x forall y H x y -> exists x H x x$

        // _oder_

        // $G x$: $x$ ist geholfen.

        // $forall x exists y H x y -> forall x G x$

    + $A x$: $x$ ist ein Auto. \
        $R x$: $x$ hat vier Räder.

        $forall x (A x -> R x)$

    + $N x$: $x$ ist ein Narr. \
        $W x$: $x$ ist ein Weiser. \
        $I x$: $x$ ist Irrtum. \
        $A x$: $x$ ist Wahrheit. \
        $R x y$: $x$ reist durch $y$ zu $z$. \
        $V x y$: $x$ verharrt bei $y$.

        $forall x ((W x -> forall y exists z ((I y and A z) -> R x y z)) and (N x -> exists y (I y and V x y)))$

        Man könnte auch argumentieren, dass mit "verharren" gemeint ist, dass es bei Narren Irrtümer gibt, bei denen es keine Wahrheit gibt, zu der sie durch den Irrtum gereist sind. Dann erhält man folgendes:

        $forall x ((W x -> forall y exists z ((I y and A z) -> R x y z)) and (N x -> \
            exists y not exists z ((I y and A z) -> R x y z)))$

        Vielleicht haben Sie schon bemerkt, dass die notwendige Bedingung für $W x$ und die notwendige Bedingung für $N x$ hier kontradiktorisch sind. Das sieht man einfacher, wenn man beide aufteilt und untereinanderschreibt:

        #set list(spacing: 1.25em)
        - $forall x (W x -> underline(forall y exists z ((I y and A z) -> R x y z)))$

        - $forall x (N x -> underline(exists y not exists z ((I y and A z) -> R x y z)))$

        Die notwendige Bedingungen folgen einmal dem Schema "$forall y alpha$" und einmal "$exists y not alpha$". Laut dem logischen Quadrat sind diese Sätze kontradiktorisch. Das heißt, dass ein Narr jemand ist, der nicht weise ist. Die Narren sind dann die Nicht-Weisen. Das kann man wie folgt festhalten:

        $forall x (N x -> not W x)$

        Wenn Sie die beiden Punkte als Prämissen annehmen, können Sie das sogar mit dem Kalkül des natürlichen Schließens ableiten. (Das wäre eine gute Klausurvorbereitung!) Die Übersetzung kann nun also wie folgt vereinfacht werden:

        $forall x ((W x -> forall y exists z ((I y and A z) -> R x y z)) and (N x -> not W x))$
]

#task[Begründung der $forall$-Beseitigung  _("universelle Spezialisierung")_][
    Erklären Sie an einem Beispiel, warum Sie den Allquantor beseitigen dürfen. Zeigen Sie anhand des Beispiels, wie Sie dazu vorgehen müssen. Nennen Sie außerdem typische Fehler, die auftreten können!
][][
    Wenn alle Menschen sterblich sind, gilt auch, dass wenn Peter ein Mensch ist, er sterblich ist. Da der Allquantor für alle Dinge gilt, ist es egal, über welches Ding die Aussage gemacht wird. Man wendet die $forall$-Beseitigung an, indem man den Quantor aus dem Satz entfernt und _alle vorher gebundenen_ Variablen durch eine beliebige Konstante ersetzt.

    $M x$: $x$ ist ein Mensch. \
    $S x$: $x$ ist sterblich.

    $a$: Peter

    #inference-raw(```
    $forall x (M x -> S x)$
    ----
    $M a -> S a$
    ```)

    In dem Beispiel wurde jedes $x$, das vorher durch den Allquantor gebunden war, durch dieselbe Konstante $a$ ersetzt.

    Ein typischer Fehler wäre...
    + zu vergessen eine Variable in die Zielkonstante umzubenennen,
    + die gleichen Variablen durch unterschiedliche Konstanten zu ersetzen oder
    + eine Variable in eine Konstante umzubenennen, die nicht zum Quantor gehört.
]

#task[Begründung der $exists$-Einführung _("existenzielle Generalisierung")_][
    Erklären Sie an einem Beispiel, warum Sie den Existenzquantor einführen dürfen. Zeigen Sie anhand des Beispiels, wie Sie dazu vorgehen müssen. Nennen Sie außerdem typische Fehler, die auftreten können!
][][
    Wenn Alice mit Bob redet, dann gibt es jemanden, der mit Bob redet. Wenn also jemand etwas tut, gibt es mindestens einen, der dies tut. Das besagt die Definition des Existenzquantors. Man geht vor, indem man den Existenzquantor an den Anfang des Satzes schreibt und ein oder beliebig viele Vorkommen _derselben_ Variable durch die zu bindende Variable ersetzt.

    $R x y$: $x$ redet mit $y$.

    $a$: Alice \
    $b$: Bob

    #block(breakable: false,
    inference-raw(```
    $R a b$
    ----
    $exists x R x b$
    ```))

    In diesem Beispiel wurde das $a$ von Alice durch die Variable $x$ an den eingeführten Existenzquantor gebunden.

    Ein typischer Fehler wäre es, unterschiedliche Konstanten durch die gleiche Variablen zu ersetzen.Aus $R a b$ kann nicht $exists x F x x$ gefolgert werden. Nur weil Alice mit Bob redet ($R a b$), kann man daraus nicht folgern, dass es einen gibt, der mit sich selbst redet ($exists x R x x$).
]

#task[$forall$-Beseitigung I][
    Beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], inference-raw(```
        $forall x (F x -> G x)$
        $F a$
        ----
        $G a$
        ```), h(2em),

        [2.], inference-raw(```
        $forall x (H x -> G x)$
        $forall x forall y (not H x -> G y)$
        ----
        $G c$
        ```)))))
][
    + #kdns(centered: false, ```
    a, forall x (F x -> G x), Ann.
    b, F a, Ann.
    c, F a -> G a, $forall$-Bes., a
    d, G a, "MP, q.e.d.", b&c
    ```)

    + #kdns(centered: false, show_premises: true, ```
    a, forall x (H x -> G x), Ann.
    b, forall x forall y (not H x -> G y), Ann.
    d0, forall y (not H c -> G y), $forall$-Bes., b
    d, not H c -> G c, $forall$-Bes., d0
    c, H c -> G c, $forall$-Bes., a
    e, not G c, ZA
    f, not H c, MT, e&c
    g, not not H c, MT, e&d
    h, not not G c, RAA, e&f&g!e
    i, G c, "$not$-Bes., q.e.d.", h
    ```)
]

#task[$forall$-Beseitigung II][
    Formalisieren Sie die folgenden Schlüsse und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    + #normalform[
        Alles liebt Bob.][
        Wenn Peter Bob liebt, dann ist Peter verliebt.][
        Peter ist verliebt.]

    + #normalform[
        Verbrecher ist man genau dann, wenn man ein Verbrechen begangen hat.][
        Man hat ein Verbrechen begangen oder man wurde nicht zurecht bestraft.][
        Claudius wurde zurecht bestraft.][
        Claudius ist ein Verbrecher.]
][
    + $F x y$: $x$ ist liebt $y$. \
        $G x$: $x$ ist verliebt.

        $a$: Peter \
        $b$: Bob

        #inference-raw(```
        $forall x F x b$
        $F a b -> G a$
        ----
        $G a$
        ```)

        #kdns(centered: false, ```
        a, forall x F x b, Ann.
        b, F a b -> G a, Ann.
        c, F a b, $forall$-Bes., a
        d, G a, "MP, q.e.d.", a&b
        ```)

    +  $F x$: $x$ ist ein Verbrecher. \
        $G x$: $x$ hat ein Verbrechen begangen. \
        $H x$: $x$ wird zurecht bestraft.

        $c$: Claudius

        #inference-raw(```
        $forall x (F x <-> G x)$
        $forall x (G x or not H x)$
        $H c$
        ----
        $F c$
        ```)

        #kdns(centered: false, ```
        a, forall x (F x <-> G x), Ann.
        b, forall x (G x or not H x), Ann.
        c, H c, Ann.,
        d, G c or not H c, $forall$-Bes., b
        e, not not H c, $not$-Einf., c
        f, G c, DS, d&e
        h, F c <-> G c, $forall$-Bes., a
        i, (F c -> G c) and (G c -> F c), $<->$-Bes.
        j, G c -> F c, $and$-Bes., i
        k, F c, "MP, q.e.d.", f&j
        ```)
]

#task[$forall$-Beseitigung III][
    Bringen Sie die folgenden Schlüsse in die Normalform, formalisieren und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    + Wenn Alice ein Gott ist, kann sie den großen See beeinflussen, denn alle Götter können alles beeinflussen.

    + Wenn Peter Wasser trinkt, wird er nicht so schnell krank. Denn es ist allgemein bekannt, dass, wenn jemand Wasser trinkt, dieser hydriert wird. Und wenn jemand hydriert wird, wird dieser nicht so schnell krank.
][
    + #normalform[
        Alle Götter können alles beeinflussen.][
        Wenn Alice ein Gott ist, kann sie den großen See beeinflussen.]

        $F x$: $x$ ist ein Gott. \
        $G x y$: $x$ kann $y$ beeinflussen.

        $a$: Alice \
        $b$: der große See

        #inference-raw(```
        $forall x forall y (F x -> G y)$
        ----
        $F a -> F b$
        ```)

        #kdns(centered: false, ```
        a, forall x forall y (F x -> G y), Ann.
        b, forall y (F a -> G y), $forall$-Bes., a
        c, F a -> G b, "$forall$-Bes., q.e.d.", b
        ```)

    + #normalform[
        Wenn jemand Wasser trinkt, wird dieser hydriert.][
        Wenn jemand hydriert wird, wird dieser nicht so schnell krank.][
        Wenn Peter Wasser trinkt, wird er nicht so schnell krank.]

        $F x$: $x$ trinkt Wasser. \
        $G x$: $x$ wird hydriert. \
        $H x$: $x$ wird nicht so schnell krank. \

        $a$: Peter \

        #inference-raw(```
        $forall x (F x -> G x)$
        $forall x (G x -> H x)$
        ----
        $F a -> H a$
        ```)

        #kdns(centered: false, show_premises: true, ```
        a, forall x (F x -> G x), Ann.
        b, forall x (G x -> H x), Ann.
        c, F a, ZA
        d, F a -> G a, $forall$-Bes., a
        e, G a, MP, c&d
        f, G a -> H a, $forall$-Bes., b
        g, H a, MP, e&f
        h, F a -> H a, "$->$-Einf., q.e.d.", c&g!c
        ```)
]

#task[$exists$-Einführung I][
    Beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], inference-raw(```
        $F a and F b$
        ----
        $exists x F x$
        ```), h(2em),

        [2.], inference-raw(```
        $G a -> (F b a -> F a b)$
        ----
        $(G a and F b a) -> exists x F x b$
        ```)))))
][
    + #kdns(centered: false, ```
        a, F a and F b, Ann.
        b, F a, $and$-Bes., a
        c, exists x F x, "$exists$-Einf., q.e.d.", b
        ```)

    + #kdns(show_premises: true, centered: false, ```
        a, G a -> (F b a -> F a b), Ann.
        b, not ((G a and F b a) -> exists x F x b), ZA
        c, (G a and F b a) and not exists x F x b, $->$-Ers., b
        d, G a and F b a, $and$-Bes., c
        e, not exists x F x b, $and$-Bes., c
        f, G a, $and$-Bes., d
        g, F b a, $and$-Bes., d
        h, F b a -> F a b, MP, a&f
        i, F a b, MP, g&h
        j, exists x F x b, $exists$-Einf., i
        k, not not ((G a and F b a) -> exists x F x b), RAA, e&j&c!e
        l, (G a and F b a) -> exists x F x b, "$not$-Bes., q.e.d.", k
        ```)
]

#task[$exists$-Einführung II][
    Formalisieren Sie die folgenden Schlüsse und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    + #normalform[
        Verina ist eine Hexe.][
        Wenn es Hexen gibt, dann gibt es Dinge, die zaubern können.][
        Also gibt es Dinge, die zaubern können.]

    + #normalform[
        Alle helfen allen.][
        Es gibt jemanden, der allen hilft.]

    // + #normalform[
    //     Pferde fliegen genau dann, wenn einige Elefanten nicht Klavier spielen.][
    //     Dumbo ist Elefant und kann nicht Klavier spielen.][
    //     Wenn Elefanten Klavier spielen oder Pferde fliegen, dann sollte Peter keine Tabletten nehmen.][
    //     Peter sollte keine Tabletten nehmen.]
][
    + $F x$: $x$ ist eine Hexe. \
        $G x$: $x$ kann zaubern.

        $a$: Verina

        #inference-raw(```
        $F a$
        $exists x F x -> exists x G x$
        ----
        $exists x G x$
        ```)

        #kdns(centered: false, ```
        a, F a, Ann.
        b, exists x F x -> exists x G x, Ann.
        c, exists x F x, $exists$-Einf., a
        d, exists x G x, "MP, q.e.d.", b&c
        ```)

    + $H x y$: $x$ hilft $y$.

        #inference-raw(```
        $forall x forall y H x y$
        ----
        $exists x forall y H x y$
        ```)

        #kdns(centered: false, ```
        a, forall x forall y H x y, Ann.
        b, forall y H a y, $forall$-Bes., a
        c, exists x forall y H x y, $exists$-Einf., b
        ```)

    // + $F x$: $x$ fliegt. \
    //     $K x$: $x$ kann Klavier spielen. \
    //     $P x$: $x$ ist ein Pferd. \
    //     $E x$: $x$ ist ein Elefant. \
    //     $T x$: $x$ ist eine Tablette. \
    //     $N x y$: $x$ sollte $y$ nicht nehmen.

    //     $a$: Dumbo \
    //     $b$: Peter

    //     #inference-raw(```
    //     $forall x (P x -> F x) <-> exists x (E x and not K x)$
    //     $E a and not K a$
    //     $(forall x (E x -> K x) or forall x (P x -> F x)) -> forall x (T x -> not N x b)$
    //     --
    //     $forall x (T x -> not N x b)$
    //     ```

    //     #kdns(centered: false, ```
    //     a, forall x (P x -> F x) <-> exists x not (E x and not K x), Ann.
    //     b, E a and not K a, Ann.
    //     c, \ (forall x (E x -> K x) or forall x (P x -> F x)) \ -> forall x (T x -> not N x b), Ann.
    //     d, exists x (E x and not K x), $exists$-Einf., b
    //     e, \ (forall x (P x -> F x) -> exists x (E x and not K x)) and \ (exists x (E x and not K x) -> forall x (P x -> F x)), $<->$-Bes., a
    //     f, exists x (E x and not K x) -> forall x (P x -> F x), $and$-Bes., e
    //     g, forall x (P x -> F x), MP, f
    //     h, forall x (E x -> K x) or forall x (P x -> F x), $or$-Einf., g
    //     i, forall x (T x -> not N x b), "MP, q.e.d.", h&c
    //     ```)
]

#task[$exists$-Einführung III][
    Bringen Sie den folgenden Schluss in die Normalform, formalisieren und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    Alle Dinge stammen aus der Erfahrung. Also gibt es Dinge, die aus der Erfahrung stammen und wechselwirken, denn alle Dinge wechselwirken.
][
    #normalform[
        Alle Dinge stammen aus der Erfahrung.][
        Alle Dinge wechselwirken.][
        Es gibt Dinge, die aus der Erfahrung stammen und wechselwirken.]

    $F x$: $x$ stammt aus der Erfahrung. \
    $G x$: $x$ wechselwirken. \

    #block(breakable: false, inference-raw(```
    $forall x F x$
    $forall x G x$
    ----
    $exists x (F x and G x)$
    ```))

    #kdns(centered: false, ```
    a, forall x F x, Ann.
    b, forall x G x, Ann.
    c, F a, $forall$-Bes., a
    d, G a, $forall$-Bes., b
    e, F a and G a, $and$-Einf., c&d
    f, exists x (F x and G x), $exists$-Einf., e
    ```)

    // + #normalform[
    //     Wenn St. Nikolaus durch die Nacht zieht, dann bekommt Peter, vorausgesetzt er war artig, Geschenke.][
    //     Jemand bekommt Geschenke, wenn St. Nikolaus durch die Nacht zieht und Peter artig war.]

    //     $N x$: $x$ zieht durch die Nacht. \
    //     $A x$: $x$ war artig. \
    //     $G x$: $x$ bekommt Geschenke.

    //     $a$: St. Nikolaus \
    //     $b$: Peter

    //     #inference-raw(```
    //     $N a -> (A b -> G b)$
    //     --
    //     $(N a and A b) -> exists x G x$
    //     ```

    //     #kdns(show_premises: true, centered: false, ```
    //     a, N a -> (A b -> G b), Ann.
    //     b, not ((N a and A b) -> exists x G x), ZA
    //     c, (N a and A b) and not exists x G x, $->$-Ers., b
    //     d0, not exists x G x, $and$-Bes., c
    //     d, N a and A b, $and$-Bes., c
    //     e, N a, $and$-Bes., d
    //     f, A b, $and$-Bes., d
    //     g, A b -> G b, MP, a&e
    //     h, G b, MP, f&g
    //     i, exists x G x, $exists$-Einf., h
    //     j, not not ((N a and A b) -> exists x G x), RAA, d0&i&b!b
    //     k, (N a and A b) -> exists x G x, "$not$-Bes., q.e.d.", j
    //     ```)
]

#task[Quantorentausch I][
    Beweisen Sie die folgenden Schlüsse mit dem Kalkül des natürlichen Schließens!
][
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], inference-raw(```
        $forall x not F x$
        ----
        $not exists x F x$
        ```), h(2em),

        [2.], inference-raw(```
        $forall x G x$
        ----
        $F a -> not exists x not G x$
        ```)))))
][
    + #kdns(centered: false, ```
        a, forall x not F x, Ann.
        b, not exists x not not F x, QT, a
        c, not exists x F x, "$not$-Bes., q.e.d.", b
        ```)

    + #kdns(centered: false, show_premises: true, ```
        a, forall x G x, Ann.
        b, F a, ZA
        c, not exists x not G x, QT, a
        d, F a -> not exists x not G x, "$->$-Einf., q.e.d.", b&c!b
        ```)
]

#task[Quantorentausch II][
    Bringen Sie die folgenden Schlüsse in die Normalform, formalisieren und beweisen Sie sie mit dem Kalkül des natürlichen Schließens!
][
    Wenn es einen Gott gibt, dann hat er alles gemacht. Also gilt: Wenn es einen Gott gibt, dann gibt es nichts, was er nicht gemacht hat.
][
    #normalform[
        Wenn es einen Gott gibt, dann hat er alles gemacht.][
        Wenn es einen Gott gibt, dann gibt es nichts, was er nicht gemacht hat.]

    $G x$: $x$ ist ein Gott. \

    #inference-raw(```
    $exists x G x -> forall x M x$
    ----
    $exists x G x -> not exists x not M x$
    ```)

    #kdns(centered: false, show_premises: true, ```
    a, exists x G x -> forall x M x, Ann.
    b, exists x G x, ZA
    c, forall x M x, MP, a&b
    d, not exists x not M x, QT, c
    e, exists x G x -> not exists x not M x, "$->$-Einf., q.e.d.", b&d!b
    ```)

    _oder_, da die Regel _Quantorentausch_ eine "K"-Regel ist und auf innere Ausdrücke angewandt werden kann:

    #kdns(centered: false, ```
    a, exists x G x -> forall x M x, Ann.
    b, exists x G x -> not exists x not M x, "QT, q.e.d.", a
    ```)
]