import UIKit

struct dataStruct {
    let name: String
    let firstSurname: String
    let secondSurname: String
    let dateOfBirth: String
    let id: Int
    let gender: String
    let email: String
    let numberOfSiblings: Int
    var username: String?
}

var list = [
    dataStruct(name: "CARLOS JOSÉ", firstSurname: "ROBLES", secondSurname: "GOMES", dateOfBirth: "06/08/1995", id: 78451245, gender: "Male", email: "carlos.roblesg@hotmail.com", numberOfSiblings: 2, username: nil),
    dataStruct(name: "MIGUEL ANGEL", firstSurname: "QUISPE", secondSurname: "OTERO", dateOfBirth: "28/12/1995", id: 79451654, gender: "Male", email: "miguel.anguel@gmail.com", numberOfSiblings: 0, username: nil),
    dataStruct(name: "KARLA ALEXANDRA", firstSurname: "FLORES", secondSurname: "ROSAS", dateOfBirth: "15/02/1997", id: 77485812, gender: "Female", email: "Karla.alexandra@hotmail.com", numberOfSiblings: 1, username: nil),
    dataStruct(name: "NICOLAS", firstSurname: "QUISPE", secondSurname: "ZEBALLOS", dateOfBirth: "08/10/1990", id: 71748552, gender: "Male", email: "nicolas123@gmail.com", numberOfSiblings: 1, username: nil),
    dataStruct(name: "PEDRO ANDRE", firstSurname: "PICASSO", secondSurname: "BETANCUR", dateOfBirth: "17/05/1994", id: 74823157, gender: "Male", email: "pedroandrepicasso@gmail.com", numberOfSiblings: 2, username: nil),
    dataStruct(name: "FABIOLA MARIA", firstSurname: "PALACIO", secondSurname: "VEGA", dateOfBirth: "02/02/1992", id: 76758254, gender: "Female", email: "fabi@hotmail.com", numberOfSiblings: 0, username: nil)
]


var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()


var listAge: [Int] = []

for element in list {
    let birthday = dateFormatter.date(from: element.dateOfBirth)
    let timeInterval = birthday?.timeIntervalSinceNow
    let age = abs(Int(timeInterval! / 31556926.0))
    listAge.append(age)
}


// oldest person:
var oldest: Int? = listAge.max()
let position = listAge.firstIndex(of: oldest!)
print("\(list[position ?? 0].name.capitalized) is the oldest becasuse he is \(oldest!).\n")


// youngest person:
var youngest:Int? = listAge.min()
let position2 = listAge.firstIndex(of: youngest!)
print("\(list[position2 ?? 0].name.capitalized) is the youngest becasuse she is \(youngest!).\n")

// only mens:
let mens = list.filter {
    $0.gender == "Male"
}
let numberOfMens = mens.count
print("There are \(numberOfMens) mens in the list.\n")

// only womens:

let womens = list.filter {
    $0.gender == "Female"
}
let numberOfWomens = womens.count
print("There are \(numberOfWomens) womens in the list.\n")

// people who have two or more siblings.

let moreThanTwoSiblings = list.filter {
    $0.numberOfSiblings >= 2
}

print("There are \(moreThanTwoSiblings.count) people who have two or more siblings.\n")

// printing the first name, the first surname and the first letter of the second surname.

let names = list.map{ $0.name.split(separator: " ") }
var firstName: [String] = []

for element in names {
    firstName.append(String(element[0]).capitalized)
}

let firstSurname = list.map{ $0.firstSurname.capitalized }
let secondSurname = list.map{ $0.secondSurname.first ?? " "}

print("Short names:")
for i in 0...5 {
    print("\(firstName[i]) \(firstSurname[i]) \(secondSurname[i]).")
}

// creating usernames
let emails = list.map{ $0.email.split(separator: "@")}
var username: [String] = []

for element in emails {
    username.append(String(element[0]))
}

print("\nUsernames:")
for i in 0...5 {
    list[i].username = username[i]
    print(list[i].username ?? "")
}

