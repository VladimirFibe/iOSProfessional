import SwiftUI

var greeting = "Hello, playground"
print(greeting)

let twoDollars = "$2"
var wallet = "$5"
wallet = "$0"

struct Player {
    let name = "Tron"
    var highscore = "500"
    var display: String {
        name + " " + highscore
    }
}

let player1 = Player()
player1.name
player1.highscore
player1.display
var player2: Player? = nil
player2 = player1
if let player2 {
    print("Player 2 has a value: \(player2)")
} else {
    print("Player 2 is nil")
}
