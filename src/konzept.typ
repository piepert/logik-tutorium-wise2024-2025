#import "@preview/grape-suite:1.0.0": seminar-paper, german-dates
#import "/src/packages/goals.typ": *

#import "/src/templates/exercise.typ": *
#import "/src/templates/slides.typ": *
#import "/src/packages/inference.typ": *

#set text(lang: "de")
#show: seminar-paper.project.with(
    university: "Universität Rostock",
    faculty: "Philosophische Fakultät",
    institute: "Institut für Philosophie",
    seminar: "Tutorium: Sprache, Logik, Argumentation",
    docent: none,

    submit-to: v(-2em),
    submit-by: v(-2em),

    author: "Tristan Pieper",
    email: "tristan.pieper@uni-rostock.de",
    address: none,

    semester: german-dates.semester(datetime.today()),

    title: [Konzept für das Logik-Tutorium am Institut für Philosophie der Universität Rostock],
    show-outline: true,

    /*
    abstract: [
        Das Logik-Tutorium bildet für die Studierenden als eine Veranstaltung im ersten Semester die Möglichkeit, eine neue Lernumgebung kennenzulernen sowie sich in das selbstgesteuerte Lernen einzufinden. Es darf keine eintönige Lehrveranstaltung sein, sondern soll soziale Kontakte und Aktivität fördern. Ein einheitliches didaktisches, visuelles und inhaltiches Konzept soll den Einstieg in die Logik und das Studium der Universität Rostock erleichtern. Gleichzeitig soll es die Kompetenzen und Inhalte des Moduls "Sprache, Logik, Argumentation" erfassen und den Studierenden einen Raum geben, sich diese anzueignen.
    ],
    */

    footer: [],

    header-left: context {
        if here().page() <= 2 {
            return none
        }

        if calc.rem(counter(page).at(here()).first(), 2) == 1 {
            let l-heads = query(selector(heading.where(level: 2)).before(here()))

            if l-heads.len() > 0 {
                numbering(heading.numbering, ..counter(heading).at(l-heads.last().location()))
                [ ]
                l-heads.last().body
            }
        } else {
            counter(page).display()
        }
    },

    header-right: context {
        if here().page() <= 2 {
            return none
        }

        show: align.with(right)

        if calc.rem(counter(page).at(here()).first(), 2) == 0 {
            let l-heads = query(selector(heading.where(level: 1)).before(here()))

            if l-heads.len() > 0 {
                numbering(heading.numbering, ..counter(heading).at(l-heads.last().location()))
                [ ]
                l-heads.last().body
            }
        } else {
            if here().page() == 3 {
                [1]
            } else {
                counter(page).display()
            }
        }
    },

    page-margins: (inside: 3.5cm, outside: 3cm, top: 3.5cm, bottom: 3cm),
    show-declaration-of-independent-work: false,
)

#show heading.where(level: 1): it => pagebreak(weak: true) + it

= Didaktisches Konzept

== Grundlegung

Das erste Semester versetzt die Studierenden in ein grundlegend neues Lernumfeld. In der Schule besteht für die SuS Schulpflicht, die Lehrer nehmen eine substantielle Rolle für den Lernerfolg der SuS ein, sie sind Hauptverantwortliche für die Planung und Durchführung guten Unterrichts. Die SuS sind zur Anwesenheit und zum Ablegen eines Abschlusses verpflichtet, die Lehrer zur Unterstützung, Motivation und Intervention. Die Lehrkraft muss Wissen vermitteln und Möglichkeiten für Sicherung und Transfer ermöglichen.

Im Gegensatz dazu ist die Universität eine freiwillige und elitäre Bildungsanstalt, die den Studierenden ein Lernangebot macht. In den meisten Veranstaltungen herrscht keine Anwesenheitspflicht. Die Dozierenden bieten fakultative und punktuelle Aufarbeitungen von Themen an, in der Art und Weise, wie sie bereit sind, Ressourcen dafür zu investieren. Dies reicht von didaktisch durchgeplanten Einheiten und Sitzungen, bis hin zu spontan entstehenden Seminaren, die reinen Überblickscharakter haben. Dozierstile variieren stark. Es gibt für die Dozierenden keine Verpflichtung, Sicherung und Transfer der Phasen -- oder Kompetenzgenerierung überhaupt -- zu gewährleisten. Die Studierenden sind in der Rolle, die Angebote zu ergreifen, die sie als sinnvoll erachten, und sich weiterführendes Material, Lektüre und generell Hilfe an sich selbständig zu suchen. Für gute Lehrveranstaltungen und ihren Lernerfolg sind die Studierenden selbst verantwortlich. Die Studierenden sind dabei nicht auf sich allein gestellt. Neben den Dozierenden, die den Lernprozess unterstützen können, sollen vorallem Kommilitonen sich gegenseitig absichern. Studieren ist kein Alleingang.

Um diesen Übergang von der Schule ins Studium zu erleichtern, sollten die ersten Lehrveranstaltungen so konzipiert sein, dass sie den Studierenden diese Selbstverantwortlichkeit zeigen und sie in den Modus zu bringen, aktiv, vorbereitend und nachbereitend an den Lehrveranstaltungen teilzunehmen. Kommilitonen sollen sich untereinander vernetzen, Arbeit teilen, sich gegenseitig Hilfe liefern und unereinander sozialisieren.

Daher verfolgt das Logik-Tutorium fünf Ziele:

+ *das methodische Ziel:* Das Tutorium soll die Studierenden in das methodisch-selbstgesteuerte Lernen einführen.

+ *das soziale Ziel:* Das Tutorium die Studierenden untereinander zu vernetzen.

+ *das inhaltliche Ziel:* Die Inhalte des Tutorium sollen mindestens die klausurrelevanten Inhalte erfassen.

+ *das Forderungs- und Förderungsziel:* Das Tutorium soll Studierende, die Probleme mit Logik haben, unterstützen und Studierende, denen Logik leicht fällt, fordern. Zusätzlich sollen die Studierenden Möglichkeiten haben, zu ihrem Leistungsstand beurteilt zu werden.

+ *das situative Ziel:* Die Studierenden fühlen sich mit der Lehrkraft wohl, haben keine Angst, Fragen untereinander auszutauschen und im Plenum oder individuell zu äußern, haben Spaß an der Arbeit miteinander und an den Themen des Tutoriums und fühlen sich generell in der Situation des Tutoriums wohl, gut aufgehoben und gut betreut.

== Logisches Kompetenzmodell

Aus den fünf Zielen des Tutoriums sind die im Tutorium zu generierenden Kompetenzen der Studierenden ableitbar.

+ *Methodenkompetenz* beschreibt die Fähigkeit, die fachlichen Methoden des Logik-Moduls korrekt anwenden zu können. Dazu gehört das direkte und indirekte metasprachliche Beweisen und das direkte und indirekte Beweisen mit dem Ableitungskalkül des natürlichen Schließens, das Feststellen logischer Folgerung, Äquivalenz, Wahrheit und Falschheit mit der Wahrheitstabelle und die Formalisierung von Aussagesätzen mit der Aussagen- und Prädikatenlogik.

+ *Sachkompetenz* beschreibt die Fähigkeit, die Inhalte des Logik-Moduls korrekt wiedergeben, einordnen und abwägen zu können. Darunter fallen typische Definitionen -- wie die des Arguments, der deduktiven Gültigkeit, die der Schlüssigkeit -- aber auch die richtige Bestimmung von Aussagesätzen, hinreichenden und notwendigen Bedingungen und die korrekte Vervollständigung des logischen Quadrats.

+ *Selbstkompetenz* beschreibt die Fähigkeit, das eigene Lernverhalten reflektieren und anpassen zu können.

+ *Sozialkompetenz* beschreibt die Fähigkeit, das eigene Sozialverhalten auf andere anpassen und reflektieren, sowie alleine und in Gruppen arbeiten zu können.

Um die Ziele des Tutoriums umzusetzen, ist eine systematische Förderung dieser Kompetenzen angebracht. Für das Bestehen der Klausur ist besonders die logische Methodenkompetenz und Sachkompetenz relevant, für das erfolgreiche Abschließen des Studiums aber auch die Sozial- und Selbstkompetenz. Die Studierenden sollen sich nicht nur fachliche Fertigkeiten aneigenen, sondern sich auch als eine Studierendenschaft verstehen lernen und Freunde und Lerngruppen unter ihren Kommilitonen finden und ihr eigenes Lernverhalten optimieren können.

== Methoden und Sozialformen

In Anbetracht der Ziele gilt es, die Methoden und Sozialformen des Tutoriums so zu wählen, dass die gesetzten Ziele erreicht werden. Als grundlegendes Paradigma gilt es, eine Vielfalt an verschiedenen Methoden und Sozialformen anzuwenden. Dazu gilt eine Einschränkung: Der Frontalunterricht, indem ein Dozent die Inhalte als Lehrervortrag vermittelt, ist mit sehr viel bedacht anzuwenden.

+ Der *Frontalunterricht fördert den Bystander-Effekt*: Die Studierenden lehnen sich in der neuen Situation zurück und aufgrund fehlenden Verantwortlichkeitsgefühls wird auf Nachfragen und Aktivitätsaufforderungen nur bedingt eingegangen.

+ Der *Frontalunterricht fördert passiv-schulisches Lernverhalten*: Die Studierenden werden an den Frontalunterricht in der Schule erinnert, in dem die Verantwortlichkeit bei der Lehrkraft lag. Dadurch fehlt die aktive Auseinandersetzung mit den Problemen, es wird eine Erwartungshaltung aufgebaut, in dem die Dozierenden die Inhalte den Studierenden präsentieren sollten, statt dass sie diese selbst erarbeiten.

+ Der *Frontalunterricht erschwert das Erreichen des sozialen Ziels*: Da Studierenden im Frontalunterricht passiv die präsentierten Inhalte aufnehmen, kommt es nicht zu einer Interaktion untereinander. Im Gegenteil sogar: Interaktionen untereinander sind -- sofern nicht explizit gefordert -- im Frontalunterricht nicht erwünscht. Damit fällt es schwer, das soziale Ziel bei einer Überaktzentuierung des Frontalunterrichts umzusetzen.

Statt des Frontalunterrichts sollen Methoden gewählt werden, die verschiedene Sozialformen durchlaufen: etwa das Gruppenpuzzle ermöglicht es den Studierenden sich zuerst in Einzelarbeit Expertenwissen anzueignen, dieses in zwei Phasen als Gruppenarbeit untereinander zu präsentieren und zu besprechen und zuletzt im Plenum zu vergleichen.

Die zufällige Aufteilung von Gruppen schafft die Möglichkeit, dass Studierende sich untereinander kennenlernen können und ein Gemeinschaftsgefühl in der Veranstaltung entsteht. Gleichzeitig sollten aber auch Möglichkeiten geboten werden, dass die Studierenden sich in eine Gruppe begeben können, in der sie sein wollen. Die Studierenden müssen erkennen, dass sie die Lehrveranstaltung mitgestalten können. Eine rein zufällige Aufteilung von Gruppen kann dabei hinderlich sein.

Die Studierenden sollen sowohl Möglichkeiten bekommen, selbständig an Problemen zu arbeiten, sich in Kleingruppen zu äußern, aber auch den Tutor als Moderator, Vermittler und berichtigende Instanz in Großgruppengesprächen nutzen zu können.

Folgende Methoden sollen im Logik-Tutorium angewandt werden:

- *Aufgaben erstellen* \
    In einem Gruppenpuzzle wird die Einzelarbeitsphase überprungen, von den Expertengruppen eine Aufgabe zum aktuellen Thema der Sitzung gestaltet. In den Stammgruppen werden die Aufgaben untereinander ausgetauscht, bearbeitet und verglichen. Im Plenum findet eine kurze Reflexion statt.

- *Gruppenbefragung* \
    Die Studierenden schreiben zuerst in Einzelarbeit je eine Frage auf, die sie inhaltich gerade beschäftigt. Danach werden die Studierenden in Gruppen aufgeteilt. Aus den Fragen werden so viele ausgelost, dass jede Gruppe eine Frage hat. Es folgt eine Bearbeitungszeit, in der die Gruppen versuchen eine ausführliche Antwort auf ihre Frage zu finden. Je nach Schnelligkeit können die Gruppen neue Fragen bekommen. Am Ende werden die Ergebnisse im Plenum in einem Vortrag diskutiert. Im Vortrag sollen

    + das Problem und wie es interpretiert wurde,
    + die Herangehensweise zur Problemlösung und
    + die Antwort

    enthalten sein. Dabei ist zu beachten, dass es zu Missverständnissen der Frage kommen kann und diese nicht beantwortet wird.

- *Gruppenpuzzle* \
    Die Studierenden werden in Gruppen eingeteilt, die Stammgruppen heißen. Jeder Teilnehmer jeder Stammgruppe wählt ein zu erarbeitendes Thema so, dass in jeder Stammgruppe jedes Thema mindestens einmal vorkommt. Alle Studierenden eines Themas werden die Experten dieses Themas. Alle Experten treffen sich mit gleichartigen Experten in Expertengruppen. Dort wird zuerst in Einzelarbeit das Thema erarbeitet, danach vergleichen die Experten untereinander ihre Ergebnisse, ergänzen und bessern sie aus. Die Stamgruppen finden sich darauf wieder zusammen, jeder Experte stellt sein eigenes Thema vor. Im Plenum werden am Ende offen gebliebene Fragen aufgegriffen und geklärt.

- *KAWA* \
    Die Dozierenden schreiben die Buchstaben eines Begriffes untereinander, die Studierenden finden wichtige Begriffe aus der aktuellen Sitzung, die mit dem Anfangsbuchstaben beginnen, wie bei einem Akrostichon.

- *Quiz* \
    Es wird ein Quiz mit Fragen zum Inhalt der Sitzung vorbereitet und von den Studierenden absolviert.

- *Spickzettel erstellen* \
    Ein inhaltliches Thema wird kurz und übersichtlich auf einem Zettel festgehalten.

- *Schlussdiskussion* \
    Kurze Reflexion der Stunde, in der alle Teilnehmenden kurz in je einem Satz erläutern, was sie gelernt haben und was sie in Zukunft verbessern/lernen/nacharbeiten möchten.

== Medien

Die wichtigsten Medien des Tutoriums sind

+ die Folien des Tutoriums,
+ die fakultativen Aufgabenblätter des Tutoriums,
+ das Skript der Vorlesung#footnote[Das Skript wird zitiert mit "Skript p. 94 / S. 181." Die Abkürzung "p." meint die PDF-Seite, also "$x$ / 115" und "S." steht für die Buchseiten ab p. 16 steht.] und
+ die fakultativen Lernevaluationen des Tutoriums.

Die Medien sind so zu gestalten, dass sie möglichst vielseitig sind und jeder Inhalt des Tutoriums durch verschiedene Medien gestützt ist. Die Studierenden sind individuell und vielfältig, sie benötigen verschiedene Lernwege, daher sind nicht nur abwechslungsreiche Methoden und Sozialformen, sondern auch abwechslungsreiche Medien einzusetzen.

Die Studierenden sollen dazu angehalten werden, sich verschiedene Medien zu Nutze zu machen und selbständig Medien zu erschaffen, etwa in Form von Lernübersichten, Plakaten oder Vorlesungsmitschriften. Dazu sollen diese aktiv mit in das Tutorium einbezogen werden. Das ist auf verschiedenen Weisen möglich. Kommilitonen können sich untereinander Vorlesungsmitschriften präsentieren oder sie Grundlage für Gruppenarbeiten oder ähnlichem werden lassen. Als Ergebnis von Erarbeitungs- oder Sicherungsphasen können Lernübersichten oder Plakate dienen, wobei diese direkt den Mehrwert haben, zur Klausurvorbereitung verwendet werden zu können.

== Formale Struktur

Die Struktur des Tutoriums soll transparent und gut geplant sein, jedoch auch so flexibel, dass die Studierenden ihre eigenen Probleme, Fragen und Interessen mit einbringen können. Dieser Grundsatz soll das situative Ziel des Tutoriums unterstützen, indem die Studierenden die Möglichkeit haben das Tutorium mitzugestalten. Außerdem soll es das methodische Ziel unterstützen, indem die Studierenden Eigenverantwortlichkeit für die Art und Weise ihres Lernprozesses übernehmen.

=== Sequenzstruktur

Die Gestaltung der einzelnen Sequenzen des Logik-Tutoriums nimmt die abzudeckenden Inhalte (siehe @inhalte) und bricht diese in grobe Sequenzen auf. Jede Sequenz besteht aus mindestens einer Sitzung, beginnt mit einer Inhaltsübersicht und endet mit einer fakultativen Lernevaluation (LEVs), das in Form eines Testats außerhalb des Tutoriums stattfindet. Dies kann nach Absprache in Präsenz vor bzw. nach dem Tutorium stattfinden oder asynchron online. Dabei ist darauf zu achten, dass Reservesitzungen eingeplant sind, um die Möglichkeit abzudecken, dass die Studierenden langsamer sind, als erwartet, oder das Tutorium mit von ihnen gewünschten Inhalten füllen können.

Der Ablauf einer Sequenz kann wie folgt zusammengefasst werden:

+ *Vorstellung der Sequenz:* Die Studierenden kennen den groben Ablauf der Sequenz und wissen, welche Fähigkeiten sie am Ende der Sequenz beherrschen sollen.

+ *Durchführung der Sequenz:* Die Studierenden generieren die geplanten Kompetenzen.

+ *Evaluation der Sequenz:* Die Studierenden haben die Möglichkeit, zu prüfen, ob sie die Ziele, die durch die Sequenz vorgegeben wurden, erreicht haben.

Die LEVs in Form eines Testats kann um eine fakultative Beurteilung durch die Tutoriumsleitung ergänzt werden. Durch individuelles Feedback zu den erdachten Lösungen erhalten die Studierenden die Möglichkeit, ihre Fähigkeiten besser einschätzen zu lassen und auf Fehler aufmerksam zu werden, die sie selbst übersehen haben. Eine andere Möglichkeit wäre, die Studierenden untereinander Feedback geben zu lassen und somit das soziale Ziel in den Fokus zu rücken. Dies kann jedoch auch als eine der Stellen im Tutorium verwendet werden, in denen die Tutoriumsleitung aktiv umfangreiches Feedback anbietet.

=== Sitzungsstruktur

Die von der aktuellen Sequenz bestimmten Inhalte werden in einzelne Sitzungen verteilt. Jede Sitzung wird eingeleitet und enthält einen klaren Abschluss. Der Aufbau einer Sitzung ist an das PEST-Modell angelehnt:

+ *Problematisierung:* Das Problem der Sitzung wird motiviert und konkretisiert. Den Studierenden wird klar, _was_ sie lernen müssen, _warum_ es relevant ist und _wie_ es in den Kontext der Lehrveranstaltung einzuordnen ist.

+ *Erarbeitung:* Die Studierenden entwickeln eine Lösung des Problems bzw. Ansätze für eine Lösung.

+ *Sicherung:* Die Ergebnisse der Erarbeitung werden verglichen, korrigiert und verfeinert. Die Studierenden haben hier die Möglichkeit, eigene Fehler zu erkennen und ihr Ergebnis zu konkretisieren.

+ *Transfer:* Das gesicherte Ergebnis wird auf ein Beispiel angewendet, in dem das in der ersten Phase charakterisierte Problem auftritt. Die Studierenden erkennen, dass das Problem gelöst wurde.

Dazu kommen eine Einleitungs- und Abschlussphase.

In der Einleitungsphase wird den Studierenden die Möglichkeit gegeben, Themen in den Raum zu werfen, die sie in künftigen Sitzungen wiederholen wollen, organisatorische Fragen zu stellen oder sonstige Hinweise zu geben. Darauf folgt eine Wiederholung der Themen der letzten Sitzung inklusive einer einfachen aber klausur-gerechten Transferaufgabe zu dieser Sitzung. Im Anschluss beginnt die oben dargestellte Unterrichtsstruktur des PEST-Modells.

Nach Beendigung der Transferphase folgt erneut die Möglichkeit für die Studierenden Fragen zu stellen oder Anmerkungen zu machen, dann ein thematischer Ausblick und eine Reflexion der Sitzung. Die Reflexion wird in Studierendenhand gegeben. Alle Studierenden (inklusive der Tutoriumsleitung) sollen je die folgenden Fragen beantworten:

+ Was nehmen Sie aus dieser Sitzung mit?
+ Woran wollen Sie in Zukunft arbeiten?

Daraufhin wird die Sitzung geschlossen.

== Inhaltliche Struktur

Eine grundlegende Frage ist: Wie sind die Inhalte der Logik zu vermitteln? Das eröffnet den Aspekt, wie die Tutorumsleitung dafür sorgen kann, den Lernprozess möglichst gut zu gestalten.

=== Motivation, Problemorientierung und Zielorientierung

Zur Aufrechterhaltung des intensiven, langfristigen auseinandersetzens mit einem Lerngebiet, ist Motivation nötig. Das bedeutet, dass die Inhalte nicht einfach "vorgesetzt" werden dürfen. Es lernt sich besser, wenn der _Sinn_ des Inhaltes den Lernenden bekannt ist. Diese Motivation kann durch eine Problemorientierung aufgebaut und durch eine Zielorientierung beibehalten werden.

Statt den Studierenden vorzusetzen, was ein gültiger Schluss ist und wie er auszusehen hat, könnte man etwa mit einem Szenario starten, in dem zwei Argumente gebracht werden. Die Studierenden sollen bewerten, welches "besser" ist. Das ungültige, vielleicht ein Autoritätsargument, sagt gar nichts über die Richtigkeit der Konklusion aus und ist somit "schlechter" als das Gültige. Die Notwendigkeit zur Bewertung von Argumenten ist damit motiviert. Durch mehrere Vergleiche und aufeinander bauende Stufen, in denen die Studierenden sich die einzelnen Kriterien selbst erarbeiten und sich ihnen bewusst werden, ist der innere Drang, die aufgeworfenen Hürden und Probleme zu lösen, viel höher, als beim Vorgeben von Definitionen. Eine Motivierung durch Probleme ist damit vorteilhaft.

Eine reine Aneinanderreihung von Problemen und Beispielen kann jedoch trotzdem Orientierungslosigkeit hervorrufen, die Frage kommt auf, wo man denn eigentlich hin wolle. Die Lösung: eine Zielorientierung. Der Lernprozess (z.B. eine Sequenz und einzelne Sitzung) wird gestartet, indem man den Studierenden aufzeigt, was sie am Ende können sollen. Auch dies kann über ein Problem geschehen: die Lösung des Problems kann ein Ziel des Lernens sein. Weiterhin können Zusammenfassungen zwischendurch und am Ende helfen, den Überblick zu behalten. *Den Studierenden muss ihr eigener Fortschritt bewusst werden.* Sie dürfen nicht orientierungslos durch das Tutorium laufen.

=== Strukturierung des Begriffserwerbs

Die Strukturierung anhand von Problemen ist eine Möglichkeit zur feineren Planung konkreter Lernsituationen. Eine Möglichkeit für den groben Ablauf der Themen wäre die Strukturierung nach fester inhaltlicher Abschnitte, die ihre Themen erschöpfend behandeln, z.B.:

+ Logische Grundlagen
+ Aussagenlogik
+ Prädikatenlogik

Jedoch bietet es sich an, Themen nicht direkt erschöpfend zu handeln, um Überforderung vorzubeugen. Das lässt sich an einem Beispiel zeigen: Das Konditional und das Bikonditional bieten viele Gesprächsthemen. Zum Einen ist die Semantik der materiellen Implikation nicht immer alltagsnahe. Zum anderen sind notwendige und hinreichende Bedinungen, Formulierungen mit "nur" und logisch-äquivalente Formulierungsvarianten, sowie das Gesetz der Kontraposition, sehr viel auf einmal, was behandelt wird, besonders für Logik-Einsteiger. Beide haben signifikante Bedeutung für die Argumentation, besonders wenn es um ihre tautologischen Varianten (logische Folgerung und logische Äquivalenz) geht.

Mit Bezug auf die Problemorientierung kann hier nicht immer davon ausgegangen werden, dass ein passender Übergang vom einen zum anderen möglich ist. Die alternative: eher einander nähere Themen hintereinander behandeln, statt eine direkte fachliche Gliederung. Dieselben Bereiche können mehrmals behandelt werden, dies schafft Wiederholung und Festigung, dann können sie vertieft und erweitert werden.

== Aufgabenstellungen

Ähnlich der Standardisierung der Operatoren gibt es für das Tutorium nur eine begrenzte Auswahl an möglichen Aufgabenstellungen, die jeweils ein gewisses Ziel verfolgt, d.i. meist das Fördern einer bestimmten Fertigkeit. Dementsprechend müssen die Aufgabenstellungen sich ebenfalls an Inhalten von @inhalte orientieren.

=== Obligatorische Aufgabenstellungen <o-aufgaben>

Die folgenden Aufgabenstellungen müssen von allen Studierenden nach Abschluss des Moduls weitestgehend ohne Probleme gelöst werden können:

+ Aussagesätze identifizieren

+ Definition von Grundkonzepten

+ aussagenlogische Formalisierung

+ zum Verständnis von Sätzen mit „wenn“, „dann“ und „nur“ sowie von notwendigen und hinreichenden Bedingungen:
    - alternative, äquivalente Formulierungen identifizieren können
    - notwendige und hinreichende Bedingungen bestimmen können

+ logische Wahrheit, logische Falschheit, logische Folgerung und logische Äquivalenz mit der Wahrheitstabelle zeigen

+ Beweise mit dem aussagenlogischen Kalkül des natürlichen Schließens

+ prädikatenlogische Formalisierung

+ Zusammenhänge und Felder im logischen Quadrat ausfüllen

+ Beweise mit dem prädikatenlogischen Kalkül des natürlichen Schließens

+ verzweigte Beweise mit dem Kalkül des natürlichen Schließens

Diese Aufgabenstellungen können beliebig kombiniert werden, so kann etwa für einen Beweis zuerst eine Formalisierung gefordert werden und dann ein Beweis mit dem Kalkül des natürlichen Schließens.

=== Erweiterte Aufgabenstellungen

Diese Aufgabenstellungen sind ergänzend zu den obigen zu verstehen, in der Hinsicht, dass sie beim Bearbeiten ein tieferes Verständnis für die Inhalte erzeugen können:

+ metasprachlich Beweisen

+ Anführungszeichen setzen

+ Belegungen für wahre Aussagen finden

+ Interpretation aussagenlogischer Sätze mit Hilfe der Wahrheitstabelle

+ syntaktisch korrekte AL-Sätze identifizieren

+ syntaktisch korrekte PL-Sätze identifizieren

+ Argumente entkräften, durch Ablehnung einer Prämisse oder Aufzeigen von Ungültigkeit

+ aussagenlogische Junktoren benennen und erklären

+ Hauptjunktor bestimmen

+ Wahrheitstabelle für Ausdrücke bilden

+ Modelle für prädikatenlogische Ausdrücke bestimmen, in denen die Ausdrücke wahr sind

+ prädikatenlogische Ausdrücke für gegebene Modelle bestimmen, sodass die Ausdrücke wahr sind (am besten keine logisch wahren)

= Visuelles Konzept

== Farbgebung und Typografie

Der Grundsatz für die Medien des Tutoriums heißt: wenige, gut unterscheidbare Farben. Daher habe ich mich für fünf Farben entschieden, drei Primärfarben, zwei Sekundärfarben:

// #circle(fill: yellow)
#align(center, block(breakable: false, stack(dir: ltr,
    spacing: 0.5cm,
    ..((blue, [Blau]),
        (purple, [Dunkelblau]),
        (magenta, [Magenta]),
        (brown, [Braun]),
        (yellow, [Gelb])).map(e => {

        block(width: 2cm, {
            circle(fill: e.first())
            e.last()
        })
    }))))

Diese drei Farben sind sowohl visuell ansprechend, als auch in den meisten Farbschwächen noch angemessen zu unterscheiden. So ist zum Beispiel diese Palette für Menschen mit Rot-Grün-Schwäche noch unterscheidbar:

#align(center, block(breakable: false, stack(dir: ltr,
    spacing: 0.5cm,
    ..((rgb("#7672E5"), [Blau]),
        (rgb("#2A2A69"), [Dunkelblau]),
        (rgb("#B4BC6D"), [Magenta]),
        (rgb("#6A6E16"), [Braun]),
        (rgb("#E6EB65"), [Gelb])).map(e => {

        block(width: 2cm, {
            circle(fill: e.first())
            e.last()
        })
    }))))

Das dunkle Blau wird die Hauptakzentfarbe der Dokumente, so etwa für allgemeine Gestaltungselemente wie Überschriften, Links, o.ä. Die anderen sind zum Hervorheben bestimmter anderer Aspekte gedacht.

Typografisch ist besonders eine Entscheidung getroffen wurden: gewählt wurde die Schriftart #link("https://brailleinstitute.org/freefont", [Atkinson Hyperlegible]), da bei dieser auch bei geringen Schriftgrößen oder Menschen mit Sehbehinderung bis zu einem gewissen Grad die Buchstaben noch sehr gut zu unterscheiden sind:

#align(center, image(width: 35%, "atkinson_blur.png"))

Währenddessen bei anderen Schriftarten:

#align(center, {
    image(width: 75%, "fonts_blur.png")

    set text(size: 0.75em)
    place([Arial],              dx: 1.15cm - 0.1cm, dy: -2.37cm - 1.75cm)
    place([Calibri],            dx: 1.15cm - 0.1cm - 0.25cm, dy: -0.1cm - 1.75cm)

    place([Times New\ Roman],    dx: 2.15cm + 6.7cm + 5.4cm, dy: -1.75cm - 2.37cm)
    place([TW Cen MT],          dx: 2.15cm + 6.7cm + 5.4cm, dy: -1.75cm - 0.1cm)
})

== Gestaltungselemente

Gestaltungselemente müssen einer klaren Syntax und Semantik folgen. Ihre Syntax soll begrenzt und ihre Semantik eindeutig sein. Das heißt, dass es eine kleine Anzahl an Gestaltungselementen gibt, die direkt vermitteln, welche Art von Information sie beinhalten. Didaktisch soll jedes Gestaltungselement direkt wirken: es kann so etwa Aufgaben anzeigen, wichtige Informationen hervorheben oder Kontext vermitteln.

=== Folien

Auf den Folien sollen 6 Gestaltungselemente unterschieden werden:

// #align(center, block(width: 70%, align(left, [
#[
#let smallblock(body) = align(center, block(align(left, body)))
#set enum(spacing: 1cm)
+ #nobreak[Eine Definition ist eine Begriffbestimmung. Definitionen werden zur Klärung von Begriffen eingesetzt. Alle klausurrelevanten Definitionen sind auf den Folien so hervorgehoben:

    #smallblock(definition[
        Ein Schluss heißt gültig, gdw. die Konklusion nie falsch sein kann, wenn die Prämissen wahr sind.
    ])
]

+ #nobreak[Wichtige Dinge und Merksätze werden so dargestellt:

    #smallblock(notice[
        Widersprechen sich die Prämissen, so ist der Schluss mit jeder beliebigen Konklusion gültig!
    ])

    Es handelt sich dabei um Dinge, die beachtet werden müssen, oder um allgemeine Algorithmen bzw. Einschränkungen für Algorithmen und Vorgehen, um Aufgaben zu bearbeiten.
]

+ #nobreak[Aufgaben sind konkrete Handlungsanweisungen:

    #smallblock(task[
        Nennen Sie die zwei Gütekriterien philosophischer Argumente!
    ])

    Eine konkrete Handlungsanweisung auf den Folien ist von den Studierenden innerhalb des Tutoriums umzusetzen.
]

+ #nobreak[Lösungen ergänzen Aufgaben um einen Erwartungshorizont, der für die Studierenden einsichtbar ist:

    #smallblock(solution[
        Die zwei Gütekriterien philosophischer Argumente sind die Gültigkeit und die Schlüssigkeit des Arguments.
    ])
]

+ #nobreak[Beispiele sind bereits erledigte Aufgaben:

    #smallblock(example[
        Das folgende Argument ist gültig, aber nicht schlüssig, da die Prämissen falsch sind:

        #normalform[
            Wenn Einstein bisher Unrecht hatte, dann ist alles egal.][
            Einstein hatte bisher Unrecht.][
            Alles ist egal.]

            Einstein hatte mit seiner Relativitätstheorie bisher Recht und nicht Unrecht, daher ist die zweite Prämisse falsch.
    ])

    Beispiele sollen den Studierenden eine Mustervorlage für die Bearbeitung bestimmter Aufgabentypen oder Problemstellungen geben.
]

+ #nobreak[Hinweise sind Zusatzinformationen von niedriger Priorität.

    #smallblock(hint[
        Nur weil Einstein mit seiner Relativitätstheorie bisher Recht hatte, heißt es nicht, dass wir nicht doch noch auf Phänomene stoßen könnten, bei denen die Relativitätstheorie nicht mehr funktioniert. Die Schlüssigkeit eines Arguments ist damit vom Vorwissen abhängig.
    ])

    Diese Zusatzinformationen sind für die Studierenden nur aus motivationalen oder didaktischen Gründen zu verwenden, um etwa auch als Vertiefung oder Kontextualisierung zu wirken.
]
// ])))
]

=== Wiederholungsserien

Auf den Wiederholungsserien werden hauptsächlich Aufgaben, Hinweise und Lösungen verwendet. Um die Wiederholungsserien visuell nicht zu überladen, findet eine Differenzierung der Gestaltungselemente der Folien von denen der Wiederholungsserien statt:

Jede Wiederholungsserie besteht aus drei verschiedenen Dokumenten:

1. *Aufgabenblatt:* enthalten nur die Aufgaben

2. *Hinweisblatt:* enthalten Aufgaben sowie spezifische Hilfestellungen bzw. Teillösungen zu den Aufgaben, ohne jedoch komplette Lösungen vorzugeben

3. *Lösungsblatt:* enthalten Aufgaben sowie Lösungen der Aufgaben

Für alle Dokumente sollen die Gestaltungselemente, bis auf den Inhalt, dieselben sein.

=== Logische Elemente

Sowohl auf den Folien als auch auf den Aufgabenblättern werden die folgenden Elemente benutzt, um logische Sachverhalte darzustellen:

+ *Wahrheitstabelle:* TODO
+ *KdnS:* TODO
+ *Syntaxbaum:* TODO
+ *Semantikbaum:* TODO
+ *Modell-Diagramm:* Venn-Diagramm mit Individuen TODO

= Inhalte und inhaltliche Ziele <inhalte>

== Zielsetzung

=== Richtziele

Die Aufgabenstellungen aus @o-aufgaben bieten die Grundlage für die wichtigsten Fähigkeiten und Fertigkeiten, die die Studierenden ausbilden müssen.

Die Studierenden generieren Sachkompetenz, indem sie ...
- ... Grundkonzepte definieren.
- ... Zusammenhänge und Felder im logischen Quadrat ausfüllen.

Die Studierenden generieren Methodenkompetenz, indem sie ...
- ... Aussagesätze identifizieren.
- ... Aussagesätze in AL formalsieren.
- ... zu bestehenden Wenn-Dann-Sätzen logisch-äquivalente Wenn-Dann-Sätze identifizieren.
- ... zu bestehenden Wenn-Dann-Sätzen logisch-äquivalente Wenn-Dann-Sätze  bilden.
- ... notwendige und hinreichende Bedingungen in Wenn-Dann-Sätzen bestimmen.
- ... logische Wahrheit, logische Falschheit, logische Folgerung und logische Äquivalenz mit der Wahrheitstabelle beweisen.
- ... Beweise mit dem aussagenlogischen Kalkül des natürlichen Schließens führen.
- ... Aussagesätze in PL formalisieren.
- ... Beweise mit dem prädikatenlogischen Kalkül des natürlichen Schließens führen.
- ... verzweigte Beweise mit dem Kalkül des natürlichen Schließens führen.

=== Grobziele

// Richtziele auseinandernehmen und feiner machen

=== Gewichtung

// Wie wichtig sind die einzelnen Ziele?

== Zentrale Begriffe

/*
TODO: Bereich neu machen.

== Ziele und Ablaufplan

Das Tutorium soll sowohl einen festen inhaltlichen Plan verfolgen, als auch Raum für individuelle Wünsche der Studierenden enthalten. Dabei gibt es ein kontingent an obligatorischen Inhalten, die sich aus den klausurrelevanten Aufgabenstellungen zusammensetzen, und fakultative Inhalte, die zur Vertiefung und Sicherung genutzt werden können.

Die Ziele werden je mit einer Identifikator versehen. Dieser besteht aus einer Abkürzung aus zwei Großbuchstaben (etwa "LG" für "logische Grundlagen") und einer fortlaufenden Nummer für die jeweilige Sequenz. Damit kann für alle Sitzungsziele nachverfolgt werden, aus welchen Sequenzzielen sie stammen.

#set table(inset: 0.75em)
#show table.cell: set text(size: 0.75em)
#show table.cell: set par(justify: false)

#table(
    columns: (20%, auto, auto),
    stroke: none,

    fill: (col, row) => (
        purple,
        none,
        blue.lighten(75%)
    ).at(
        if row == 0 {
            row
        } else {
            1 + calc.rem(row, 2)
        }
    ),

    // map-cols: (col, cells) => {
    //     let index = 0

    //     while index < cells.len() {
    //         cells.at(index).content = [
    //             #set par(justify: false)
    //             #set text(size: 0.75em)
    //             #v(0.5em)
    //             #cells.at(index).content
    //             #v(0.5em)
    //         ]
    //         index += 1
    //     }

    //     return cells
    // },

    // map-rows: (row, cells) => {
    //     let index = 0

    //     while index < cells.len() {
    //         cells.at(index).content = [
    //             #set par(justify: false)
    //             #set text(size: 0.75em)

    //             #if row <= 0 {
    //                 // v(0.25em)
    //                 pad(y: 0.25em, cells.at(index).content)
    //                 // v(0.25em)

    //             } else {
    //                 // v(0.5em)
    //                 pad(y: 0.5em, cells.at(index).content)
    //                 // v(0.5em)
    //             }
    //         ]

    //         index += 1
    //     }

    //     return cells
    // },

    text(fill: white, strong[Sequenz]),
    table.vline(stroke: purple),

    text(fill: white, strong[Inhalt]),
    table.vline(stroke: purple),

    text(fill: white, strong[Die Studierenden können/haben/wissen/...]),
)[
    Logische Grundlagen \
    (LG)
    #set-sequence-goals-key("LG")
][
    - Definition der Logik
    - (Abgrenzung zur Mathematik)
    - philosophisch-logische Argumente
    - Gütekriterien:
        - deduktive Gültigkeit
        - Schlüssigkeit

    \
    - indirekte Beweise
    - (direkte Beweise)

    \
    - notwendige und hinreichende Bedingungen
][
    #print-goals-for-sequence()

    // - "Logik" definieren

    // - wissen, was philosophische Argumente sind

    // - philosophische Argumente erkennen

    // - "Argument" definieren

    // \
    // - Gültigkeit und Schlüssigkeit definieren

    // - Gültigkeit und Schlüssigkeit vergleichen und voneinander abgrenzen

    // \
    // - kennen den formalen Aufbau eines Beweises#footnote[Theorem, Beweis, QED]

    // - durch metasprachliche Begründung einfache Beweise über deduktiv-gültige Argumente führen
][

    Aussagenlogik \
    (AL)
    #set-sequence-goals-key("AL")
][
    - Analyse der Sprache an Satzbausteinen
        - Nicht
        - Und
        - Oder
        - Wenn-Dann
        - Genau-Dann-Wenn

    \
    - Syntax
        - aussagenlogische Junktoren
        - valide AL-Sätze
        - aussagenlogische Formalisierung

    \
    - Semantik
        - Bedeutung aussagenlogischer Junktoren
][
    #print-goals-for-sequence()
    // - aussagenlogische Strukturen der deutschen Sprache identifizieren

    // - notwendige und hinreichende Bedingungen im Wenn-Dann-Satz identifizieren

    // \
    // - ein Gefühl für die Struktur und Bildungsregeln von AL entwickeln

    // - Schemata suchen und erkennen

    // - Schemata zur Bildung neuer Ausdrücke benutzen

    // - Junktoren in der natürlichen Sprache erkennen

    // - Sätze der natürlichen Sprache aussagenlogisch formalisieren

    // - "nur" und "genau dann, wenn" adäquat formalisieren

    // - Äquivalenzumformulierungen für notwenidge und hinreichende Bedingungen identifizieren und bilden

    // \
    // - Wahrheitsbedingungen von Sätzen erkennen

    // - die Semantik der Junktoren definieren
][
    Wahrheitstabelle \
    (WT) #set-sequence-goals-key("WT")
][
    - Interpretation aussagenlogischer Ausdrücke mit der Wahrheitstabelle
        - Semantik der Junktoren als Wahrheitstabelle
        - komplexe Ausdrücke

    \
    - logische Wahrheit, logische Falschheit
    - logische Folgerung, logische Äquivalenz
][
    #print-goals-for-sequence()
    // - die semantische Definition der Junktoren in der Wahrheitstabelle darstellen

    // - Ausdrücke mit der Wahrheitstabelle auswerten

    // - logische Wahrheit und Falschheit in der Wahrheitstabelle beweisen

    // - logische Folgerung und Äquivalenz in der Wahrheitstabelle bweisen

    // - schreiben für jeden Beweis QED und einen Antwortsatz
][
   Kalkül des natürlichen Schließens \
   (KS) #set-sequence-goals-key("KS")
][
    - direkte Schlussregeln
        - MP, MT, KS, KP, $not$-Bes., $not$-Einf., $and$-Bes., $and$-Einf., DS, $or$-Einf., $<->$-Bes., $<->$-Einf., DM, $->$-Ers., KM, $->$-Einf., RAA

    - erweiterte Schlussregeln
        - linke Beweisspalte und ZA
        - RAA
        - $->$-Einführung
][
    #print-goals-for-sequence()
    // - verstehen das Muster der direkten Regelanwendung

    // - einfache bis mittelkomplexe direkte Beweise führen

    // - wissen, dass man für RAA standardmäßig das Gegenteil der Konklusion annimmt

    // - die linke Beweisspalte bilden

    // - RAA durchführen

    // - erkennen, wann $->$-Einf. gefordert ist

    // - wissen, dass sie beim Einführen einer ZA die Abhängigkeiten der Zeilen prüfen müssen
][
    Prädikatenlogik \
    (PL) #set-sequence-goals-key("PL")
][
    - Syllogismen & Prädikatierung

    \
    - Syntax
        - Konstanten und Prädikate
        - Quantoren, Variablen
        - prädikatenlogische Formalisierung

    \
    - (Semantik)

    \
    - logisches Quadrat
][
    #print-goals-for-sequence()
    // - verstehen den Unterschied zwischen der reinen Satzlogik AL und der u.a. Begriffslogik PL

    // - einfache prädikatenlogische unquantifizierte Sachverhalte formalisieren

    // - einfache prädikatenlogische quantifizierte Sachverhalte formalisieren

    // - Quantoren ineinander umrechnen

    // - die Begriffe des logischen Quadrats nennen

    // - eigene Beispiele für das logische Quadrat finden
][
    Prädikatenlogisches Kalkül des natürlichen Schließens \
    (PK) #set-sequence-goals-key("PK")
][
    - $forall$-Einf., $forall$-Bes.
    - $exists$-Bes., $exists$-Einf.
    - QT
    - PKS
][
    #print-goals-for-sequence()
    // - quantifizierte Ausdrücke spezialisieren und die spezialisierten Variablen korrekt ersetzen

    // - Ausdrücke, die Konstanten beinhalten, generalisieren und die Konstanten korrekt binden

    // - kennen die Einschränkungen der $forall$-Einf. und beachten sie bei der Ableitung

    // - kennen die Einschränkungden der $exists$-Bes. und beachten sie bei der Ableitung

    // - schreiben für jeden Beweis QED und einen Antwortsatz
]

/*

Logische Grundlagen:

- philosophisch-logische Argumente
- Gütekriterien:
  - deduktiv-gültige Schlüsse
  - schlüssige Schlüsse
- logische Folgerung und Abhängigkeit von Prämissen
- (direkte und indirekte Beweise)

Aussagenlogik:

- Motivation der Aussagenlogik
- Syntax:
  - aussagenlogische Formalisierung
  - valide AL-Sätze
- Semantik:
  - Wahrheitstabellen
  - logische Folgerung, Äquivalenz, Wahrheit und Falschheit

Kalkül des natürlichen Schließens (KdnS):

- Aufbau
- direkte Beweise
- indirekte Beweise:
  - Zusatz-Annahmen
  - →-Einführung
  - Reductio ad absurdum
- verzweigte Beweise I

Prädikatenlogik:

- Motivation der Prädikatenlogik
- Syntax:
  - prädikatenlogische Formalisierung
- (Semantik)
- logisches Quadrat
- KdnS für PL
- verzweigte Beweise II

*/

= Ablaufplan Tutorium

#include "raw-plan.typ"