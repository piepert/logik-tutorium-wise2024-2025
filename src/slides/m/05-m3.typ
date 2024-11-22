#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#import "/src/templates/exercise.typ": project, blockquote, line-numbering
#import "/src/templates/slides.typ": task
#import "/src/packages/inference.typ": *
#import "/src/packages/truth-table.typ": *

#show: project.with(
    type: "Material",
    no: 3,
    suffix-title: [Logische Folgerung],
    date: datetime(year: 2023, month: 11, day: 20))

#task(time: [Expertengruppen, 10 min.])[
    Definieren Sie Begriff den Begriff der logischen Folgerung mit Hilfe Ihres Materials, dem Skript und den Vorlesungsfolien! Erklären Sie anhand eines Beispiels, wie Sie dies innerhalb der Wahrheitstabelle erkennen!
]

#show: line-numbering

Ein gültiger Schluss ist so einer, bei dem die Konklusion aus den Prämissen logisch folgt. Aber was heißt das eigentlich? Dafür können wir uns die Probe, mit der wir gültige Schlüsse prüfen, anschauen: Man nehme an, dass die Prämissen wahr sind und dazu, dass die Konklusion falsch ist und suche einen Widerspruch zu den Prämissen. Wenn man einen Widerspruch findet, hat man ein gültiges Argument vor sich. Der Widerspruch zeigt es uns, dass es gar nicht möglich ist, dass die Konklusion falsch ist, wenn die Prämissen wahr sind.

Diesen Zusammenhang können wir auch in der Wahrheitstabelle erkennen: Wenn wir schauen wollen, ob ein Satz $alpha$ aus einem oder mehreren Sätzen $beta_1, ..., beta_n$ folgt, dann schreibt man diese Sätze $beta_1, ..., beta_n$ und $alpha$ nebeneinander und zeichnet die Wahrheitstafel. Wenn überall dort, wo alle Prämissen wahr sind, die Konklusion nicht falsch ist, dann handelt es sich um logische Folgerung.

#figure(align(left, inference-wl($p or not q$, $q$, $p$)))

Zum Beispiel kann man schauen, ob die Konklusion "$p$" aus den Prämissen "$p or not q$" und "$q$" folgt:

#figure(truth-table("p | -q", "q", "p"))

Kleine Erinnerung: Wenn überall da, wo die Prämissen *gemeinsam wahr* sind, die Konklusion nicht falsch ist, dann handelt es sich um logische Folgerung. Wir suchen also zuerst die Zeilen, in denen alle Prämissen wahr sind (das ist hier nur Zeile 1) und schauen, ob die Konklusion dort auch wahr ist. Das ist heir der Fall, also handelt es sich um logische Folgerung!

Es gibt einen Spezialfall: Wenn die Prämissen zusammen nie wahr sind, kann man der Bedingung oben natürlich nicht widersprechen. Wenn die Prämissen nirgendwo zusammen wahr sind, handelt es sich *immer* um eine logische Folgerung.

Logische Folgerung in der Sprache AL eines Satzes $alpha$ aus beliebig vielen Sätzen $beta_1, ..., beta_n$ wird formal so dargestellt:

#figure($beta_1, ..., beta_n limits(inline: #false, tack.r.double)_"AL" alpha$)