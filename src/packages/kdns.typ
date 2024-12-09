#let parse-str(line, index) = {
    let tmp = ""

    while index < line.len() and line.at(index) != "\"" {
        if line.at(index) == "\\" {
            tmp += line.at(index+1)
            index += 2
            continue
        }

        tmp += line.at(index)
        index += 1
    }

    (tmp, index)
}

#let parse-part(line, index) = {
    let line = line.split("")
    let index = index
    let tmp = ""
    let is_str = true

    while index < line.len() and line.at(index) != "," {
        if line.at(index) == "\"" {
            let r = parse-str(line, index+1)
            tmp = r.at(0)
            index = r.at(1)+1
            continue
        }

        tmp += line.at(index)
        index += 1
    }

    (tmp.trim(), index)
}

#let parse-line(line) = {
    let ret = ("label": "",
        "rule": "",
        "content": "",
        "references": (),
        "explanation": none)

    let types = ("label", "content", "rule", "references", "explanation")
    let type_index = 0
    let index = 0

    while index < line.len() and type_index < types.len() {
        let r = parse-part(line, index)
        ret.at(types.at(type_index)) = r.at(0).trim()

        index = r.at(1)+1
        type_index += 1
    }

    if "!" in ret.references {
        let raw = ret.references

        ret.references = raw.split("!")
            .at(0)
            .split("&")
            .map(e => e.split("."))
            .flatten()
            .map(e => e.trim())

        ret.remove_references = raw.split("!")
            .at(1)
            .split("&")
            .map(e => e.split("."))
            .flatten()
            .map(e => e.trim())

    } else {
        ret.references = ret.references.split("&")
            .map(e => e.split("."))
            .flatten()
            .map(e => e.trim())

        ret.remove_references = ()
    }

    ret
}

#let bin2int(int) = {
    let res = 0
    let int = repr(int)

    let i = 0
    while i < int.len() {
        res += (if int.at(i) == "1" { 1 } else {0}) * math.pow(2, i)
        i += 1
    }

    res
}

#let int2bin(int) = {
    let res = ""
    let int = int

    while int > 0 {
        res += repr(calc.rem(int, 2))
        int = calc.floor(int / 2)
    }

    res.split("").rev().join("")
}

#let lor(str1, str2) = {
    let ret = ""
    let i = 0

    let smaller = (if str1.len() < str2.len() { str1 } else { str2 }).split("")
        .rev()
        .join()

    let bigger = (if str1.len() < str2.len() { str2 } else { str1 }).split("")
        .rev()
        .join()

    while i < smaller.len() {
        if smaller.at(i) == "1" or bigger.at(i) == "1" {
            ret += "1"
        } else {
            ret += "0"
        }

        i += 1
    }

    while i < bigger.len() {
        ret += bigger.at(i)
        i += 1
    }

    ret.split("").rev().join()
}

#let land(str1, str2) = {
    let ret = ""
    let i = 0

    let smaller = (if str1.len() < str2.len() { str1 } else { str2 }).split("")
        .rev()
        .join()

    let bigger = (if str1.len() < str2.len() { str2 } else { str1 }).split("")
        .rev()
        .join()

    while i < smaller.len() {
        if smaller.at(i) == "1" and bigger.at(i) == "1" {
            ret += "1"
        } else {
            ret += "0"
        }

        i += 1
    }

    while i < bigger.len() {
        ret += bigger.at(i)
        i += 1
    }

    ret.split("").rev().join()
}

#let lnot(str1) = {
    let ret = ""

    for c in str1 {
        if c == "0" {
            ret += "1"
        } else if c == "1" {
            ret += "0"
        }
    }

    ret
}

#let is-premise(str) = {
    return str.trim() in ("P", "Prämisse", "Prämisseneinführung", "Ann.", "Ann", "Annahme", "ZA", "Zusatzannahme")
}

#let parse-body(show_premises: false,
    show_header: true,
    premises_as_numbers: false,
    numbering: n => numbering("1.", n),
    ref-numbering: n => numbering("1", n),
    show_indentation: false,
    body) = {

    let t_columns = ()
    let t_body = ()
    let lines = ()
    let premises = (:)
    let labels = (:)

    for line in body.text.split("\n").map(e => e.trim()) {
        if line.trim().starts-with("//") {
            continue
        }

        lines.push(parse-line(line))
    }

    // get premises
    let premises_count = 0
    let line_count = 0

    for line in lines {
        line_count += 1

        if is-premise(line.rule) {
            premises.insert(line.label, (premises_count, line_count))
            premises_count += 1
        }

        labels.insert(line.label, line_count)
    }

    // generate each line
    let i = 1
    let premises_index = 0
    let premises_store = ("0"*premises_count,) // list of all premises-stars per line

    // linecount, content, references, rule, explanation
    let all_rows = (
        "1line_count": (),
        "2content": (),
        "3references": (),
        "4rule": ()
    )

    let has_explanations = false

    for line in lines {
        // let's see if explanations have to be shown
        if line.explanation != none {
            has_explanations = true
            all_rows.insert("5explanation", ())
        }
    }

    for line in lines {
        let refs = ()
        let p = "0" * premises_count

        if is-premise(line.rule) {
            p = lor(p, int2bin(calc.pow(2, premises_index)))
            premises_index += 1

        } else {
            for r in line.references {
                if r in premises.keys() { // reference is a premise
                    p = lor(p, int2bin(calc.pow(2, premises.at(r).at(0))))
                    refs.push(premises.at(r).at(1))

                } else { // reference is not a premise
                    p = lor(p, premises_store.at(labels.at(r)))
                    refs.push(labels.at(r))
                }
            }

            for r in line.remove_references {
                let old_p = p

                if r in premises.keys() { // reference is a premise
                    p = land(p, lnot(int2bin(calc.pow(2, premises.at(r).at(0)))))
                }
            }
        }

        let columns = (:)

        // return (error: true, debug: (premises, premises_store))

        if show_premises {
            if not premises_as_numbers {
                let i = 0

                for c in p.split("").rev() {
                    if c == "1" {
                        columns.insert("0p"+str(i), "$ast.op$")
                    } else if c == "0" {
                        columns.insert("0p"+str(i), "")
                    }

                    i += 1
                }

            } else {
                let line_premises = ()
                let i = 0

                for c in p.split("").rev() {
                    if c == "1" {
                        line_premises.push(str(premises
                            .at(default: (0, "none2"), premises.keys().at(i - 1, default: "none"))
                            .at(1)))
                    }

                    i += 1
                }

                // if is-premise(line.rule) {
                //     columns.insert("0premises", "["+line.number+"]")
                // } else {
                    columns.insert("0premises", "emph["+line_premises.join(", ")+"]")
                // }
            }
        }

        columns.insert("1line_count", "["+if line.label != "!" { numbering(i) }+"]")      // line count

        if not show_indentation {
            let indent = "#h(1.5em)"
            line.content = line.content.trim()

            while line.content.starts-with(indent) {
                line.content = line.content
                    .slice(indent.len(), count: line.content.len()-indent.len())
                    .trim()
            }
        }

        columns.insert("2content", "$"+line.content+"$")    // line content

        // line references
        columns.insert("3references", "[#emph(["+if refs.len() != 0 {
            refs.map(e => ref-numbering(e)).join(", ")
        } else {
            ""
        }+"])]")

        columns.insert("4rule", "["+line.rule+"]") // line rule

        if has_explanations {
            columns.insert("5explanation", "align(left)["+line.explanation+"]") // line explanation
        }

        for key in all_rows.keys() {
            all_rows.at(key).push(columns.at(key))
        }

        t_body.push(columns)

        premises_store.push(p.split("")
            .filter(e => (e == "0" or e == "1"))
            .join())

        i += 1
    }

    // remove empty all_rows from t_body
    for key in all_rows.keys() {
        if all_rows.at(key).join("")
            .trim("")
            .replace("[", "")
            .replace("]", "") == "" {

            let n_tb = ()

            for b in t_body {
                if key in b {
                    b.remove(key)
                }

                n_tb.push(b)
            }

            let _ = all_rows.remove(key)
            t_body = n_tb
        }
    }

    let header = (:)

    if show_premises {
        if not premises_as_numbers {
            let i = 0
            while i < premises_count {
                header.insert("0p"+str(i), "strong([P])")
                i += 1
            }

        } else {
            header.insert("0pHead", "Abh.")
        }
    }

    for k in all_rows.keys().map(e => (e, e.replace("1line_count", "strong[Nr.]")
            .replace("2content", "strong[Schema]")
            .replace("3references", "strong[Ref.]")
            .replace("4rule", "strong[R.]")
            .replace("5explanation", "strong[E.]"))) {

        header.insert(k.at(0), k.at(1))
    }

    if show_header {
        t_body.insert(0, header)
    }

    return (error: false,
        "premises_count": premises_count,
        "header": header,
        "rows": t_body.map(e =>
            e.keys().map(k =>
                e.at(k))))
}

#let logic-kdns(centered: true,
    show_premises: false,
    show_header: false,
    premises_as_numbers: false,
    show_indentation: false,
    stroke: none,
    numbering: n => numbering("1.", n),
    ref-numbering: n => numbering("1", n),
    body) = {

    let body = parse-body(show_premises: show_premises,
        show_header: show_header,
        premises_as_numbers: premises_as_numbers,
        numbering: numbering,
        ref-numbering: ref-numbering,
        show_indentation: show_indentation,
        body)

    if body.error {
        return body.debug
    }

    let t = table(columns: body.header.len(),
        stroke: stroke,
        align: top,
        inset: 0em,
        column-gutter: 1.25em,
        row-gutter: 0.65em,

        ..body.rows.flatten()
            .map(e => eval(e)))

    if centered {
        align(center, block(align(left, t)))
    } else {
        t
    }
}

/*
LINE: label, content, rule, references, explanation

example:
a, p -> q, P
b, q -> r, P
c, p, P
d, q, AL, a&c
e, r, AL, b&d
*/


#let kdns = logic-kdns.with(numbering: n => numbering("(1)", n),
    ref-numbering: n => numbering("1", n),
    centered: false,
    show_premises: false,
    premises_as_numbers: true)