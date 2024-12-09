#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *

#show: project.with(
    type: "Material",
    no: 2,
    suffix-title: [induktive Gültigkeit],
    date: datetime(year: 2024, month: 10, day: 30))

#task(time: [10 min.])[
    + Definieren Sie, was ein induktiv-gültiges Argument ist.
    + Erklären Sie, welches Problem bei induktiv-gültigen Schlüssen auftritt!

    Sie können den folgenden Text oder das Skript benutzen.
]

#show: line-numbering

Wie kommen wir eigentlich zu wissenschaftlicher Erkenntnis? Wie entsteht ein Naturgesetz? Häufig beobachten wir die Natur und schließen daraus auf ein darunterliegendes Gesetz, dass diesen Zusammenhang beschreibt. -- Bisher ist die Sonne jeden Tag erneut aufgegangen, also wird sie auch morgen erneut aufgehen. Alle bisher gesehenen Schwäne waren weiß, also sind wahrscheinlich alle Schwäne weiß. -- Dieses Vorgehen, der Schluss auf meiste eine allgemeine Regelmäßigkeit aus Einzelerfahrungen oder von der Vergangenheit auf die Zukunft, das nennt man Induktion. Häufig funktioniert sie ganz gut, zumindest im Alltag, obwohl... wenn man so darüber nachdenkt, eigentlich überhaupt nicht: Es wird einen Tag gehen, an dem die Sonne zum letzten Mal aufgeht, das wissen wir jetzt schon. Und auch dass nicht alle Schwäne weiß sind, ist bekannt. Eigentlich wurde Induktion bisher so gut wie immer widerlegt, es ist nur eine Frage der Zeit. Hume beschreibt das Problem so:

#blockquote[
    Von einem Körper, der die gleiche Farbe und Festigkeit wie das Brot besitzt, erwarten wir die gleiche Ernährung und Erhaltung. Dies ist doch sicherlich ein Schritt oder ein Fortgang im Geiste, der einer Erklärung bedarf. [...] [A]lle Ableitung aus Erfahrung setzt als ihre Grundlage voraus, daß die Zukunft der Vergangenheit ähnlich sein wird und daß gleichartige Kräfte mit gleichartigen sinnlichen Eigenschaften zusammenhängen werden. Schöpfte man irgendwie Verdacht, daß der Naturlauf sich ändern könne und daß in der Vergangenheit nicht die Regel für die Zukunft enthalten sei, so würde jede Erfahrung nutzlos und könnte zu keinem Ableiten oder Schließen Veranlassung geben. Daher ist es unmöglich, daß irgendwelche Erfahrungsbegründungen diese Ähnlichkeit der Vergangenheit mit der Zukunft belegen können, denn all diese Begründungen beruhen ja auf der Voraussetzung dieser Ähnlichkeit. Mag der Lauf der Dinge bisher noch so regelmäßig gewesen sein – das allein [...] beweist nicht, daß es in Zukunft so bleiben muß.
][David Hume: Eine Untersuchung über den menschlichen Verstand. Hrsg. von Manfred Kühn, übersetzt von Raul Richter. Hamburg 2015. S. 47 f.]

Induktionsschlüsse sind damit solche, bei denen die Konklusion wahrscheinlich nicht falsch sein kann, wenn die Prämissen wahr sind, eben weil wir so viele Beispiele haben. Sicher sein können wir uns aber nicht.