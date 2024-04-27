import UIKit


/*:
## 클로저의 캡처
* 클로저의 Capturing Value
---
*/
var stored = 0


let closure = { (number: Int) -> Int in
    stored += number
    return stored
}

closure(3)

closure(4)   // 어떤 결과가 나올까?

closure(5)

stored = 0

closure(5)   // 어떤 결과가 나올까?







/*:
 ## 캡처 현상
 * 일반적인 함수
 ---
 */
// 함수 내에서 함수를 실행하고, 값을 리턴하는 일반적인 함수

func calculate(number: Int) -> Int {
    
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    
    let result = square(num: number)
    
    return result
}


calculate(number: 10)
calculate(number: 20)
calculate(number: 30)



/*:
 ---
 * 변수를 캡처하는 함수(중첩 함수의 내부 함수) - 캡처 현상의 발생
 ---
 */
/**=======================================================
 - 아래와 같은 경우, 중첩함수로 이루어져 있고
 - 내부 함수 외부에 계속 사용해야하는 값이 있기 때문에 캡처 현상이 발생
 
 - (함수/클로저를 변수에 저장하는 시점에 캡처) ==> 클로저도 레퍼런스 타입
=========================================================**/


func calculateFunc() ->  ((Int) -> Int) {
    
    var sum = 0
    // 만약 var sum이 전역 변수라면?
    // heap의 클로저는 sum을 값타입으로 복사하지 않고 참조타입으로 가진다. - 스택 프레임이 사라지지 않으므로
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    
    return square
}




// 함수를 변수에 저장하는 경우(Heap 메모리에 유지)
    // 스택에 변수 squareFunc가 존재하며 클로저 주소를 가지고 클로저는 아래 두 가지를 가진다.
        // 1. square 함수
        // 2. square 함수가 사용하는 변수 (sum)
var squareFunc = calculateFunc()

//var anotherFunc = calculateFunc()

squareFunc(10) // 100
squareFunc(20) // 500 ??
squareFunc(30) // 1,400 ??
// capture 현상이 발생하는 중 -> 어디에서??

//anotherFunc(5) // 25
//anotherFunc(5) // 50
// squareFunc에 영향을 주지 않는다.



// 변수에 저장하지 않는 경우
// - Heap메모리에 유지하지 않고 스택 프레임에서만 실행되고 사라진다.

calculateFunc()(10) // 100
calculateFunc()(20) // 400
calculateFunc()(30) // 900



// 레퍼런스 타입 - Heap에 존재하는 클로저의 주소를 전달
var dodoFunc = squareFunc
dodoFunc(20) // 1,800









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
