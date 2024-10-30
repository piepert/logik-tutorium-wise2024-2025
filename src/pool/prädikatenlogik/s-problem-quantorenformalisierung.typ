#import "@preview/grape-suite:1.0.0": slides, seminar-paper
#import seminar-paper: blockquote
#import slides: slide, task

#import "/src/packages/inference.typ": *

#show: slides.slides.with()

#slide[
    = Sokrates wird angeklagt
    #set text(size: 0.9em)

    #blockquote[
        #set par(hanging-indent: 1.5em)
        S: [S]age uns doch, Meletos, auf welche Weise ich deiner Meinung nach die Jugend verderbe. [...] [Die Klageschrift] sagt, ich verderbe sie dadurch, daß ich sie lehre, nicht an die staatlich anerkannten Götter zu glauben sondern an ein neues Dämonentum anderer Art. [...] Meletos, [...] erkläre dich [...], denn ich vermag nicht klar zu sagen, was für eine Lehre du mir zuschreibst: lehre ich den Glauben an das Dasein von doch irgendwelchen Göttern [...] [so wäre ich] also kein völliger Atheist [...] oder erklärst du mich für völlig ungläubig [...]?

        M: Das letztere behaupte ich: du glaubst überhaupt an keine Götter. [...]
    ][Platon: Apologie, 26b -- 26d, übers. v. Otto Apelt]
]

#slide[
    #heading(outlined: false)[Sokrates wird angeklagt]
    #set text(size: 0.915em)

    #blockquote[
        #set par(hanging-indent: 1.5em)
        S: Glaube ich aber an Dämonentum, dann muß ich unbedingt auch an Dämonen glauben. [...] Die Dämonen aber — halten wir sie nicht entweder für Götter oder für Sprößlinge der Götter? Gibst du es zu oder nicht?

        M: Gewiß.

        S: Wenn ich also, wie du zugibst, an Dämonen glaube, und die Dämonen eine Art Götter sind, so [sollte] [...] ich, der ich nach deiner Aussage an keine Götter glaube, soll doch anderseits wieder an Götter glauben. // [...] Das wäre ja doch gerade so ungereimt, als wollte jemand an Sprößlinge von Pferden und Eseln glauben, an Maulesel nämlich, nicht aber an das Dasein von Pferden und Eseln.
    ][Platon: Apologie, 27c -- 27d, übers. v. Otto Apelt]
]

#slide[
    = Existenz und Subalternation

    #inference-raw(```
        Dämonen sind Kinder von Göttern.
        ----
        Es gibt Dämonen, die Kinder von Göttern sind.
    ```)

    // #inference-raw(```
    //     $forall x (D x -> K x)$
    //     ----
    //     $exists x (D x and K x)$
    // ```)


    #task(time: [5 min.])[
        Formalisieren Sie den Schluss und beurteilen Sie, ob der Schluss gültig ist oder nicht!
    ]
]

#slide[
    *Idee:* Prämisse hinzufügen.

    #inference-raw(```
    Dämonen sind Kinder von Göttern.
    Es gibt Dämonen.
    ----
    Es gibt Dämonen, die Kinder von Göttern sind.
    ```)

    // #inference-raw(```
    //     $forall x (D x -> K x)$
    //     $exists x D x$
    //     ----
    //     $exists x (D x and K x)$
    // ```)

    #task(time: [5 min.])[
        Formalisieren Sie den Schluss und beurteilen Sie, ob der Schluss gültig ist oder nicht!
    ]
]