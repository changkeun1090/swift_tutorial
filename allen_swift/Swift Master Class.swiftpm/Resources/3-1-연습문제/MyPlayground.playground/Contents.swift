import UIKit

var com = Int.random(in: 1...10)
var mine = 3;

switch com {
case mine:
    print("bingo!")
case let x where x > mine:
    print("up!")
case let x where x < mine:
    print("down!")
default:
    break;
}




