#import "/src/templates/exercise.typ": project, task, subtask, blockquote
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *
#import "/src/packages/kdns.typ": *
#import "/src/packages/symbols.typ": *

#show raw.where(lang: "inference"): inference-raw

#show: project.with(no: 5,
    date: datetime(year: 2024, month: 11, day: 20),
    show-solutions: true,
    show-hints: true)

#task[Aussagenlogische Formalisierung][
    Formalisieren Sie die folgenden Sätze:
][
    #set enum(numbering: "a)")
    + Wenn Kevin allein zu Hause ist, ist niemand bei ihm.
    + Wenn Peter oder Petra nicht nach Hause gehen, sind nicht beide zu Hause.
    + Weder Peter noch Petra sind zu Hause.
    + Nur wenn die Sonne aufgeht, wird es hell.
    + Peter liebt Petra nicht, gdw. Petra nicht Peter liebt.
][
    #set enum(numbering: "a)")
    + Wenn Kevin allein zu Hause ist, ist niemand bei ihm.

        $p$: Kevin ist allein zu Hause. \
        $q$: Jemand ist bei ihm.

        $p -> not q$

    + Wenn Peter oder Petra nicht nach Hause gehen, sind nicht beide zu Hause.

        $p_1$: Peter geht nach Hause. \
        $p_2$: Petra geht nach Hause. \
        $q_1$: Peter ist zu Hause. \
        $q_2$: Petra ist zu Hause.

        $(not p_1 or not p_2) -> not (q_1 and q_2)$

        #block(stroke: (left: (dash: "dotted")), inset: (x: 1em, y: 0.5em))[
            _Vorsicht:_ Es gibt einen Unterschied zwischen "Beide sind nicht zu Hause." und "Nicht beide sind zu Hause." Die folgende Formalisierung ist *problematisch bzw. falsch*:

            $p_1$: Peter geht nach Hause. \
            $p_2$: Petra geht nach Hause. \
            $q$: Beide sind zu Hause.

            $(not p_1 or not p_2) -> not q$

            Der Ausdruck "$not q$" steht für "Es ist nicht der Fall, dass beide zu Hause sind." also für "Beide sind nicht zu Hause." Das bedeutet, dass sowohl Peter als auch Petra nicht zu Hause sind. Wenn also z.B. nur Peter zu Hause wäre und Petra nicht, wäre der Satz _falsch_, denn einer von beiden ist da.

            Der Ausdruck "Nicht beide sind zu Hause." heißt aber, dass Peter und Petra nicht zusammen zu Hause sind. Wenn also z.B. nur Peter zu Hause wäre und Petra nicht, wäre der Satz _wahr_, denn nicht beide sind zu Hause, sondern nur einer von beiden.
        ]

    + Weder Peter noch Petra sind zu Hause.

        $p$: Peter ist zu Hause. \
        $q$: Petra ist zu Hause.

        $not p and not q$

    + Nur wenn die Sonne aufgeht, wird es hell.

        $p$: Die Sonne geht auf. \
        $q$: Es wird hell.

        $q -> p$ #h(1em) _oder_  #h(1em) $not p -> not q$

        #block(stroke: (left: (dash: "dotted")), inset: (x: 1em, y: 0.5em))[
            _Vorsicht:_ Das "nur" hat _nicht_ die gleiche Bedeutung wie ein "genau dann, wenn".

            "Nur wenn $p$, dann $q$." heißt, dass $q$ nur dann der Fall sein kann, wenn auch $p$ der Fall ist. Also kann $q$ nicht ohne $p$ auftreten, daher heißt es so viel wie: "Wenn nicht $p$, dann nicht $q$." bzw. als AL-Satz: "$not p -> not q$" Laut der Kontraposition ist das logisch äquivalent zu dem Ausdruck "$q -> p$".
        ]

    + Peter liebt Petra nicht, gdw. Petra nicht Peter liebt.

        $p$: Peter liebt Petra. \
        $q$: Petra liebt Peter.

        $not p <-> not q$
]

#task[Logische Wahrheit, Falschheit und Erfüllbarkeit][
    Entscheiden Sie, ob die folgenden Sätze erfüllbar, logisch wahr oder logisch falsch sind und beweisen Sie Ihre Antwort!
][
    + $not p -> (p -> q)$
    + $(p -> q) or (q -> p)$
    + $not (p -> q) and not p$
    + $p -> not ((p or q) and not q)$
][
    + Der Satz ist logisch wahr _und_ erfüllbar.

        #truth-table("-p > (p > q)", highlight-mode: "heads")

        Alle Zeilen sind wahr, damit ist er logisch wahr. Damit ist auch mindestens eine Zeile wahr, also ist er erfüllbar. #h(1fr) Q.E.D.

    + Der Satz ist logisch wahr _und_ erfüllbar.

        #truth-table("(p > q) | (q > p)", highlight-mode: "heads")

        Alle Zeilen sind wahr, damit ist er logisch wahr. Damit ist auch mindestens eine Zeile wahr, also ist er erfüllbar. #h(1fr) Q.E.D.

    + Der Satz ist logisch falsch.

        #truth-table("-(p > q) & -p", highlight-mode: "heads")

        In allen Zeilen ist der Satz falsch, damit ist er logisch falsch. #h(1fr) Q.E.D.

    + Der Satz ist erfüllbar.

        #truth-table("p > -((p | q) & -q)", highlight-mode: "heads")

        Es ist mindestens eine Zeile wahr (Z. 1, 3 und 4), also ist der Satz erfüllbar. Er ist nicht logisch wahr, da er in der zweiten Zeile falsch ist. #h(1fr) Q.E.D.
]

#task[Logische Folgerung][
    Prüfen Sie, ob es sich um logische Folgerung handelt!
][
    + $p and q -> r, r al.seq not p and not q$

    + $not p and q -> r, not r, q al.seq p$

    + $p and q, p -> r, q -> r al.seq r$
][
    Eine logische Folgerung besteht, gdw. der folgende Satz für alle Zeilen der Wahrheitstabelle gilt: Wenn die Prämissen wahr sind, dann ist es auch die Konklusion.

    + #truth-table("(p & q) > r", "r", "-p & -q", highlight-mode: "deduction")

        Die Prämissen sind zusammen in der ersten Zeile wahr, jedoch ist die Konklusion dort falsch. Demnach gilt der obige Satz nicht für alle Zeilen und es handelt sich nicht um logische Folgerung. #h(1fr) Q.E.D.

    + #truth-table("(-p & q) > r", "-r", "q", "p", highlight-mode: "deduction")

        Die Prämissen sind nur in der zweiten Zeile zusammen wahr, dort ist auch die Konklusion wahr, demnach gilt der obige Satz für alle Zeilen und es handelt sich um logische Folgerung. #h(1fr) Q.E.D.

    + #truth-table("p & q", "p > r", "q > r", "r", highlight-mode: "deduction")

        Die Prämissen sind nur in der zweiten Zeile zusammen wahr, dort ist auch die Konklusion wahr, demnach gilt der obige Satz für alle Zeilen und es handelt sich um logische Folgerung. #h(1fr) Q.E.D.
]

#task[Logische Äquivalenz][
    Prüfen Sie, ob es sich um logische Äquivalenz handelt!
][
    + $p and q al.eq not (not p or not q)$

    + $p -> q al.eq not p or q$

    + $not (p and q) al.eq not p and not q$
][
    Zwei AL-Ausdrücke sind logisch äquivalent, gdw. der folgende Satz für jede Zeile der Wahrheitstabelle wahr ist: Beide Sätze haben immer denselben Wahrheitswert.

    + #truth-table("p & q", "- (-p | -q)", highlight-mode: "equivalence")

        Da beide Sätze in jeder Zeile denselben Wahrheitswert haben, handelt es sich um logische Äquivalenz.

    + #truth-table("p > q", "- p | q", highlight-mode: "equivalence")

        Da beide Sätze in jeder Zeile denselben Wahrheitswert haben, handelt es sich um logische Äquivalenz.

    + #truth-table("- (p & q)", "-p & -q", highlight-mode: "equivalence")

        Da beide Sätze in der zweiten und dritten Zeile unterschiedliche Wahrheitswerte haben, handelt es sich nicht um logische Äquivalenz.
]

#task[Formalisierung und logische Folgerung][
    Formalisieren Sie die Schlüsse und prüfen Sie mit Hilfe der Wahrheitstafel, ob es sich um gültige Argumente handelt!
][

    + #inference-wl[
        Es ist nicht warm oder es ist Sommer.][
        Es ist warm.][
        Es ist Sommer.]

    + #inference-wl[
        Es regnet und es regnet nicht.][
        Ich esse einen Kuchen.]

    + #inference-wl[
        Manchmal arbeite ich und manchmal habe ich Spaß.][
        Wenn ich manchmal arbeite, muss ich Bücher lesen.][
        Wenn ich Bücher lesen muss, dann habe ich manchmal Spaß.][
        Wenn ich manchmal arbeite, dann habe ich manchmal Spaß.]
][
    Gültige Argumente sind solche, bei denen die Konklusion logisch aus den Prämissen folgt. Daher ist für jeden Schluss auf logische Folgerung zu prüfen.

    + $p$: Es ist warm. \
        $q$: Es ist Sommer.

        #inference-raw(```
        $not p or q$
        $p$
        ----
        $q$
        ```)

        #truth-table(highlight-mode: "deduction", "-p | q", "p", "q")

        Nur in der ersten Zeile sind die Prämissen zusammen wahr, dort ist auch die Konklusion wahr. Es handelt sich also um logische Folgerung. #h(1fr) Q.E.D.

    + $p$: Es regnet. \
        $q$: Ich esse Kuchen.

        #inference-raw(```
        $p and not p$
        ----
        $q$
        ```)

        #truth-table(highlight-mode: "deduction", "p & -p", "q")

        Logische Folgerung gilt genau dann, wenn der folgende Satz für jede Zeile der Wahrheitstabelle wahr ist: Wenn die Prämissen zusammen wahr sind, dann ist die Konklusion auch wahr.

        Die Definition wird nur falsch, wenn es mindestens eine Zeile gibt, in der die Prämissen wahr (Vorderglied von "Wenn die Prämissen zusammen wahr sind, dann ...") und die Konklusion falsch ist (Hinterglied von "..., dann ist die Konklusion auch wahr."). In keiner Zeile sind die Prämissen zusammen wahr, der Wenn-Dann-Satz ist demnach in jeder Zeile wahr und es handelt sich um logische Folgerung!

    + $p$: Manchmal arbeite ich. \
        $q$: Manchmal habe ich Spaß. \
        $r$: Ich muss Bücher lesen.

        #inference-raw(```
        $p and q$
        $p -> r$
        $r -> q$
        ----
        $p -> q$
        ```)

        #truth-table(highlight-mode: "deduction", "p & q", "p > r", "r > q", "p > q")

        Nur in der ersten Zeile sind hier alle Prämissen zusammen wahr. Dort ist auch die Konklusion wahr. Demenstprechend handelt es sich um logische Folgerung! #h(1fr) Q.E.D.
]

#task(extra: true)[Kalkül des natürlichen Schließens][
    Beweisen Sie mit Hilfe des Kalkül des natürlichen Schließens, dass der folgende Schluss gültig ist:
][
    #figure(align(left, inference-wl[
        $p -> not q$][
        $q or s$][
        $p$][
        $s$]))
][
    Zuerst übernimmt man alle Prämissen in das KdnS und kommentiert sie mit "Ann." bzw. "Annahme":

    #kdns(```
    a, p -> not q, Ann.
    b, q or s, Ann.
    c, p, Ann.
    d, not q, MP, a&c
    e, s, DS, b&d
    ```)

    Die Konklusion konnte aus den Prämissen abgeleitet werden, daher ist der Schluss deduktiv-gültig. #h(1fr) Q.E.D.
]

#task(extra: true)[Logische Folgerung][
    Erklären Sie begründet, ob der folgende Schluss ohne Prämissen gültig ist!
][
    #inference-wl[\ ][$p or not p$]
][
    Logische Folgerung gilt genau dann, wenn für alle Zeilen der Wahrheitstabelle gilt: Wenn die Prämissen wahr sind, dann ist es auch die Konklusion.

    Man kann hier auf zwei Arten argumentieren:

    + Weil die Prämissen nicht existieren, können sie auch nicht wahr werden. Daher gilt für jeden Satz, dass die Prämissen falsch sind, weshalb es sich um logische Folgerung handelt.

    + Weil die Prämissen nicht existieren, muss man nichts weiter annehmen, damit sie wahr sind. Damit ist der Schluss gültig, gdw. die Konklusion nicht falsch wird: Die Konklusion ist logisch wahr, daher handelt es sich um logische Folgerung.

    In beiden Fällen handelt es sich um logische Folgerung, damit ist der Schluss deduktiv-gültig. #h(1fr) Q.E.D.
]