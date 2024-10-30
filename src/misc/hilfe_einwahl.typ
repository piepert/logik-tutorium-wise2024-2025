#import "@preview/grape-suite:1.0.0": exercise, colors
#import colors: *

#show: exercise.project.with(
    title: [Hilfe zur Einschreibung in die Tutorien],

    university: "Universität Rostock",
    institute: "Institut für Philosophie",
    seminar: "Tutorium: Sprache, Logik, Argumentation"
)

#set text(lang: "de")
#let conf = read("hilfe_conf.csv").split("\n").map(e =>
    e.replace("\\,", "<COMMA>").split(",")
        .map(f => f.replace("<COMMA>", ",")))

#let vars = (:)
#let tutors = (:)
#let courses = ()
#let locations = (:)

#{
    for v in conf {
        if v.at(0) == "v" { // v-name, v-value
            vars.insert(v.at(1), eval(v.at(2)))

        } else if v.at(0) == "t" { // day,tutor,start-time,end-time,address,room
            courses.push((
                day: v.at(1),
                tutor: v.at(2),
                start-time: v.at(3),
                end-time: v.at(4),
                address: v.at(5),
                room: v.at(6),
            ))

        } else if v.at(0) == "e" { // name,email
            tutors.insert(v.at(1), v.at(2))

        } else if v.at(0) == "l" { // name,location
            locations.insert(v.at(1), v.at(2))
        }
    }
}

#let courses-on-day(day) = {
    return courses.filter(e => e.day == day)
        .map(e => ([#e.start-time -- #e.end-time Uhr], [#e.address, #e.room], [#e.tutor]))
}

= Hallo!

Herzlich willkommen in der Veranstaltung "Sprache, Logik, Argumentation"! Die Veranstaltung besteht aus einer Vorlesung und freiwilligen Tutorien. Die Tutorien werden durch Studierende höheren Semesters organisiert. In ihnen werden Fragen besprochen, Aufgaben geübt und Sie dabei unterstützt, sich in das neue Studienleben einzufinden. Hier sehen Sie eine Übersicht, wo welche Tutorien stattfinden und wie Sie sich anmelden.

Die *Tutorien beginnen ab dem #vars.erstes_tutorium.display("[day].[month].[year]")*, also erst in der zweiten Vorlesungswoche. Die *Anmeldung zu den Tutorien ist ab dem #vars.anmeldung_ab.display("[day].[month].[year], [hour]:[minute] Uhr")* möglich. Sollte es Probleme bei der Anmeldung geben, melden Sie sich bei entsprechenden Tutor*innen:

#list(..tutors.pairs().map(e => [#e.at(0) (#link("mailto:"+e.at(1)))]))

= Terminliste

#list(..locations.keys().map(e => [#e: #locations.at(e)]))

#show table: set par(justify: false)
#show table: set text(hyphenate: true)
#show table.cell.where(x: 0): strong
#show table.cell.where(x: 0): set text(fill: white)
#set table.hline(stroke: purple.lighten(25%))

#table(
    stroke: none,
    fill: (x, y) => if x == 0 {
        purple
    } else if x == 2 {
        purple.lighten(90%)
    },

    columns: (25%,)*4,

    table.cell(rowspan: courses-on-day("Mo").len())[Montag],
    ..courses-on-day("Mo").flatten(),
    table.hline(),

    table.cell(rowspan: courses-on-day("Di").len())[Dienstag],
    ..courses-on-day("Di").flatten(),
    table.hline(),

    table.cell(rowspan: courses-on-day("Mi").len())[Mittwoch],
    ..courses-on-day("Mi").flatten(),
    table.hline(),

    table.cell(rowspan: courses-on-day("Do").len())[Donnerstag],
    ..courses-on-day("Do").flatten(),
    table.hline(),

    table.cell(rowspan: courses-on-day("Fr").len())[Freitag],
    ..courses-on-day("Fr").flatten(),
)

#align(center, image("img/hilfe-tutorienkarte.png", height: 22.375%))

#pagebreak(weak: true)
= Hilfe zur Anmeldung

#show image: box.with(stroke: black)
#show grid: set par(justify: false)

#grid(columns: (1fr, 9cm),
    column-gutter: 0.5cm,
    row-gutter: 0.5cm,

    [*Schritt #counter("schritt").step()#context counter("schritt").display()/#context counter("schritt").final().first()*
        - Öffnen Sie #link("https://studip.uni-rostock.de").
        - Melden Sie sich mit Nutzerkürzel und Passwort an.
        - Klicken Sie in die obere Suchleiste.

    ], image(width: 100%, "img/hilfe-suche1.png"),
    [*Schritt #counter("schritt").step()#context counter("schritt").display()/#context counter("schritt").final().first()*
        - Suchen Sie nach "Tutorium: Sprache, Logik, Argumentation".
        - Wählen Sie die Veranstaltung aus.
        - Alternativ klicken Sie auf #link("https://studip.uni-rostock.de/dispatch.php/course/details?sem_id=004ba10aa8b8311a045fc3912efe51d7&again=yes", [diesen Link]), um zur Veranstaltung zu kommen.

    ], image(width: 100%, "img/hilfe-suche2.png"),
    [*Schritt #counter("schritt").step()#context counter("schritt").display()/#context counter("schritt").final().first()*
        - Melden Sie sich an der linken Seite zur Veranstaltung an.

    ], image(width: 100%, "img/hilfe-zugang-veranstaltung.png"),
    [*Schritt #counter("schritt").step()#context counter("schritt").display()/#context counter("schritt").final().first()*
        - Wählen Sie im oberen Reiter "Teilnehmende" aus.
        - Wählen Sie an der rechten Seitenleiste "Gruppen" aus.

    ], [#image(width: 100%, "img/hilfe-teilnehmende.png")\ #image(width: 100%, "img/hilfe-teilnehmende-gruppe-auswählen.png")],
    [*Schritt #counter("schritt").step()#context counter("schritt").display()/#context counter("schritt").final().first()*
        - Sobald am #vars.anmeldung_ab.display("[day].[month].[year], [hour]:[minute] Uhr") die Anmeldungen eingeschaltet werden, können Sie sich durch das Klicken auf das hintere Eintragen-Symbol in die Gruppe eintragen.
        - Sie können sich nur in *genau ein* Tutorium eintragen.
    ], image(width: 100%, "img/hilfe-gruppenanmeldung.png")
)