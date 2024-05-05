import Foundation

var computerChoice = Int.random(in: 1...100)

//var myChoice = readLine()
var myChoice = 0

while myChoice != computerChoice {            
    let userInput = readLine()
    
    if let input = userInput {
        if let num = Int(input) {
            myChoice = num
        }
    }
    
    //print(myChoice)
    
    if computerChoice > myChoice {
        print("UP")
    } else if (computerChoice < myChoice) {
        print("DOWN")
    } else {
        print("BINGO")
    }
}
