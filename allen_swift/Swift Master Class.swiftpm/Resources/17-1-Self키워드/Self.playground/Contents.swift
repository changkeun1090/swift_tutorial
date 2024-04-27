import UIKit


/*:
 # self  vs  Self
 */
/*:
 ## self키워드의 사용 (소문자)
* 간단한 중첩 타입의 예제
---
*/
// 1) 인스턴스를 가르키기 위해 사용

class Person {
    var name: String
    init(name: String) {
        self.name = name // self 키워드 없으면 name은 가장 가까운 파라미터를 참조한다.-> Error! let으로 정의되었기에
    }
}
 

class Person2 {
    var name: String
    init() {
        name = "hello" // 파라미터에 name 없으니 self 키워드 없어도 name은 저장속성의 name을 참조한다.
    }
}

var person2 = Person2()
person2.name // "hello"


// 2) 새로운 값으로 속성 초기화 가능한 패턴 (값타입에서)

struct Calculator {
    var number: Int = 0
    
    mutating func plusNumber(_ num: Int) {
        number = number + num
    }
    
    // 값 타입(구조체, 열거형)에서 인스턴스 값 자체를 치환 가능 / 클래스에서는 반드시 생성자가 필요하기 때문에 아래와 같은 패턴 불가능
    mutating func reset() {
        self = Calculator()    // 값 타입은 새로 생성해서 치환하는 것도 가능
    }
}

var cal = Calculator()
cal.number = 5
cal.plusNumber(5)
cal.number       // 10

cal.reset()      // 새로운 인스턴스를 생성하여 할당!
cal.number       // 0



// 3) 타입멤버에서 사용하면, 인스턴스가 아닌 타입 자체를 가르킴

struct MyStruct {
    static let club = "iOS부서"

    // 타입속성에 접근하기 위해서는 Type.property 형식이 필요하지만, 예외적으로 타입 메서드 안에서는 Type 대신 Self를 사용한다.
    static func doPrinting() {
        print("소속은 \(self.club)입니다.")
    }
    
    // 인스턴스 메서드에서 self 사용시 self는 인스턴스를 참조하며, club은 타입속성 이기에 ERROR 발생
        // 인스턴스 메서드에서 타입에 접근하기 위해서는 self 대신 타입명 MyStruct을 적어야 한다.
    func doPrinting() {
        print("소속은 \(MyStruct.club)입니다.")
    }
}

var str = MyStruct()
str.doPrinting()  // "소속은 iOS부서입니다."


// 4) 타입 인스턴스를 가르키는 경우에 사용 (외부에서 타입을 가르키는 경우)
// 타입 인스턴스 -> 데이터 영역에 존재하는 "붕어빵 틀"을 가르킨다.

class SomeClass {
    static let name = "SomeClass"
}

 
let myClass: SomeClass.Type = SomeClass.self
// SomeClass.Type ===> 메타타입 (후반부에 다룰 예정)

print(myClass) // SomeClass

// SomeClass.self.name에서 self를 생략한것
SomeClass.name          // "SomeClass"

SomeClass.self.name     // "SomeClass"


Int.max
Int.self.max



/*:
## Self키워드의 사용 (대문자)
* (특정 타입 내부에서) 해당 타입을 가르키는 용도로 Self를 사용
---
*/
// 1) 타입을 선언하는 위치에서 사용하거나,
// 2) 타입속성/타입메서드를 지칭하는 자리에서 대신 사용 가능

extension Int {
    // 타입 저장 속성
    static let zero: Self = 0     // Int 타입
    //static let zero: Int = 0
    
    // 인스턴스 계산속성
    var zero: Self {  // 1) 타입을 선언하는 위치에서 사용
        return 99
    }
//    var zero: Int {
//        return 0
//    }
    
    // 2) 타입 속성/메서드에서 지칭
    static func toZero() -> Self {
        return Self.zero      // Int.zero
    }

    
    // 인스턴스 메서드
    func toZero() -> Self {
        return self.zero     // 5.zero
    }
}



Int.zero // 0
5.zero // 99

Int.toZero() // 0
5.toZero() // 99



/*:
---
* 프로토콜에서의 Self사용 (프로토콜을 채택하는 해당 타입을 가르킴)
---
*/
// 이진법으로 표현된 정수에서 쓰이는 프로토콜
// 프로토콜의 확장 ===> 구현의 반복을 줄이기 위한 문법

extension BinaryInteger {
    func squared() -> Self {  // 프로토콜을 채택한 타입자체를 가르킴
        return self * self    // 인스턴스(7)를 가르킴
    }
}

// 간단하게 얘기하면 Int, UInt 간에도 비교가능하도록 만드는 프로토콜
// (타입이 다름에도 비교가 가능)

let x1: Int = -7
let y1: UInt = 7


if x1 <= y1 {
    print("\(x1)가 \(y1)보다 작거나 같다.")
} else {
    print("\(x1)가 \(y1)보다 크다.")
}



// 실제로는 Int가 BinaryInteger 프로토콜을 채택
// Int에 기본구현으로 squared() 메서드가 제공  ===>  func squared() -> Int {..}


7.squared()


protocol Remote {
    func turnOn() -> Self
}

extension Int: Remote {
    func turnOn() -> Int { // 에디터가 자동으로 Int 타입임을 알려준다.
        return 0
    }
}




//Copyright (c) 2021 we.love.code.allen@gmail.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//distribute, sublicense, create a derivative work, and/or sell copies of the
//Software in any work that is designed, intended, or marketed for pedagogical or
//instructional purposes related to programming, coding, application development,
//or information technology.  Permission for such use, copying, modification,
//merger, publication, distribution, sublicensing, creation of derivative works,
//or sale is expressly withheld.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.
