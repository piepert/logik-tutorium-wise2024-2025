#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 6,
    date: datetime(year: 2024, month: 11, day: 20),
    show-solutions: true,
    show-hints: true)

#task[Aussagenlogische Formalisierung][
    Formalisieren Sie die folgenden Sätze.
][
    + Peter und Petra essen ein Eis.
    + Das Huhn oder der Hahn krähen.
    + Nur dann wird die Straße nass, wenn es regnet.
    + Es regnet oder schneit.
    + Niemand mag Eis.
    + Quine und Russel waren Philosophie-Dozenten genau dann, wenn sie Philosophen waren.
    + Nur wenn man übt, wird man zum Meister.
][
    #set enum(spacing: 2em)

    + Peter und Petra essen ein Eis.

        $p$: Peter isst ein Eis. \
        $q$: Petra isst ein Eis.

        $p and q$

    + Das Huhn oder der Hahn krähen.

        $p$: Das Huhn kräht. \
        $q$: Der Hahn kräht.

        $p or q$

    + Nur dann wird die Straße nass, wenn es regnet.

        $p$: Die Straße wird nass. \
        $q$: Es regnet.

        $q -> p$ oder auch $not p -> not q$

    + Es regnet oder schneit.

        $p$: Es regnet. \
        $q$: Es schneit.

        $p or q$

    + Niemand mag Eis.

        $p$: Jemand mag Eis.

        $not p$

        oder

        $q$: Niemand mag Eis.

        $q$

    + Quine und Russel waren Philosophie-Dozenten genau dann, wenn sie Philosophen waren.

        $p$: Quine war ein Philosophie-Dozent. \
        $q$: Russel war ein Philosophie-Dozent. \
        $r$: Quine war Philosoph. \
        $s$: Russel war Philosoph.

        $(p and q) <-> (r and s)$

    + Nur wenn man übt, wird man zum Meister.

        $p$: Man übt. \
        $q$: Man wird zum Meister.

        $q -> p$ oder auch $not p -> not q$
]

#task[Kalkül des natürlichen Schließens I][
    Beweisen Sie die folgenden Argumente mit dem Kalkül des natürlichen Schließens.
][
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], ```inference
        $(p and q) -> r$
        $p$
        $q$
        ----
        $r$
        ```, h(2em),

        [2.], ```inference
        $not (p and q)$
        $p$
        ----
        $not q$
        ```, h(2em),

        [3.], ```inference
        $s -> t$
        $t -> u$
        $not (q and p) -> not (s -> u)$
        ----
        $q$
        ```))))
][
    + #kdns(centered: false, ```
    a, (p and q) -> r, Ann.
    b, p, Ann.
    c, q, Ann.
    d, p and q, $and$-Einf., b&c
    e, r, "MP, q.e.d.", a&d
    ```)

        Die Konklusion konnte aus den Prämissen abgeleitet werden, daher ist der Schluss gültig.

    + #kdns(centered: false, ```
    a, not (p and q), Ann.
    b, p, Ann.
    c, not p or not q, DM, a
    d, not not p, $not$-Einf., b
    e, not q, "DS, q.e.d.", c&d
    ```)

    + #kdns(centered: false, ```
    a, s -> t, Ann.
    b, t -> u, Ann.
    c, not (q and p) -> not (s -> u), Ann.
    d, s -> u, KS, a&b
    e, (s -> u) -> (q and p), KP, c
    f, q and p, MP, d&e
    g, q, "$and$-Bes., q.e.d.", f
    ```)
]

#task[Kalkül des natürlichen Schließens II][
    Formalisieren Sie die folgenden Argumente und beweisen Sie sie mit dem Kalkül des natürlichen Schließens.
][
    + #normalform[
        Obwohl Robert ohne Fernseher lebt, kauft er sich am Kiosk das Fernsehprogramm.][
        Außerdem kauft er noch eine Packung Zigaretten.][
        Also kauft er sowohl eine Packung Zigaretten als auch das Fernsehprogramm.]

    + #normalform[
        Wenn ich mich nicht auf meine Arbeit konzentrieren kann, dann kann ich keinen guten Artikel für unsere Lokalzeitung schreiben.][
        Ohne absolute Ruhe im Haus kann ich mich nicht auf meine Arbeit konzentrieren.][
        Wenn absolute Ruhe herrscht, dann ist die Nachbarin Frau Meier verreist.][
        Frau Meier verreist dieses Jahr nicht, also kann ich keinen guten Artikel für unsere Lokalzeitung schreiben.]

    + #normalform[
        Wenn der Bluttest fehlerfrei durchgeführt wurde und das EKG zuverlässig ist, dann kann der Patient sicher diagnostiziert werden.][
        Der Patient konnte nicht sicher diagnostiziert werden und das EKG ist absolut zuverlässig.][
        Der Bluttest wurde nicht fehlerfrei durchgeführt.]
][
    + #[
        $p$: Robert lebt ohne Fernsehen. \
        $q$: Robert kauft sich am Kiosk das Fernsehprogramm. \
        $r$: Robert kauft sich eine Packung Zigaretten.

        ```inference
        $p and q$
        $r$
        ----
        $r and q$
        ```

        #kdns(centered: false, ```
        a, p and q, Ann.
        b, r, Ann.
        c, q, $and$-Bes., a
        d, r and q, "$and$-Einf., q.e.d.", b
        ```)
    ]

    + #[
        $p$: Ich kann mich auf meine Arbeit konzentrieren. \
        $q$: Ich kann einen guten Artikel für unsere Lokalzeitung schreiben. \
        $r$: Es ist absolute Ruhe im Haus. \
        $s$: Frau Meier ist verreist.

        ```inference
        $not p -> not q$
        $not r -> not p$
        $r -> s$
        ----
        $not s -> not q$
        ```

        #kdns(centered: false, ```
        a, not p -> not q, Ann.
        b, not r -> not p, Ann.
        c, r -> s, Ann.
        d, not s -> not r, KP, c
        e, not s -> not p, KS, b&d
        f, not s -> not q, "KS, q.e.d.", a&e
        ```)
    ]

    + #[
        $p$: Der Bluttest wurde fehlerfrei durchgeführt. \
        $q$: Das EKG ist zuverlässig. \
        $r$: Der Patient kann sicher diagnostiziert werden.

        ```inference
        $(p and q) -> r$
        $not r and q$
        ----
        $not p$
        ```

        #kdns(centered: false, ```
        a, (p and q) -> r, Ann.
        b, not r and q, Ann.
        c, not r, $and$-Bes., b
        d, not (p and q), MT, a&c
        e, not p or not q, DM, d
        f, q, $and$-Bes., b
        g, not not q, $not$-Einf., f
        h, not p, "DS, q.e.d.", e&g
        ```)
    ]
]

#task[Kalkül des natürlichen Schließens III][
    Formalisieren Sie die folgenden Argumente und beweisen Sie sie mit dem Kalkül des natürlichen Schließens.
][
    + #[Pferde fliegen genau dann, wenn Elefanten kein Klavier spielen. Elefanten spielen kein Klavier. Also sollte ich meine Tabletten nehmen, denn wenn Elefanten Klavier spielen oder Pferde fliegen, dann sollte ich meine Tabletten nehmen.]

    + #[
        #show regex("\b[KPQRS]\b"): it => $cal(it)$

        Kommissar K hat einen schwierigen Fall zu lösen. Er hat vier Verdächtige -- nennen wir sie P, Q, R und S. P spielt eine wichtige Rolle: Ist er unschuldig, dann ist auch Q außer Verdacht und die Schuld von R wäre unzweifelhaft. S ist die Schlüsselfigur. Ist S unschuldig, dann war Q einer der Täter; ist S schuldig, dann ist R es auch. Aber R hat ein todsicheres Alibi.

        Kommissar K glaubt, P und Q seien die schuldigen. Ist sein Schluss gültig?]
][
    + #[
        #normalform[
            Pferde fliegen genau dann, wenn Elefanten kein Klavier spielen.][
            Elefanten spielen kein Klavier.][
            Wenn Elefanten Klavier spielen oder Pferde fliegen, dann sollte ich meine Tabletten nehmen.][
            Ich sollte meine Tabletten nehmen.]

        $p$: Pferde fliegen. \
        $q$: Elefanten spielen Klavier. \
        $r$: Ich sollte meine Tabletten nehmen.

        ```inference
        $p <-> not q$
        $(q or p) -> r$
        $not q$
        ----
        $r$
        ```

        #kdns(centered: false, ```
        a, p <-> not q, Ann.
        b, (q or p) -> r, Ann.
        c, not q, Ann.
        d, (p -> not q) and (not q -> p), $<->$-Bes., a
        e, not q -> p, $and$-Bes., d
        f, p, MP, c&e
        g, p or q, $or$-Einf., f
        h, r, "MP, q.e.d.", b&g
        ```)
    ]

    + #[
        #show regex("\b[KPQRS]\b"): it => $cal(it)$

        #normalform[
            Ist P unschuldig, dann ist auch Q außer Verdacht und die Schuld von R wäre unzweifelhaft.][
            Ist S unschuldig, dann war Q einer der Täter.][
            Ist S schuldig, dann ist R es auch.][
            R hat ein todischeres Alibi.][
            P und Q sind schuldig.]

        $p$: P ist schuldig. \
        $q$: Q ist schuldig. \
        $r$: R ist schuldig. \
        $s$: S ist schuldig.

        ```inference
        $not p -> (not q or r)$
        $not s -> q$
        $s -> r$
        $not r$
        ----
        $p and q$
        ```

        #kdns(centered: false, ```
        a, not p -> (not q or r), Ann.
        b, not s -> q, Ann.
        c, s -> r, Ann.
        d, not r, Ann.
        e, not s, MT, c&d
        f, q, MP, b&e
        g, q and not r, $and$-Einf., d&f
        h, not (not q or r), DM, g
        i, not not p, MT, a&h
        j, p, $not$-Bes., i
        k, p and q, "$and$-Einf., q.e.d.", f&j
        ```)
    ]
]

#task(extra: true)[Gültigkeit und Ungültigkeit unterscheiden][
    Überprüfen Sie, ob der folgende Schluss gültig ist und beweisen Sie Ihre Antwort!
][
    ```inference
    $p or q$
    ----
    $p and q$
    ```
][
    Der Schluss ist ungültig. Das bedeutet, es gibt eine Bewertung, unter der die Prämisse $p or q$ wahr, aber die Konklusion $p and q$ falsch ist. Wenn $p$ wahr und $q$ falsch ist, dann ist $p or q$ wahr, aber $p and q$ falsch. Daher ist der Schluss üngültig. Das kann ebenfalls aus der folgenden Wahrheitstabelle entnommen werden (Z. 2 und 3):

    #truth-table("p | q", "p & q")

    Ungültigkeit mit dem Kalkül des natürlichen Schließens zu beweisen ist schwierig, denn es geht darum, dass Sie _nicht_ auf einen Widerspruch stoßen, wenn Sie das Gegenteil der Konklusion annehmen. Dafür müssen Sie aber erst zeigen, dass Ihnen dafür nicht eine Regel fehlt.
]

#task(extra: true)[Komisches Wirtschaftssystem][
    Beweisen Sie mit dem Kalkül des natürlichen Schließens, dass das folgende Argument gültig ist.
][
    Wenn der Transaktionsbedarf an Geld zurückgeht, werden, vorausgesetzt, dass keine Liquiditätsfalle vorliegt, die Wirtschaftssubjekte versuchen, ihre Portefeuilles zugunsten von Wertpapieren umzuschichten. Eine derartige Umschichtung führt zu höheren Wertpapierkursen und zu einem niedrigeren Marktzins. Ist die Zinselastizität der Investitionsnachfrage nicht zu gering, so bewirkt ein niedriger Marktzins eine erhöhte Nachfrage nach Investitionsgütern. Infolgedessen führt ein Absinken des nominellen Niveaus der Löhne und Preise zu einer Zunahme der Beschäftigung, falls die Zinselastizität der Investionsnachfrage nicht zu gering ist und überdies keine Liquiditätsfalle vorliegt. Denn erstens geht der Transaktionsbedarf an Geld zurück, wenn das nominelle Niveau der Löhne und Preise absinkt. Und zweitens induziert eine erhöhte Nachfrage nach Investitionsgütern mehr Beschäftigung.
][
    #normalform[
        Wenn der Transaktionsbedarf an Geld zurückgeht, werden, vorausgesetzt, dass keine Liquiditätsfalle vorliegt, die Wirtschaftssubjekte versuchen, ihre Portefeuilles zugunsten von Wertpapieren umzuschichten.][
        Eine derartige Umschichtung führt zu höheren Wertpapierkursen und zu einem niedrigeren Marktzins.][
        Ist die Zinselastizität der Investitionsnachfrage nicht zu gering, so bewirkt ein niedriger Marktzins eine erhöhte Nachfrage nach Investitionsgütern.][
        Erstens geht der Transaktionsbedarf an Geld zurück, wenn das nominelle Niveau der Löhne und Preise absinkt.][
        Und zweitens induziert eine erhöhte Nachfrage nach Investitionsgütern mehr Beschäftigung.][
        Infolgedessen führt ein Absinken des nominellen Niveaus der Löhne und Preise zu einer Zunahme der Beschäftigung, falls die Zinselastizität der Investitionsnachfrage nicht zu gering ist und überdies keine Liquiditätsfalle vorliegt.]

    $o$: Der Transaktionsbedarf an Geld geht zurück. \
    $p$: Es liegen Liquiditätsfalle vor. \
    $q$: Die Wirtschaftssubjekte versuchen, ihre Portefeuilles zugunsten von Wertpapieren umzuschichten. \
    $r$: Der Wertpapierkurs ist hoch. \
    $s$: Der Marktzins ist niedrig. \
    $t$: Die Zinselastizität der Investitionsnachfrage ist zu gering. \
    $u$: Die Nachfrage nach Investitionsgütern ist erhöht. \
    $v$: Das nominalle Niveau der Löhne und Preise sinkt. \
    $w$: Die Beschäftigung steigt.

    ```inference
    $o -> (not p -> q)$
    $q -> (r and s)$
    $not t -> (s -> u)$
    $v -> o$
    $u -> w$
    ----
    $v -> ((not t and not p) -> w)$
    ```

    #kdns(centered: false, ```
    a, o -> (not p -> q), Ann.
    b, q -> (r and s), Ann.
    c, not t -> (s -> u), Ann.
    d, v -> o, Ann.
    e, u -> w, Ann.
    f, v, ZA
    g, #h(1.5em) o, MP, d&f
    h, #h(1.5em) p -> q, MP, a&g
    i, #h(1.5em) not t and not p, ZA
    j, #h(1.5em) #h(1.5em) not t, $and$-Bes., i
    k, #h(1.5em) #h(1.5em) not p, $and$-Bes., i
    l, #h(1.5em) #h(1.5em) q, MP, h&k
    m, #h(1.5em) #h(1.5em) r and s, MP, b&l
    n, #h(1.5em) #h(1.5em) s, $and$-Bes., m
    o, #h(1.5em) #h(1.5em) s -> u, MP, c&j
    p, #h(1.5em) #h(1.5em) u, MP, n&o
    q, #h(1.5em) #h(1.5em) w, MP, e&p
    r, #h(1.5em) (not t and not p) -> w, $->$-Einf., i&q!i
    s, v -> ((not t and not p) -> w), "$->$-Einf., q.e.d.", f&r!f
    ```)
]