import UIKit

print("Task1\n")
let bestiesName = "Narmin"
print("My bestie's name is \(bestiesName)\n")

print("Task2\n")
//let myName = "Ismayil"
//let address = "Baku, 22 Daghlik street"
//print("My name is \(myName)\n")
//print("My address is \(address)\n")
print("My name is Ismayil\nMy address is Baku, 22 Daghlik street")

print("Task3\n")
let randomNumber : Int = Int.random(in: 10...20)
print(randomNumber)
print(randomNumber/4)

print("Task4\n")
let randomnumbers: Int = Int.random(in: 0...100)
let a = randomnumbers
if a < 22 {
    print("\(a) is smaller than 22")
}
if a > 22 {
    print("\(a) is bigger than 22")
}
print("Reminder of division of \(a) by 2 is \(a%2)")

print("Task5\n")
let randomX: Int = Int.random(in: 0...100)
let randomY: Int = Int.random(in: 0...100)
let randomZ: Int = Int.random(in: 0...100)
let x = randomX
let y = randomY
let z = randomZ
print("The sum of \(x), \(y), and \(z) is \(x + y + z)")


