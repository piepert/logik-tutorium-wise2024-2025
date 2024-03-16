#import "/src/templates/colors.typ": *

#let goal-list = (
    // Grundlagen
    definieren-logik: ["Logik" definieren],
    wissen-phil-argumente: [wissen, was philosophische Argumente sind],
    erkennen-phil-argumente: [philosophische Argumente erkennen],
    definieren-argument: ["Argument" definieren],
    definieren-gültigkeit: [Gültigkeit definieren],
    definieren-schlüssigkeit: [Schlüssigkeit definieren],
    kennen-aufbau-beweis: [kennen den formalen Aufbau eines Beweises],
    beweise-metasprache: [durch metasprachliche Begründung einfache Beweise über deduktiv-gültige Argumente führen],
    identifizieren-aussagesätze: [Aussagesätze unter anderen Sätzen identifizieren],
    definieren-logische-folgerung: ["logische Folgerung" definieren],

    // AL
    identifizieren-al-strukturen: [aussagenlogische Strukturen der deutschen Sprache identifizieren],
    identifizieren-hinr-notw-bed: [notwendige und hinreichende Bedingungen im Wenn-Dann-Satz identifizieren],
    entwickeln-gefühl-al-syntax: [ein Gefühl für die Struktur und Bildungsregeln von AL entwickeln],
    erkennen-suchen-schemata: [Schemata suchen und erkennen],
    bilden-ausdrücke-schemata: [Schemata zur Bildung neuer Ausdrücke benutzen],
    identifizieren-junktoren: [Junktoren in der natürlichen Sprache erkennen],
    formalisieren-al: [Sätze der natürlichen Sprache aussagenlogisch formalisieren],
    formalisieren-wd-gdw-nur: ["nur" und "genau dann, wenn" adäquat formalisieren],
    bilden-notw-hinr-äquivalenz: [Äquivalenzumformulierungen für notwendige und hinreichende Bedingungen identifizieren und bilden],
    erkennen-wahrheitsbedingungen: [Wahrheitsbedingungen von Sätzen erkennen], // weiß nicht mehr, wie das gemeint ist
    definieren-semantik-junktoren: [die Semantik der Junktoren definieren],

    // Wahrheitstabelle
    darstellen-junktoren-wahrheitstabelle: [die semantische Definition der Junktoren in der Wahrheitstabelle darstellen],
    auswerten-ausdrücke-wahrheitstabelle: [Ausdrücke mit der Wahrheitstabelle auswerten],
    beweisen-logische-wahrheit: [logische Wahrheit und Falschheit in der Wahrheitstabelle beweisen],
    beweisen-logische-folgerung: [logische Folgerung in der Wahrheitstabelle bweisen],
    beweisen-logische-äquivalenz: [logische Äquivalenz in der Wahrheitstabelle bweisen],
    korrekte-beweisform: [schreiben für jeden Beweis QED und einen Antwortsatz],

    // KdnS
    aufbauen-kdns: [KdnS korrekt aufbauen können],
    verstehen-direkte-regeln: [verstehen das Muster der direkten Regelanwendung],
    beweise-kdns-einfach: [einfache bis mittelkomplexe direkte Beweise führen],
    wissen-raa-verfahren: [wissen, dass man für RAA standardmäßig das Gegenteil der Konklusion annimmt],
    bilden-linke-beweisspalte: [die linke Beweisspalte bilden],
    beweisen-mittels-raa: [Beweis mittels RAA durchführen],
    erkennen-konditionalisierung: [erkennen, wann $->$-Einf. gefordert ist],
    prüfen-abhängigkeiten: [wissen, dass sie beim Einführen einer ZA die Abhängigkeiten der Zeilen prüfen müssen],
    beweisen-verzweigt: [verzweigen Beweis durchführen],

    // PL
    wissen-unterschied-al-pl: [verstehen den Unterschied zwischen der reinen Satzlogik AL und der u.a. Begriffslogik PL],
    formalisieren-pl-unquantifiziert: [einfache prädikatenlogische unquantifizierte Sachverhalte formalisieren],
    formalisieren-pl-quantifiziert: [einfache prädikatenlogische quantifizierte Sachverhalte formalisieren],
    umrechnen-quantoren: [Quantoren ineinander umrechnen],
    benennen-begriffe-log-quad: [die Begriffe des logischen Quadrats nennen],
    finden-beispiele-log-quad: [eigene Beispiele für das logische Quadrat finden],

    // PL KdnS
    variablen-spezialisieren: [quantifizierte Ausdrücke spezialisieren und die spezialisierten Variablen korrekt ersetzen],
    konstanten-generalisieren: [Ausdrücke, die Konstanten beinhalten, generalisieren und die Konstanten korrekt binden],
    kennen-einschränkung-allq-einf: [kennen die Einschränkungen der $forall$-Einf. und beachten sie bei der Ableitung],
    kennen-einschränkung-exq-bes: [kennen die Einschränkungden der $exists$-Bes. und beachten sie bei der Ableitung],
)

#let set-all-goals() = state("sequence-goals").update((
    current-key: "Z",

    goals: (
        "LG": (
            "definieren-logik",
            "wissen-phil-argumente",
            "erkennen-phil-argumente",
            "identifizieren-aussagesätze",
            "definieren-argument",
            "definieren-gültigkeit",
            "definieren-schlüssigkeit",
            "kennen-aufbau-beweis",
            "beweise-metasprache",
            "definieren-logische-folgerung",
        ),

        "AL": (
            "identifizieren-al-strukturen",
            "identifizieren-hinr-notw-bed",
            "entwickeln-gefühl-al-syntax",
            "erkennen-suchen-schemata",
            "bilden-ausdrücke-schemata",
            "identifizieren-junktoren",
            "formalisieren-al",
            "formalisieren-wd-gdw-nur",
            "bilden-notw-hinr-äquivalenz",
            "erkennen-wahrheitsbedingungen",
            "definieren-semantik-junktoren",
        ),

        "WT": (
            "darstellen-junktoren-wahrheitstabelle",
            "auswerten-ausdrücke-wahrheitstabelle",
            "beweisen-logische-wahrheit",
            "beweisen-logische-folgerung",
            "beweisen-logische-äquivalenz",
            "korrekte-beweisform",
        ),

        "KS": (
            "aufbauen-kdns",
            "verstehen-direkte-regeln",
            "beweise-kdns-einfach",
            "wissen-raa-verfahren",
            "bilden-linke-beweisspalte",
            "beweisen-mittels-raa",
            "erkennen-konditionalisierung",
            "prüfen-abhängigkeiten",
            "beweisen-verzweigt",
        ),

        // PL
        "PL": (
            "wissen-unterschied-al-pl",
            "formalisieren-pl-unquantifiziert",
            "formalisieren-pl-quantifiziert",
            "umrechnen-quantoren",
            "benennen-begriffe-log-quad",
            "finden-beispiele-log-quad",
        ),

        // PL KdnS
        "PK": (
            "variablen-spezialisieren",
            "konstanten-generalisieren",
            "kennen-einschränkung-allq-einf",
            "kennen-einschränkung-exq-bes",
        ),
    )
))

#let get-goal(key, loc) = {
    let s = state("sequence-goals").final(loc)

    if s == none {
        return none
    }

    let zero-padding = str(calc.max(..s.goals
        .values()
        .map(e => e.len())
        .flatten())
    ).len()

    for k in s.goals.keys() {
        if key in s.goals.at(k) {
            let num = s.goals.at(k).position(e => e == key)+1
            num = ("0" * (zero-padding - str(num).len())) + str(num)

            return (
                k + str(num),
                goal-list.at(key)
            )
        }
    }

    return none
}

#let set-sequence-goals-key(key) = state("sequence-goals").update(k => {
    k.current-key = key
    k
})

#let get-all-goals(loc) = {
    let list = ()

    for k in goal-list.keys() {
        list.push(k)
    }

    return list.map(e => {
        let goal = get-goal(e, loc)

        if goal != none {
            goal.at(0)
        }
    })
}

#let format-goal-key(..keys) = text(fill: purple,
    math.equation(block: true, $mat(delim: "[",
        #block(width: 0.5cm,
            align(center,
                text(font: "Atkinson Hyperlegible",
                    size: 0.6em,
                    strong(keys.pos().join([\ ])))
            )
        )
    )$))

#let print-goals-for-sequence() = locate(loc => { style(sty => {
    let s = state("sequence-goals").at(loc)

    if s == none {
        return none
    }

    let goals = ()
    let max-goal-size = calc.max(..get-all-goals(loc).map(e => measure(format-goal-key(e)+[,], sty).width))

    for key in s.goals.at(s.current-key) {

        let goal = get-goal(key, loc)

        let goal-key = if goal != none {
            goal.at(0)
        } else {
            return text(fill: red, strong("\""+key+"\" NOT FOUND"))
        }

        goals.push(format-goal-key(goal-key))
        goals.push(goal.at(1))
    }

    grid(columns: (max-goal-size, 1fr),
            column-gutter: 0.5em,
            row-gutter: 1.5em,

            ..goals)
})})

#let ref-goals(body) = {
    show ref: it => {
        let key = str(it.target)

        if key in goal-list {
            locate(loc => { style(s => {
                let max-goal-size = calc.max(..get-all-goals(loc).map(e => measure(format-goal-key(e+[,]), s).width))

                let goal = get-goal(key, loc)

                let goal-key = if goal != none {
                    goal.at(0)
                } else {
                    return text(fill: red, strong("\""+key+"\" NOT FOUND"))
                }

                if it.supplement == none or it.supplement == auto {
                    goal-key

                } else {
                    grid(columns: (max-goal-size, 1fr),
                        column-gutter: 1em,
                        row-gutter: 1em,

                        format-goal-key(goal-key),
                        it.supplement)
                }
            })})

        } else {
            it
        }
    }

    body
}

#let multi-goal-ref(body, ..goals) = locate(loc => { style(s => {
    let list = ()
    let max-goal-size = calc.max(..get-all-goals(loc).map(e => measure(format-goal-key(e+[,]), s).width))

    for key in goals.pos() {
        if key in goal-list {
            let goal = get-goal(key, loc)

            let goal-key = if goal != none {
                goal.at(0)
            } else {
                return text(fill: red, strong("\""+key+"\" NOT FOUND"))
            }

            list.push(goal-key)
        }
    }

    grid(columns: (max-goal-size, 1fr),
        column-gutter: 1em,
        row-gutter: 1em,

        format-goal-key(..list),
        body)
})})