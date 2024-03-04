#let semester(date) = {
    let wise = [Wintersemester]
    let sose = [Sommersemester]

    let sem = wise

    let year = if date.month() < 4 or date.month() > 9 {
        date.year() - 1
    } else {
        sem = sose
        date.year()
    }

    [#sem ]

    if sem == wise {
        [#year/#(year+1)]

    } else {
        [#year]
    }
}

#let weekday(daynr) = (
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag"
).at(daynr - 1)