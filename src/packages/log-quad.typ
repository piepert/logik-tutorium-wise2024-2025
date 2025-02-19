#import "@preview/cetz:0.3.0"

#let log-quad(
    // AffIrmo
    a: [Alles ist schön.\ $forall x F x$, $not exists x not F x$],
    i: [Einiges ist schön.\ $exists x F x$, $not forall x not F x$],
    e: [Alles ist nicht schön.\ $forall x not F x$, $not exists x F x$],
    o: [Einiges ist nicht schön.\ $exists x not F x$, $not forall x F x$],

    show-specialization: false,
    // Positiver Spezialfall/Negativer Spezialfall
    ns: [Dieses ist nicht schön.\ $not F a$],
    ps: [Dieses ist schön. \ $F a$],

    // konträr
    k: [konträr],
    // kontradiktorisch
    kd: [kontradiktorisch],
    // subkonträr
    sk: [subkonträr],
    // subaltern
    sub: [subaltern],
    // impl
    impl: [impliziert],

    s-1: none,
    s-2: none,
    s-3: none,
    s-4: none,

    line-arrows: true,
    scale-factor: 1,
) = {

    let kond = if line-arrows { cetz.draw.line.with(mark: (end: ">")) } else { cetz.draw.line }
    let bikond = if line-arrows { cetz.draw.line.with(mark: (start: ">", end: ">")) } else { cetz.draw.line }

    let p(body) = pad(5pt, block(stroke: 1pt, inset: 0.5em, body))

    a = p(a)
    i = p(i)
    e = p(e)
    o = p(o)

    ns = p(ns)
    ps = p(ps)

    let s-1 = if s-1 != none { s-1 } else { sub }
    let s-2 = if s-2 != none { s-2 } else { sub }
    let s-3 = if s-3 != none { s-3 } else { sub }
    let s-4 = if s-4 != none { s-4 } else { sub }

    cetz.canvas({
        import cetz.draw: *

        if show-specialization {
            scale(scale-factor)

            content((-3, 0.5), a, name: "a")
            content((-3, -5.5), i, name: "i")
            content((-3, -2.5), ps, name: "ps")
            content((6, -2.5), ns, name: "ns")
            content((6, 0.5), e, name: "e")
            content((6, -5.5), o, name: "o")

            bikond("e.west", "a.east")
            bikond("o.west", "i.east")
            kond("a.south", "ps.north")
            kond("ps.south", "i.north")
            kond("e.south", "ns.north")
            kond("ns.south", "o.north")

            bikond("a.south-east", "o.north-west")
            bikond("e.south-west", "i.north-east")

            group(name: "group_k", {
                rect((0, 0), (3, 1),
                    stroke: none, name: "container_k")
                content("container_k.center",
                    block(outset: 0.25em, fill: white.transparentize(15%))[#k])

            })

            group(name: "group_sk", {
                rect((0, -5.5), (3, -5.5), stroke: none, name: "container_sk")
                content("container_sk.center", block(outset: 0.25em, fill: white.transparentize(15%))[#sk])
            })

            group(name: "group_kd", {
                rect((0, -2.5), (3, -2.5),
                    stroke: none,
                    name: "container_kd")

                content("container_kd.center",
                    block(outset: 0.25em, fill: white.transparentize(15%))[#kd])
            })

            group(name: "group_i1", {
                rect((-2.5, -4), (-3.5, -4),
                    stroke: none,
                    name: "container_i1")

                content("container_i1.center",
                    if impl != none { block(outset: 0.25em, fill: white.transparentize(15%))[#impl] })
            })

            group(name: "group_i3", {
                rect((-2.5, -1), (-3.5, -1),
                    stroke: none,
                    name: "container_i3")

                content("container_i3.center",
                    if impl != none { block(outset: 0.25em, fill: white.transparentize(15%))[#impl] })
            })

            group(name: "group_i2", {
                rect((5.5, -4), (6.5, -4),
                    stroke: none,
                    name: "container_i2")

                content("container_i2.center",
                    if impl != none { block(outset: 0.25em, fill: white.transparentize(15%))[#impl] })
            })

            group(name: "group_i4", {
                rect((5.5, -1), (6.5, -1),
                    stroke: none,
                    name: "container_i4")

                content("container_i4.center",
                    if impl != none { block(outset: 0.25em, fill: white.transparentize(15%))[#impl] })
            })

        } else {
            scale(scale-factor)

            content((-3, 0.5), a, name: "a")
            content((-3, -4.5), i, name: "i")
            content((6, 0.5), e, name: "e")
            content((6, -4.5), o, name: "o")

            bikond("e.west", "a.east")
            bikond("o.west", "i.east")
            kond("a.south", "i.north")
            kond("e.south", "o.north")

            bikond("a.south-east", "o.north-west")
            bikond("e.south-west", "i.north-east")

            group(name: "group_k", {
                rect((0, 0), (3, 1),
                    stroke: none, name: "container_k")
                content("container_k.center",
                    block(outset: 0.25em, fill: white.transparentize(15%))[#k])

            })

            group(name: "group_sk", {
                rect((0, -4), (3, -5), stroke: none, name: "container_sk")
                content("container_sk.center", block(outset: 0.25em, fill: white.transparentize(15%))[#sk])
            })

            group(name: "group_sub1", {
                rect((-4, -2), (-2, -2),
                    stroke: none,
                    name: "container_sub1")

                content("container_sub1.center",
                    block(outset: 0.25em, fill: white.transparentize(15%))[#sub])
            })

            group(name: "group_sub2", {
                rect((5, -2), (7, -2),
                    stroke: none,
                    name: "container_sub2")

                content("container_sub2.center",
                    block(outset: 0.25em, fill: white.transparentize(15%))[#sub])
            })

            group(name: "group_kd", {
                rect((0, -2), (3, -2),
                    stroke: none,
                    name: "container_kd")

                content("container_kd.center",
                    block(outset: 0.25em, fill: white.transparentize(15%))[#kd])
            })
        }
    })
}