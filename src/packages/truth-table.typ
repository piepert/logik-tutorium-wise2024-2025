#import "@preview/grape-suite:1.0.0": colors

#let al-tokenizer(expression) = { // (, ), & (conj), | (disj.), > (impl.), = (eqv.)
    let tokens = ()
    let tmp = ""

    for t in expression {
        if t == " " or t == "\t" or t == "\n" {
            if tmp != "" {
                tokens.push(tmp)
                tmp = ""
            }

            continue

        } else if t in "()-&|>=/" {
            if tmp != "" {
                tokens.push(tmp)
                tmp = ""
            }

            tokens.push(t)

        } else {
            tmp += t
        }
    }

    if tmp != "" {
        tokens.push(tmp)
    }

    return tokens
}


#let al-operands = ("-", "&", "|", ">", "=", "/")
#let is-operator(token) = token in al-operands
#let get-precedence(token) = al-operands.len() - al-operands.position(e => e == token)

#let al-parser(tokens) = {
    let postfix = ()
    let stack = ()

    for token in tokens {
        if is-operator(token) {
            if stack.len() > 0 and stack.last() != "(" {
                if get-precedence(token) >= get-precedence(stack.last()) {
                    stack.push(token)

                } else {
                    while stack.len() > 0 and stack.last() != "(" and get-precedence(token) < get-precedence(stack.last()) {
                        postfix.push(stack.last())
                        stack.pop()
                    }

                    stack.push(token)
                }

            } else {
                stack.push(token)
            }

        } else if token == "(" {
            stack.push(token)

        } else if token == ")" {
            while stack.len() > 0 and stack.last() != "(" {
                postfix.push(stack.last())
                stack.pop()
            }

            stack.pop()

        } else { // al variable
            postfix.push(token)
        }
    }

    while stack.len() > 0 {
        postfix.push(stack.last())
        stack.pop()
    }

    return postfix
}

#let al-postfix-to-tree(postfix) = {
    let term = postfix
    let stack = ()

    for op in term {
        if op == "-" {
            stack.push((op, stack.pop()))

        } else if is-operator(op) {
            let o1 = stack.pop()
            let o2 = stack.pop()
            stack.push((op, o2, o1))

        } else {
            stack.push(op)
        }
    }

    return stack.pop()
}

#let al-tree-to-postfix(tree) = {
    if tree.len() == 0 { // ???
        return tree

    } else if tree.len() == 1 { // p, q, r, ...
        return tree

    } else if tree.len() == 2 { // ¬
        return (al-tree-to-postfix(tree.at(1)), tree.at(0)).flatten()

    } else if tree.len() == 3 {
        return (al-tree-to-postfix(tree.at(1)), al-tree-to-postfix(tree.at(2)), tree.at(0)).flatten()

    } else {
        panic()
    }
}

#let al-evaluator(variables, postfix-term) = {
    let term = postfix-term
    let stack = ()

    for op in term {
        if op == "-" {
            let o1 = stack.pop()
            stack.push(not o1)

        } else if op == "&" {
            let o1 = stack.pop()
            let o2 = stack.pop()
            stack.push(o1 and o2)

        } else if op == "|" {
            let o1 = stack.pop()
            let o2 = stack.pop()
            stack.push(o1 or o2)

        } else if op == "/" {
            let o1 = stack.pop()
            let o2 = stack.pop()
            stack.push((o1 and not o2) or (not o1 and o2))

        } else if op == ">" {
            let o1 = stack.pop()
            let o2 = stack.pop()
            stack.push(o1 or not o2)

        } else if op == "=" {
            let o1 = stack.pop()
            let o2 = stack.pop()
            stack.push((o1 and o2) or (not o1 and not o2))

        } else {
            stack.push(variables.at(op))
        }
    }

    return stack.pop()
}

#let al-tree-head-2dpos(tree, both: false) = {
    // get position of head operator
    if tree.children.len() == 0 {
        return 0

    } else if tree.children.len() == 1 {
        return if both {
            1 + al-tree-head-2dpos(tree.children.at(0), both: both)
        } else {
            0
        }

    } else if tree.children.len() == 2 {
        if both {
            // parentheses 2x + op + ...
            return 4 + (al-tree-head-2dpos(tree.children.at(0), both: both) +
                al-tree-head-2dpos(tree.children.at(1), both: both))

        } else {
            // parentheses 1x + ...
            return 1 + al-tree-head-2dpos(tree.children.at(0), both: true)
        }

    } else {
        panic()
    }
}

#let al-run(variables,
    term,
    is-postfix: false, // already is postfix
    is-tree: false, // already is tree
    tree-mode: false, // work with tree
    t: true,
    f: false) = {

    let postfix = if is-postfix or is-tree {
        term
    } else {
        al-parser(al-tokenizer(term))
    }

    if tree-mode {
        let tree = if is-tree {
            postfix
        } else {
            al-postfix-to-tree(postfix)
        }

        if tree.len() == 0 { // ???
            panic()

        } else if tree.len() == 1 { // p, q, r, ...
            let tree = (
                head: tree.at(0),
                value: al-run(variables, tree),
                children: ()
            )

            return tree

        } else if tree.len() == 2 or tree.len() == 3 {
            let postfix = al-tree-to-postfix(tree)
            let val = if al-run(variables, postfix, is-postfix: true) { t } else { f }

            tree = (
                value: val,
                head: tree.at(0),
                children: tree.slice(1)
                    .map(e => al-run(variables, e, is-tree: true, tree-mode: true))
            )

            return tree

        } else {
            panic()
        }

    } else {
        return if al-evaluator(variables, postfix) { t } else { f }
    }
}

#let al-evaluated-tree-to-table-array(tree, depth: 0) = {
    if type(tree) != dictionary {
        return tree

    } else if tree.children.len() == 0 { // p, q, r, ...
        return tree.value

    } else if tree.children.len() == 1 {
        return (tree.value, al-evaluated-tree-to-table-array(tree.children.at(0), depth: depth + 1)).flatten()

    } else if tree.children.len() == 2 {
        if depth == 0 {
            return (
                al-evaluated-tree-to-table-array(
                    tree.children.at(0),
                    depth: depth + 1),
                tree.value,
                al-evaluated-tree-to-table-array(
                    tree.children.at(1),
                    depth: depth + 1),
            ).flatten()

        } else {
            return (
                none,
                al-evaluated-tree-to-table-array(
                    tree.children.at(0),
                    depth: depth + 1),
                tree.value,
                al-evaluated-tree-to-table-array(
                    tree.children.at(1),
                    depth: depth + 1),
                none
            ).flatten()
        }

    } else {
        panic()
    }
}

#let al-beautify-tree(tree) = {
    let helper(tree, depth) = {
        let val = tree.head
            .replace("-", " not ")
            .replace("|", " or ")
            .replace("/", " triangle.stroked.b ")
            .replace("&", " and ")
            .replace(">", " -> ")
            .replace("=", " <-> ")

        if tree.children.len() == 0 {
            return val

        } else if tree.children.len() == 1 {
            return (val, helper(tree.children.at(0), depth + 1))

        } else if tree.children.len() == 2 {
            let (b1, b2) = ("(", ")")

            if depth == 0 {
                (b1, b2) = ("", "")
            }

            return (b1,
                helper(tree.children.at(0), depth + 1),
                val,
                helper(tree.children.at(1), depth + 1),
                b2).flatten().filter(e => e != "")

        } else {
            panic()
        }
    }

    (helper(tree, 0),).flatten().map(e => eval("$"+e+"$"))
}

#let al-beautify(expression) = {
    if type(expression) != "string" {
        return expression
    }

    eval("$"+expression.replace("-", " not ")
        .replace("|", " or ")
        .replace("/", " triangle.stroked.b ")
        .replace("&", " and ")
        .replace(">", " -> ")
        .replace("=", " <-> ")+"$")
}

#let truth-table(..expressions,
    t: [w],
    f: [f],
    highlight-mode: "" // heads, necessity, deduction, equivalence
) = {

    let expressions = expressions.pos()
    let expression-trees = (:)

    let variables = ()
    let rows = ()

    let t = text(size: 0.8em, t)
    let f = text(size: 0.8em, f)

    for expression in expressions {
        for token in al-tokenizer(expression) {
            if not is-operator(token) and token not in ("(", ")") and token not in variables {
                variables.push(token)
            }
        }
    }

    let names = variables.sorted()

    // generate all possibilities of truth value combinations
    let cartesian-prod(arr1, arr2) = {
        let product = ()

        for el1 in arr1 {
            for el2 in arr2 {
                product.push((el1, el2).flatten())
            }
        }

        product
    }

    let cartesian-pow(arr, pow) = {
        let product = arr

        while pow > 1 {
            product = cartesian-prod(product,arr)
            pow = pow - 1
        }

        product
    }

    let combinations = if names.len() == 1 {
        ((true, false), (false, true))
    } else {
        cartesian-pow((true, false), names.len())
    }

    // todo: highlight modes

    for combination in combinations {
        let row = ()
        let variables = (:)

        for v in names {
            let truth-values = combination.at(names.position(e => e == v))

            row.push(truth-values)
            variables.insert(v, truth-values)
        }

        for expression in expressions {
            let postfix = al-parser(al-tokenizer(expression))
            let eval-tree = al-run(
                variables,
                postfix,
                tree-mode: true,
                is-postfix: true)

            let val = al-evaluated-tree-to-table-array(eval-tree)

            expression-trees.insert(expression, eval-tree)
            row.push(val)
        }

        rows.push(row.flatten())
    }

    let head-positions = expression-trees.values()
        .map(e => al-tree-head-2dpos(e))
        .flatten()

    let beautified-trees = expression-trees.values()
        .map(e => al-beautify-tree(e))

    /*
        HEADS
    */
    let highlights-heads = ()
    let head-positions-markers = (variables.len()) * (none,)

    for i in range(beautified-trees.len()) {
        let rr = beautified-trees.at(i).map(e => none)
        rr.at(head-positions.at(i)) = $arrow.t$

        head-positions-markers = (head-positions-markers + rr).flatten()
    }

    // absolute positions where the arrows are
    let head-absolute-positions = head-positions-markers.enumerate()
        .filter(e => e.at(1) != none)
        .map(e => e.at(0))

    let highlights-heads = head-absolute-positions.map(e => (
        e,
        -1,
        colors.blue.lighten(75%)))

    /*
        DEDUCTION
    */
    let highlights-deduction = ()

    {
        let y = 1
        for row in rows {
            let heads = head-absolute-positions.slice(0, head-absolute-positions.len() - 1)
            let conclusion = head-absolute-positions.last()

            let heads-values = row.enumerate()
                .filter(e => e.at(0) in heads)
                .map(e => e.at(1))
                .flatten()

            let conclusion-value = row.enumerate()
                .filter(e => e.at(0) == conclusion)
                .map(e => e.at(1))
                .flatten()
                .first()

            if heads-values.filter(e => e != true).len() == 0 {
                highlights-deduction.push((-1, y, if conclusion-value {
                    colors.blue.lighten(50%)
                } else {
                    colors.magenta.lighten(50%)
                }))

                highlights-deduction += head-absolute-positions.map(e => (
                    e,
                    y,
                    if conclusion-value {
                        colors.blue
                    } else {
                        colors.magenta
                    }
                ))
            }


            y += 1
        }
    }

    /*
        EQUIVALENCE
    */
    let highlights-equivalence = ()

    {
        let y = 1
        for row in rows {
            let heads-values = head-absolute-positions.map(e => row.at(e))

            highlights-equivalence += head-absolute-positions.map(e => (
                e,
                y,
                if heads-values.dedup().len() == 1 {
                    colors.blue.lighten(50%)
                } else {
                    colors.magenta.lighten(50%)
                }))

            y += 1
        }
    }

    // points to add a little inset in x-direction
    let spacers = (variables + (variables.len() + 1,)).enumerate()
        .map(e => e.at(0))

    // 2d arrays of (coord, color)
    let highlight-coords = ()

    if "heads" in highlight-mode {
        highlight-coords += highlights-heads
    }

    if "deduction" in highlight-mode {
        highlight-coords += highlights-deduction
    }

    if "equivalence" in highlight-mode {
        highlight-coords += highlights-equivalence
    }

    for i in beautified-trees {
        if spacers.len() == 0 {
            spacers.push(variables.len() + i.len())
            continue
        }

        spacers.push(spacers.last() + i.len())
    }

    // generate table
    table(columns: (auto,)*(beautified-trees.flatten().len() + names.len()),
        align: center + horizon,
        stroke: 0pt,

        fill: (x, y) => {
            let t = highlight-coords.filter(e =>
                (x == e.at(0) and y == e.at(1)) or
                (e.at(0) == x and e.at(1) == -1 and y > 0 and y < calc.pow(2, variables.len()) + 1) or
                (e.at(0) == -1 and e.at(1) == y)
            )

            if t.len() > 0 {
                color.mix(..t.map(e => e.at(2)))
            }
        },

        inset: (x, y) => if x in spacers and x+1 in spacers {
            5pt

        } else if x in spacers {
            (left: 5pt, right: 1.25pt)

        } else if x in spacers.map(e => e - 1) {
            (left: 1.25pt, right: 5pt)

        } else if x == variables.len() {
            (left: 5pt, right: 1.25pt)

        } else if x > variables.len() {
            (x: 1.25pt)
        } else {
            5pt
        },

        ..names.map(e => (
            al-beautify(e),
            table.vline(end: calc.pow(2, variables.len()) + 1, stroke: 0.5pt))
        ).flatten(),

        table.vline(end: calc.pow(2, variables.len()) + 1, stroke: 1.5pt),

        ..beautified-trees.enumerate().map(((index, e)) => if index == 0 { e } else { (
            table.vline(end: calc.pow(2, variables.len()) + 1, stroke: 0.5pt),
            e) }
        ).flatten(),

        table.hline(stroke: 1pt),

        ..rows.enumerate().map(((index, _)) => table.hline(stroke: 0.5pt, y: index + 1)),

        ..rows.flatten().enumerate().map(((index, e)) => {
            let c = if e == true {
                t
            } else if e == false {
                f
            } else {
                e
            }

            c
        }).flatten(),

        ..head-positions-markers)
}