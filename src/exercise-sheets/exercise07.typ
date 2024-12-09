#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 7,
    date: datetime(year: 2023, month: 12, day: 4),
    show-solutions: true,
    show-hints: true)

#let lnk_bwsp_task1 = ```
a, p -> q, Ann.
b, (q or r) -> s, Ann.
c, p, ZA
d, #h(1.5em) q, MP, a&c
e, #h(1.5em) q or r, $or$-Einf., d
f, #h(1.5em) s, MP, b&e
g, p -> s, "$->$-Einf., q.e.d.", c&f!c
```
#let lnk_bwsp_task2 = ```
a, p -> (q -> r), Ann.
b, not ((p and q) -> r), ZA
c, #h(1.5em) (p and q) and not r, $->$-Ers., b
d, #h(1.5em) p and q, $and$-Bes., c
e, #h(1.5em) p, $and$-Bes., d
f, #h(1.5em) q, $and$-Bes., d
g, #h(1.5em) q -> r, MP, a&e
h, #h(1.5em) r, MP, f&g
i, #h(1.5em) not r, $and$-Bes., c
j, not not ((p and q) -> r), RAA, b&h&i!b
k, (p and q) -> r, "$not$-Bes., q.e.d.", j
```

#task[#smallcaps[Def.] Logische Wahrheit][
    Definieren Sie den Begriff der logischen Wahrheit!
][][
    Ein Satz $alpha$ heißt _logisch wahr_, gdw. sich allein aus der Definition der logischen Zeichen dieser Sätze ergibt, dass $alpha$ unter jeder Bewertung wahr ist.
]

#task[#smallcaps[Def.] Logische Folgerung][
    Definieren Sie den Begriff der logischen Folgerung!
][][
    Ein Satz $alpha$ _folgt logisch_ aus beliebig vielen Sätzen $beta_1$, ..., $beta_n$, gdw. sich allein aus der Definition der logischen Zeichen dieser Sätze ergibt, dass für jede Bewertung dieser Sätze gilt: Wenn $beta_1$, ..., $beta_n$ wahr sind, dann ist auch $alpha$ wahr.
]

#task[Linke Beweisspalte I][
    Erklären Sie, was die linke Beweisspalte im Kalkül des natürlichen Schließens ist und wozu sie benutzt wird. Erklären Sie den Unterschied zur rechten Beweisspalte. Woher kommen die Abhängigkeiten einer Zeile und wie wird man eine Abhängigkeit wieder los?
][][
    Die linke Beweisspalte ist die äußerst linke Spalte im Kalkül des natürlichen Schließens, links von der Zeilennummer, und gibt für jede Zeile an, von welchen Annahmen und Zusatzannahmen sie ursprünglich abgeleitet worden ist.

    Die rechte Beweisspalte enthält im Gegensatz zur linken Beweisspalte diejenigen Nummern anderer Zeilen, aus denen die Zeile abgeleitet wurde. Diese Zeilen müssen jedoch nicht immer die Annahmen sein, sondern können selbst auch Zwischenschritte sein. Daher unterscheiden sich die rechte und die linke Beweisspalte.

    Die Abhängigkeiten sind die Gesamtheit der Abhängigkeiten derjenigen Zeilen, aus denen sie abgeleitet wurden. Bei Annahmen und Zusatzannahmen ist die Abhängigkeit die Zeile selbst. Eine Abhängigkeit wird man nur dann los, wenn man die Annahme entweder mittels eines _Reductio ad absurdums_ ausschließen kann, oder die Zeile mithilfe einer _$->$-Einf._ konditionalisiert.
]

#task[Linke Beweisspalte II][
    Vervollständigen Sie die linke Beweisspalte für die folgenden Kalküle des natürlichen Schließens!
][
    + #kdns(centered: false,
        numbering: n => "#box(move(dy: 0em, line(length: 1.5cm))) #h(0.25cm) ("+str(n)+")",
        show_premises: false, lnk_bwsp_task1)

    + #kdns(centered: false,
        numbering: n => "#box(move(dy: 0em, line(length: 1.5cm))) #h(0.25cm) ("+str(n)+")",
        show_premises: false, lnk_bwsp_task2)
][
    + #kdns(centered: false, show_premises: true, lnk_bwsp_task1)

    + #kdns(centered: false, show_premises: true, lnk_bwsp_task2)
]

#task(key: "za-1")[Beweise mit Zusatzannahmen I][
    Beweisen Sie die folgenden Argumente mit dem Kalkül des natürlichen Schließens.
][
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], ```inference
        $(p or not q) -> r$
        ----
        $(p -> r)$
        ```, h(2em),

        [2.], ```inference
        $(p or q) -> r$
        $(r or s) -> t$
        ----
        $p -> t$
        ```, h(2em),

        [3.], ```inference
        $r or not r$
        ----
        $(p <-> q) -> (p -> q)$
        ```))))
][
    + #[
        #kdns(centered: false, show_premises: true, ```
        a, (p or not q) -> r, Ann.
        b, p, ZA
        c, #h(1.5em) p or not q, $or$-Einf., b
        d, #h(1.5em) r, MP, a&c
        e, p -> r, $->$-Einf., b&d!b
        ```)

        // #place(top + right, move(dx: -7.1cm, dy: 1.2cm, line(end: (0cm, 0.75cm))))
        // #place(top + right, move(dx: -7.1cm, dy: 3.5cm, line(end: (0cm, 0.75cm))))
    ]

    + #[
        #kdns(centered: false, show_premises: true, ```
        a, (p or q) -> r, Ann.
        b, (r or s) -> t, Ann.
        c, p, ZA
        d, #h(1.5em) p or q, $or$-Einf., c
        e, #h(1.5em) r, MP, a&d
        f, #h(1.5em) r or s, $or$-Einf., e
        g, #h(1.5em) t, MP, b&f
        h, p -> t, "$->$-Einf., q.e.d.", c&g!c
        ```)

        // #place(top + right, move(dx: -7.3cm, dy: 1.75cm, line(end: (0cm, 2cm))))
    ]

    + #[
        #kdns(centered: false, show_premises: true, ```
        a, r or not r, Ann.
        b, (p <-> q), ZA
        c, #h(1.5em) (p -> q) and (q -> p), $<->$-Bes., b
        d, #h(1.5em) (p -> q), $and$-Bes., c
        e, (p <-> q) -> (p -> q), "$->$-Einf., q.e.d.", b&d!b
        ```)

        In der letzten Zeile verschwindet die letzte Abhängigkeit. Das heißt, die Zeile ist von nichts abhängig! Damit ist die Wahrheit des Satzes nur aus den Regeln von AL ableitbar und damit logisch wahr.
        // #place(top + right, move(dx: -7.3cm, dy: 1.75cm, line(end: (0cm, 2cm))))
    ]
]

#task[Beweise mit Zusatzannahmen II][
    Formalisieren Sie die folgenden Argumente und beweisen Sie sie mit dem Kalkül des natürlichen Schließens.
][
    + #normalform[
        Wenn Sherlock Holmes Irene Adler küsst, dann existiert Sherlock Holmes.][
        Wenn Sherlock Holmes oder Irene Adler existieren, dann auch James Moriarty.][
        Wenn Sherlock Holmes existiert, existiert auch James Moriarty.]

    + #normalform[
        Ein Schmetterling schwingt seine Flügel nicht oder es weht ein raues Lüftchen.][
        Es weht kein raues Lüftchen oder es entsteht ein Tornado.][
        Wenn ein Schmetterling seine Flügel schwingt, entsteht ein Tornado.]

    // + #normalform[
    //     Sam ist ein Reptil oder ein Leguan.][
    //     Wenn Sam keine Eier legt, dann ist es nicht der Fall, dass Sam ein Reptil oder ein Leguan ist.][
    //     Ist Sam kein Reptil, legt Sam keine Eier.][
    //     Legt Sam Eier, ist Sam ein Leguan.][
    //     Sam ist ein Leguan genau dann, wenn Sam ein Reptil ist.]
][
    + #[
        $p$: Sherlock Holmes küsst Irene Adler. \
        $q$: Sherlock Holmes existiert. \
        $r$: Irene Adler existiert. \
        $s$: James Moriarty existiert.

        ```inference
        $p -> q$
        $(q or r) -> s$
        ----
        $p -> s$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, p -> q, Ann.
        b, (q or r) -> s, Ann.
        c, p, ZA
        d, #h(1.5em) q, MP, a&c
        e, #h(1.5em) q or r, $or$-Einf., d
        f, #h(1.5em) s, MP, b&e
        g, p -> s, "$->$-Einf., q.e.d.", c&f!c
        ```)
    ]

    + #[
        $p$: Ein Schmetterling schwingt seine Flügel. \
        $q$: Es weht ein raues Lüftchen. \
        $r$: Ein Tornado entsteht.

        ```inference
        $not p or q$
        $not q or r$
        ----
        $p -> q$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, not p or q, Ann.
        b, not q or r, Ann.
        b2, p, ZA
        c, #h(1.5em) not not p, $not$-Einf., b2
        d, #h(1.5em) q, DS, a&c
        e, #h(1.5em) not not q, $not$-Einf., d
        f, #h(1.5em) r, DS, b&e
        g, p -> r, "$->$-Einf., q.e.d.", b2&f!b2
        ```)
    ]

    // + #[ todo: Diese Aufgabe muss nochmal überarbeitet werden. Die $<->$-Einf. wurde falsch angewandt.

    //     $p$: Sam ist ein Reptil. \
    //     $q$: Sam ist ein Leguan. \
    //     $r$: Sam legt Eier.

    //     ```inference
    //     $q or p$
    //     $not r -> not (p or q)$
    //     $not p -> not r$
    //     $r -> q$
    //     ----
    //     $p <-> q$
    //     ```

    //     #kdns(centered: false, show_premises: true, ```
    //     a, q or p, Ann.
    //     b, not r -> not (p or q), Ann.
    //     c, not p -> not r, Ann.
    //     d, r -> q, Ann.
    //     e, p, ZA
    //     f, #h(1.5em) p or q, $or$-Einf., e
    //     g, #h(1.5em) not not (p or q), $not$-Einf., f
    //     h, #h(1.5em) not not r, MT, b&g
    //     i, #h(1.5em) r, $not$-Bes., d&h
    //     j, #h(1.5em) q, MP, d&i
    //     k, p -> q, $->$-Einf., e&j!e
    //     l, q, ZA
    //     m, #h(1.5em) q or p, $or$-Einf., l
    //     n, #h(1.5em) not not (q or p), $not$-Einf., m
    //     o, #h(1.5em) not not r, MT, b&n
    //     p, #h(1.5em) not not p, MT, c&o
    //     q, #h(1.5em) p, $not$-Bes., p
    //     r, q -> p, $->$-Einf., l&q!l
    //     s, (p -> q) and (q -> p), $and$-Einf., k&r
    //     t, p <-> q, "$<->$-Einf., q.e.d.", s
    //     ```)
    // ]
]

#task[Beweise mit Zusatzannahmen III][
    Formalisieren Sie die folgenden Argumente und beweisen Sie sie mit dem Kalkül des natürlichen Schließens.
][
    + Der Produzent muss, wenn der Film nicht floppt, ebenso wenig seinen Hut nehmen. Denn wenn der Film weder floppt noch ein Skandal wird, dann muss der Produzent auch nicht seinen Hut nehmen. Bleiben die Kassen leer, dann floppt der Film. Aus Erfahrung wissen wir aber, dass, wenn die Kassen nicht leer bleiben, der Film auch kein Skandal wird.

    + Es gibt zwei Möglichkeiten, wie Peter die Prüfung bestehen kann: er lernt stur auswendig oder er stellt einfach alle seine Fragen. Also besteht Peter die Prüfung, wenn er alle seine Fragen stellt, und er besteht die Prüfung, wenn er stur auswendig lernt.
][
    + #[
        #normalform[
            Wenn der Film weder floppt noch ein Skandal wird, dann muss der Produzent auch nicht seinen Hut nehmen.][
            Bleiben die Kassen leer, dann floppt der Film.][
            Aus Erfahrung wirssen wir aber, dass, wenn die Kassen nicht leer bleiben, der Film auch kein Skandal wird.][
            Der Produzent muss, wenn der Film nicht floppt, ebenso wenig seinen Hut nehmen.]

        $p$: Der Produzent muss seinen Hut nehmen. \
        $q$: Der Film floppt. \
        $r$: Der Film wird ein Skandal. \
        $s$: Die Kassen bleiben leer. \

        ```inference
        $(not q and not r) -> not p$
        $s -> q$
        $not s -> not r$
        ----
        $not q -> not p$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, (not q and not r) -> not p, Ann.
        b, s -> q, Ann.
        c, not s -> not r, Ann.
        d, not q, ZA
        f, #h(1.5em) not s, MT, b&d
        g, #h(1.5em) not r, MP, c&f
        h, #h(1.5em) not q and not r, $and$-Einf., d&g
        i, #h(1.5em) not p, MP, a&h
        j, not q -> not p, "$->$-Einf., q.e.d.", d&i!d
        ```)
    ]

    + #[
        #normalform[
            Wenn Peter stur auswendig lernt oder alle seine Fragen stelt, besteht er die Prüfung.][
            Peter besteht die Prüfung, wenn er alle seine Fragen stellt, und er besteht die Prüfung, wenn er stur auswendig lernt.]

        $p$: Peter stellt alle seine Fragen. \
        $q$: Peter lernt stur auswendig. \
        $r$: Peter besteht die Prüfung.

        ```inference
        $(p or q) -> r$
        ----
        $(p -> r) and (q -> r)$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, (p or q) -> r, Ann.
        b, p, ZA
        c, #h(1.5em) p or q, $or$-Einf., b
        d, #h(1.5em) r, MP, a&c
        e, p -> r, $->$-Einf., b&d!b
        f, q, ZA
        g, #h(1.5em) p or q, $or$-Einf., f
        h, #h(1.5em) r, MP, a&g
        i, q -> r, $->$-Einf., f&h!f
        j, (p -> r) and (q -> r), "$and$-Einf., q.e.d.", e&i
        ```)

        // #place(top + right, move(dx: -7.1cm, dy: 1.2cm, line(end: (0cm, 0.75cm))))
        // #place(top + right, move(dx: -7.1cm, dy: 3.5cm, line(end: (0cm, 0.75cm))))
    ]
]

#task(key: "raa-1")[Reductio ad absurdum I][
    Beweisen Sie die folgenden Argumente mit dem Kalkül des natürlichen Schließens durch einen indirekten Beweis.
][
    #align(center, block(align(left, grid(columns: 8,
        column-gutter: 0.5em,
        [1.], ```inference
        $p and q$
        ----
        $p -> q$
        ```, h(2em),

        [2.], ```inference
        $p -> q$
        $p -> r$
        ----
        $p -> (q -> r)$
        ```, h(2em),

        [3.], ```inference
        $not (p <-> r) and not r$
        ----
        $p$
        ```))))
][
    + #kdns(centered: false, show_premises: true, ```
    a, p and q, Ann.
    b, not (p -> q), ZA
    c, #h(1.5em) p and not q, $->$-Ers., b
    d, #h(1.5em) q, $and$-Bes., a
    e, #h(1.5em) not q, $and$-Bes., c
    f, not not (p -> q), RAA, b&d&e!b
    g, p -> q, "$not$-Bes., q.e.d.", f
    ```)

    + #kdns(centered: false, show_premises: true, ```
    a, p -> q, Ann.
    b, p -> r, Ann.
    c, p, ZA
    d, #h(1.5em) q, MP, a&c
    e, #h(1.5em) r, MP, b&c
    f, #h(1.5em) not (q -> r), ZA
    g, #h(1.5em) #h(1.5em) q and not r, $->$-Ers., f
    h, #h(1.5em) #h(1.5em) not r, $and$-Bes., g
    i, #h(1.5em) not not (q -> r), RAA, e&f&h!f
    j, #h(1.5em) q -> r, $not$-Bes., i
    k, p -> (q -> r), "$->$-Einf., q.e.d.", c&j!c
    ```)

    + #kdns(centered: false, show_premises: true, ```
    a, not (p <-> r) and not r, Ann.
    b, not (p <-> r), $and$-Bes., a
    c, not r, $and$-Bes., a
    d, not ((p -> r) and (r -> p)), $<->$-Best., b
    e, not (p -> r) or not (r -> p), DM, d
    f, not (r -> p), ZA
    g, #h(1.5em) r and not p, $->$-Ers., f
    h, #h(1.5em) r, $and$-Bes., g
    i, not not (r -> p), RAA, c&f&h!f
    j, not (p -> r), DS, e&i
    k, p and not r, $->$-Ers., j
    l, p, "$and$-Bes., q.e.d.", k
    ```)
]

#task[Reductio ad absurdum II][
    Formalisieren Sie die folgenden Argumente und beweisen Sie sie mit dem Kalkül des natürlichen Schließens durch einen indirekten Beweis.
][
    + #normalform[Es regnet und schneit.][
            Es regnet oder schneit.]

    + #normalform[
        Wenn St. Nikolaus durch die Nacht zieht, dann bekommt Peter, vorausgesetzt er war artig, Geschenke.][
        Peter bekommt Geschenke, wenn St. Nikolaus durch die Nacht zieht und Peter artig war.]

    + #normalform[
        Es ist wahr, dass es morgen regnet und der Hahn heute kräht, oder, dass es morgen regnet und der Hahn nicht kräht.][
        Morgen regnet es.]
][
    + #[
        $p$: Es regnet. \
        $q$: Es schneit.

        ```inference
        $p and q$
        ----
        $p or q$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, p and q, Ann.
        b, not (p or q), ZA
        c, #h(1.5em) not p and not q, DM, b
        d, #h(1.5em) p, $and$-Bes., a
        e, #h(1.5em) not p, $and$-Bes., c
        f, not not (p or q), RAA, b&d&e!b
        g, p or q, "$not$-Bes., q.e.d.", f
        ```)
    ]

    + #[
        $p$: St. Nikolaus zieht durch die Nacht. \
        $q$: Peter war artig. \
        $r$: Peter bekommt Geschenke.

        ```inference
        $p -> (q -> r)$
        ----
        $(p and q) -> r$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, p -> (q -> r), Ann.
        b, not ((p and q) -> r), ZA
        c, #h(1.5em) (p and q) and not r, $->$-Ers., b
        d, #h(1.5em) p and q, $and$-Bes., c
        e, #h(1.5em) p, $and$-Bes., d
        f, #h(1.5em) q, $and$-Bes., d
        g, #h(1.5em) q -> r, MP, a&e
        h, #h(1.5em) r, MP, f&g
        i, #h(1.5em) not r, $and$-Bes., c
        j, not not ((p and q) -> r), RAA, b&h&i!b
        k, (p and q) -> r, "$not$-Bes., q.e.d.", j
        ```)
    ]

    + #[
        $p$: Morgen regnet es. \
        $q$: Heute kräht der Hahn.

        ```inference
        $(p and q) or (p and not q)$
        ----
        $p$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, (p and q) or (p and not q), Ann.
        b, not p, ZA
        c, #h(1.5em) p and not q, ZA
        d, #h(1.5em) #h(1.5em) p, $and$-Bes., c
        e, #h(1.5em) not (p and not q), RAA, b&c&d!c
        f, #h(1.5em) p and q, DS, a&e
        g, #h(1.5em) p, $and$-Bes., f
        h, not not p, RAA, b&g!b
        i, p, "$not$-Bes., q.e.d.", h
        ```)
    ]
]

#task[Reductio ad absurdum III][
    Formalisieren Sie die folgenden Argumente und beweisen Sie sie mit dem Kalkül des natürlichen Schließens durch einen indirekten Beweis.
][
    + #[Morgen wird es wohl regnen. Das ist plausibel, denn ist es sowohl wahr, dass es morgen regnet oder heute der Hahn kräht, als auch, dass es morgen regnet oder heute nicht der Hahn kräht.]

    + #[Unmissverständlich geht die Sonne auf, wenn drei Passauer Pappe pressen. Denn wenn drei Passauer Pappe pressen, dann geht, sofern Sigismund Berta liebt, die Sonne auf. Es ist jedoch nicht der Fall, dass drei Passauer Pappe pressen genau dann, wenn  der linksgetiftelte Raftenzügler den Kauzriemen schmirgelt, denn wenn Sigismund nicht Berta liebt, dann schmirgelt der linksgetiftelte Raftenzügler den Kauzriemen auf keinen Fall.]

][
    + #[
        #normalform[
            Sowohl ist wahr, dass es morgen regnet oder heute der Hahn kräht, als auch, dass es morgen regnet oder heute der Hahn nicht kräht.][
            Morgen regnet es.]

        $p$: Morgen regnet es. \
        $q$: Heute kräht der Hahn.

        ```inference
        $(p or q) and (p or not q)$
        ----
        $p$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, (p or q) and (p or not q), Ann.
        b, p or q, $and$-Bes., a
        c, p or not q, $and$-Bes., a
        d, not p, ZA
        e, #h(1.5em) q, DS, b&d
        f, #h(1.5em) not q, DS, c&d
        g, not not p, RAA, d&e&f!d
        h, p, "$not$-Bes., q.e.d.", g
        ```)
    ]

    + #[
        #normalform[
            Wenn drei Passauer Pappe pressen, dann geht, wenn Sigismund Berta liebt, die Sonne auf.][
            Es ist nicht der Fall, dass drei Passauer Pappe pressen genau dann, wenn der linksgetiftelte Raftenzügler den Kauzriemen schmirgelt.][
            Wenn Sigismund Berta nicht liebt, dann schmirgelt der linksgetiftelte Raftenzügler den Kauzriemen auf keinen Fall.][
            Wenn drei Passauer Pappe pressen, dann geht die Sonne auf.]

        $q$: Sigismund liebt Berta. \
        $r$: Der linksgetiftelte Raftenzügler schmirgelt den Kauzriemen. \
        $s$: Drei Passauer pressen Pappe. \
        $t$: Die Sonne geht auf.

        ```inference
        $s -> (q -> t)$
        $not (s <-> r)$
        $not q -> r$
        ----
        $s -> t$
        ```

        #kdns(centered: false, show_premises: true, ```
        a, s -> (q -> t), Ann.
        b, not (s <-> t), Ann.
        c, not q -> r, Ann.
        d, not (s -> t), ZA
        e, #h(1.5em) s and not t, $->$-Ers., d
        f, #h(1.5em) s, $and$-Bes., e
        g, #h(1.5em) not t, $and$-Bes., e
        h, #h(1.5em) q -> t, MP, a&f
        i, #h(1.5em) not q, MT, g&h
        j, #h(1.5em) r, MP, c&i
        k, #h(1.5em) not ((s -> r) and (r -> s)), $<->$-Bes., b
        l, #h(1.5em) not (s -> r) or not (r -> s), DM, k
        m, #h(1.5em) not (s -> r), ZA
        n, #h(1.5em) #h(1.5em) s and not r, $->$-Ers., m
        o, #h(1.5em) #h(1.5em) not r, $and$-Bes., n
        p, #h(1.5em) not not (s -> r), RAA, j&m&o!m
        q, #h(1.5em) not (r -> s), DS, l&p
        r, #h(1.5em) r and not s, $->$-Ers., p
        s, #h(1.5em) not s, $and$-Bes., r
        t, not not (s -> t), RAA, f&s!d
        u, s -> t, "$not$-Bes., q.e.d.", t
        ```)
    ]
]

#task(extra: true)[Aussagenlogisches Rätsel][
    Wer sagt die Wahrheit, wer lügt und wie kommen Sie darauf?

    Erhöhte Schwierigkeit: Schaffen Sie es, ihre Lösung des Rätsels mit Hilfe des Kalkül des natürlichen Schließens zu beweisen?
][
    #show regex("\b[ABC]\b"): it => $cal(it)$

    Im Land der Lügner gibt es zwei Arten von Menschen: Lügner, die nur falsche Sätze äußern und Wahrsager, die nur wahre Sätze äußern. Auf ihrer Reise durch dieses Land begegnen Sie drei Einheimischen A, B und C.

    A sagt: "Wenn ich ein Wahrsager bin, dann ist B ein Lügner."\
    B sagt: "Ich bin genau dann ein Wahrsager, wenn C einer ist."

    Wer lügt und wer sagt die Wahrheit?
][
    #show regex("\b[ABC]\b"): it => $cal(it)$

    *Metasprachlicher Lösungsvorschlag:*
    1. A meint, dass, wenn A die Wahrheit sagt, B lügt.

    2. Angenommen A lügt.

    3. _Aus [1., 2.]:_ Dann ist es nicht der Fall, dass, wenn A ein Wahrsager ist, B ein Lügner ist.

    4. _Aus [3.]:_ Diese Aussage ist nur falsch, wenn A die Wahrheit sagt und B nicht lügt. Einmal soll A also die Wahrheit sagen, einmal soll A lügen. Daher war die Annahme, das A lügt, falsch.

    5. _Aus [4.]:_ A muss die Wahrheit sagen.

    6. _Aus [1., 5.]:_ Wenn A die Wahrheit sagt, dann muss B lügen. Da A die Wahrheits sagt, lügt B.

    7. B behauptet, dass B und C entweder zusammen lügen oder die Wahrheit sagen.

    8. _Aus [6., 7.]:_ Da B lügt, machen beide nicht die gleichen sondern unterschiedliche Dinge: C muss also nicht wie B ein Lügner sein, sondern die Wahrheit sagen.

    9. _Aus [5., 6., 8.]:_ A und C sind Wahrsager, B ist ein Lügner. #h(1fr) QED

    *Lösungsvorschlag per Kalkül des natürlichen Schließens:* Aus dem metasprachlichen Beweis kann man jetzt einen güligen Schluss machen, der dann nur noch mit dem Kalkül des natürlichen Schließens bewiesen werden muss. (Weitere Erklärungen, wie man auf die Prämissen kommt, ist in den Hinweisen zu dieser Aufgabe gegeben.)

    $p$: A sagt die Wahrheit. \
    $q$: B sagt die Wahrheit. \
    $r$: C sagt die Wahrheit.

    ```inference
    $p <-> (p -> not q)$
    $q <-> (q <-> r)$
    ----
    $p and not q and r$
    ```

    Beweis:

    #kdns(centered: false, show_premises: true, ```
    a, p <-> (p -> not q), P
    b, q <-> (q <-> r), P
    c, not p, ZA
    d, #h(1.5em) (p -> (p -> not q)) and ((p -> not q) -> p), $<->$-Bes., a
    e, #h(1.5em) (p -> not q) -> p, $and$-Bes., d
    // f, not p -> not (p -> not q), KP, d&a
    g, #h(1.5em) not (p -> not q), MT, e&c
    h, #h(1.5em) p and not not q, $->$-Ers., g
    i, #h(1.5em) "p", $and$-Bes., h
    j0, not not p, RAA, c&i!c
    j, p, $not$-Bes., j0
    k, p -> (p -> not q), $and$-Bes., d
    l, p -> not q, MP, j&k
    m, not q, MP, j&l
    n, (q -> (q <-> r)) and ((q <-> r) -> q), $<->$-Bes., b
    o, (q <-> r) -> q, $and$-Bes., n
    // p, not q -> not (q <-> r), KP, o
    q, not (q <-> r), MT, o&m
    r, not (q -> r and r -> q), $<->$-Bes., q
    s, not (q -> r) or not (r -> q), DM, r
    t, (q and not r) or (r and not q), $->$-Ers., s
    u, q and not r, ZA
    v, #h(1.5em) q, $and$-Bes., u
    w, "not (q and not r)", RAA, m&u&v!u
    x, r and not q, DS, w&t
    y, p and not q and r, $and$-Einf., j&x
    ```)

    Damit gilt: A und C sind Wahrsager, B ist ein Lügner. #h(1fr) QED

    Die Schritte im Kalkül sind die gleichen wie die, des metasprachlichen Lösungsvorschlags. Diese Aufgabe ist eine gute Übung zum Lernen der Umformungsregeln, allein im Kalkül wird man jedoch wahrscheinlich nicht auf die richtige Lösung kommen, dazu ist es zu abstrakt.
]