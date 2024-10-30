#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *

#show: slides.with(
    no: 1,
    title: [Organisatorisches und Einführung in die Logik],
    date: datetime(
        year: 2024,
        month: 10,
        day: 23
    )
)

#slide[
    = Sie/Ihr und Ich

    + Siezen vs. duzen?
    + Namenskärtchen
    + Stellen Sie sich bitte kurz vor, beantworten Sie Folgendes (sofern Sie dazu bereit sind):
        - Wie heißen Sie?
        - Was machen Sie in ihrer Freizeit?
        - Wenn Sie in einem fiktiven Universum leben müssten, in welchem?
]

#slide[
    == Ihre Erwartungen an mich

    #task(time: [EA, 5 min.])[
        Notieren Sie als Wort oder kurzen Stichpunkt vorne am Whiteboard, was Sie von einem erfolgreichen Logik-Tutorium und einem guten Logik-Tutor erwarten!
    ]
]

#slide[
    == Meine Erwartungen an Sie
    - aktive Mitarbeit und Ergreifen von Initiative
    - Nachbereiten der Sitzungen mit Hinsicht auf Ihre Probleme mit dem Stoff
    - Offenheit gegenüber Problemen mit ...
        - ... der Organisation des Tutoriums
        - ... dem Umfang des Tutoriums
        - ... den Themen des Tutoriums
        - ... der Lernatmosphäre im Tutorium
        - ... mir als Tutor
        - ... Ihren fachlichen Schwächen und Lücken
]

#focus-slide[
    Hinweise für gutes Gelingen:
]

#focus-slide[
    \1. Benutzen Sie mind. 1-2h pro Woche um modulspezifische Aufgaben zu bearbeiten und Ihre fachlichen Schwächen auszubessern sowie die Inhalte zu festigen. _Nehmen Sie die Angebote wahr, die Ihnen gemacht werden._
]

#focus-slide[
    \2. Teilen Sie Ihre Zeit ein. Sie müssen nicht stundenlang am Stück an Aufgaben sitzen. Sie müssen auch nicht _alle_ Angebote wahrnehmen.
]

#focus-slide[
    \3. Kontaktieren Sie mich und Ihre Kommiliton*innen bei Fragen. Senden Sie mir und Ihren Kommilitionen Ihre Lösungen zu und holen Sie sich (gegenseitig) Feedback!
]

#focus-slide[
    \4. Vernetzen Sie sich!\ Das Studium ist kein Alleingang!
]

#slide[
    == Was ich Ihnen bieten möchte
    + Folien (ohne Lösungsvorschläge)
    + Aufgabenblätter (mit Lösungsvorschlägen)
    + Kontrolle und Feedback für alles, was Sie mir im Rahmen der Veranstaltung zukommen lassen
    + Beantwortung von Fragen per Mail oder in/nach dem Tutorium
    + Ende Dezember/Anfang Januar eine zusätzliche Probeklausur etwa auf dem Niveau der tatsächlichen Klausur
    + Spaß und ein lockeres Miteinander im Tutorium
    + #link("https://evasys.uni-rostock.de/evasys/online.php?p=tplt2324")[die Möglichkeit, das Tutorium mitzugestalten]
]

#slide[
    == Wiederholungsthemen
    Sie entscheiden, was wir im Tutorium behandeln! Sie können *bis Samstag Abend 23:59 Uhr* der jeweiligen Woche Themen einreichen:
    -  #link("https://evasys.uni-rostock.de/evasys/online.php?p=tplt2324")

    Dann fange ich an, das Tutorium zu planen.
]

/*
#slide[
    = Die Medien des Tutoriums und ihre Nutzen
    // + *der Ablaufplan* -- für die Vorbereitung

    + *das Logik-Skript und die Vorlesungsfolien*: Definitionen, Erklärungen, Beispiele

    + *die Wiederholungsserien des Tutoriums*: Übungsaufgaben zur Evaluation

    + *Ablaufplan des Tutoriums*: Vorbereitung und Orientierung im Semester

    // + *die Lernevaluationen* (LEVs) -- für Reflexion des Selbststudiums
]
*/

#focus-slide[
    Nun eine kurze Demonstration, wo Sie alles auf StudIP & Co. finden.
]

#goal-slide(goals: ("definieren-grundkonzepte",))[
    + ... die Verwendung von Logik motivieren.
    + ... gültige von ungültigen und schlüssige von unschlüssigen Argumenten unterscheiden.
]

// Problematisierung 1
#slide[
    == Flugzeugentführung im Urlaubsparadies

    #set text(size: 0.85em)
    Sie sind Mitglied der berühmten Detektei "Lösung auf Wunsch". An einem ruhigen Tag, dem 20. Juni, sitzen Sie mit Ihren Kolleg*innen im Büro, als ein Polizeikommissar Ihre Detektei betritt. Ein Flugzeug wurde entführt und die Polizei ist nach mehreren Wochen der Ermittlung immer noch ratlos. Sie bekommen von der Polizei den Auftrag, mit den bereits gesammelten Informationen den Fall zu lösen!

    #task(time: [GA, 20 min.])[
        Entlarven Sie anhand der gesammelten Informationen der Polizei den Flugzeugentführer des Fluges 123, indem Sie die Sätze, die keine Aussagesätze sind, aussortieren und mit den restlichen den Täter bestimmen!
    ]
]

// Problematisierung 2
#slide[
    == Gute und schlechte Argumente
    #set text(size: 0.85em)

    #example[
        / Alice: ChatGPT ist ziemlich aktuell und bietet Probleme. Wir sollten prüfen, ob und wie man ChatGPT im universitären Umfeld richtig einsetzen kann.

        / Bob: Nein, sollten wir nicht. Denn wenn alle Studierenden ChatGPT benutzen sollen, dann gibt es doch gar keine Eigenleistung mehr.
    ]

    /*
        Bob unterstellt Alice, dass aus ihrem Vorschlag resultieren würde, alle sollen ChatGPT benutzen. Das Argument geht also:

        - Wenn alle Studierenden ChatGPT benutzen sollen, gibt es gar keine Eigenleistung mehr.
        - (Vorwruf gegen Alice:) Alle Studierenden sollen CahtGPT benutzen.
        - Also: Es gibt keine Eigenleistung mehr.

    */

    #task(time: [EA, 5 min.])[
        Beurteilen Sie Bobs Antwort auf Alices Vorschlag.
    ]
]

// von Logicals zu Philosophie übergehen ...

// Vorher gemeinsam erarbeiten! Philosophische Beispiel-Argumente mitbringen und daraus dieses Merkmal erarbeiten! Vorwissen aus der Vorlesung darf gerne mit eingebracht werden!
#slide[
    == Philosophische Argumente

    #definition[
        Ein *Argument* ist eine Ansammlung von Aussagesätzen, von denen behauptet wird, dass die einen (die #unbreak[_Annahmen_] bzw. #unbreak[_Prämissen_]) einen anderen (die #unbreak[_Konklusion_]) in der Art stützen würden, dass es rational wäre, anzunehmen, die Konklusion wäre wahr, wenn man annimmt, dass die Prämissen wahr sind.
    ]
]

/*
#slide[
    #set text(size: 0.95em)
    #hint[
        Argumente stellen Begründungszusammenhänge dar. Die #unbreak[*Annahmen*] sollen eine gemeinsame Wissensgrundlage sein, auf die sich der Philosoph beruft, die #unbreak[*Konklusion*] das Ergebnis, was sich aus dieser Grundlage ergeben soll.
    ]

    #hint[
        Die *Annahmen* werden getrennt über den Strich geschrieben, die Konklusion darunter. Ein Beispiel folgt.
    ]
]
*/

#slide[
    #set text(size: 0.875em)
    #example[
        / Alice: ChatGPT ist ziemlich aktuell und bietet Probleme. Wir sollten prüfen, ob und wie man ChatGPT im universitären Umfeld richtig einsetzen kann.
    ]
    #only(2, example(inference-raw(```
    ChatGPT bietet aktuelle Problematiken.
    Man sollte sich mit allem, was aktuelle Problematiken bietet, auseinandersetzen.
    ----
    Also sollte man sich mit ChatGPT auseiandersetzen.
    ```)))
]

#slide[
    #set text(size: 0.9em)
    #example[
        / Alice: ChatGPT ist ziemlich aktuell und bietet Probleme. Wir sollten prüfen, ob und wie man ChatGPT im universitären Umfeld richtig einsetzen kann.

        / Bob: Nein, sollten wir nicht! Denn wenn alle Studierenden ChatGPT benutzen sollen, gibt es doch gar keine Eigenleistung mehr!
    ]

    #task(time: [EA, 5 min.])[
        Stellen Sie für Bobs Argument die Annahmen und die Konklusion heraus!
    ]

    /*
        siehe Kommentar oben für Antwort
    */
]

#slide[
    == Logische Gütekriterien
    #set text(size: 0.95em)
    // Gütekriterien gemeinsam erarbeiten, in Gruppen
    // -> mehrere Argumente mitbringen, ungültige, gültige und schlüssige
    // am Ende sollen Sie eigene Gütekriterien entwickeln, diese vergleichen wir mit Gültigkeit und Schlüssigkeit
    #task(time: [GA, 15 min.])[
        Diskutieren Sie in Gruppen jeweils, in welche der Kategorien die folgenden Schlüsse fallen!
        + ungültig
        + induktiv-gültig
        + deduktiv-gültig
        + schlüssig

        Ordnen Sie anschließend Bobs Argument in eine der Kategorien ein!
    ]
]

#slide[
    #set text(size: 0.75em)

    // #grid(columns: 2,
    //     column-gutter: 0.5em,
    //     row-gutter: 0.25em,

    #show: columns.with(2)
    #enum(tight: false, spacing: 2.5em,

        // induktiv-gültig
        inference-raw(```
        Bisher hat sich Einsteins Relativitätstheorie immer bestätigt.
        ----
        Einsteins Relativitätstheorie ist wahrscheinlich korrekt.
        ```),

        // ungültig
        inference-raw(```
        Wenn Bond einen Fallschirm hat, überlebt er den Absturz.
        Bond hat keinen Fallschirm.
        ----
        Bond überlebt den Absturz nicht.
        ```),

        // deduktiv-gültig
        inference-raw(```
        Alle Fahrräder benötigen Benzin.
        Alle Pferde sind Fahrräder.
        ----
        Alle Pferde benötigen Benzin.
        ```),

        // deduktiv-gültig
        inference-raw(```
        Gott ist das perfekteste Wesen.
        Ein existierendes Wesen ist perfekter als ein nicht-existierendes Wesen.
        ----
        Gott existiert.
        ```),

        // schlüssig
        inference-raw(```
        Wenn es regnet, wird die Straße nass.
        Manchmal regnet es.
        ----
        Manchmal wird die Straße nass.
        ```),

        // deduktiv-gültig
        inference-raw(```
        Wenn Bond den Absturz überlebt, hatte er einen Fallschirm.
        Bond hatte keinen Fallschirm.
        ----
        Bond überlebt den Absturz nicht.
        ```),
    )
]

#slide[
    = Zusammenfassung

    #task(time: [GA, 5 min.])[
        Erstellen Sie eine Übersicht, in der Sie die folgenden Kategorien schematisch darstellen:

        #([ungültig], [gültig], [deduktiv gültig], [induktiv gültig], [schlüssig]).join[ --- ]
    ]
]

#slide[
    = Zusammenfassung

    #task(time: [EA, 5 min.])[
        Diskutieren Sie über eine Einordnung der beiden folgenden Schlüsse in Ihre Übersicht!
    ]

    #grid(columns: 2, column-gutter: 1cm, [1. #inference-raw(```
    Alle Wale sind Fische.
    Alle Delfine sind Wale.
    ----
    Alle Delfine sind Fische.
    ```)], [2. #inference-raw(```
    Alle Wale sind Säugetiere.
    Alle Delfine sind Wale.
    ----
    Alle Delfine sind Säugetiere.
    ```)])
]

#slide[
    #definition[
        In allen folgenden Tutorien wird unter *Gültigkeit* die *deduktive Gültigkeit* verstanden.

        Ein Argument ist gültig, sofern man behaupten kann, dass wenn die Prämissen wahr sind, die Konklusion überhaupt nicht falsch sein kann. Sonst ist es nicht gültig.
    ]
]

#slide[
    #task(time: [5 min.])[
        Beziehen Sie Stellung zur folgenden Aussage:

        "Was hat denn logische Gültigkeit und Schlüssigkeit von Argumenten mit Philosophie zu tun? Wie soll ich damit eine Antwort auf den Sinn des Lebens finden? Das ist doch total irrelevant!"
    ]
]