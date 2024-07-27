#import "@preview/grape-suite:1.0.0": exercise
#import exercise: *

#let project = project.with(
    no: 1,
    type: [LEV],
    suffix-title: [Logische Grundlagen],

    university: [Universität Rostock],
    institute: [Institur für Philosophie],
    seminar: [Tutorium: Sprache, Logik, Argumentation],

    show-point-distribution-in-tasks: true,
    show-namefield: true,
    show-timefield: true,
    max-time: 25,
    show-solutions: true,
    show-lines: true,
    solutions-as-matrix: true
)