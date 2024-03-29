import UIKit



/*:
 ## 3) 세트(Set)
 * 집합: 수학에서의 집합과 비슷한 연산을 제공하는 컬렉션
 ---
 */
/**==============================================================
 - Set의 문법 약속
 - 생김새는 배열과 같음(따라서, 생성시 타입을 선언 해야함)
 - 수학에서의 집합과 동일하기 때문에 요소는 유일해야함(순서가 존재하지 않음)
 ================================================================**/


var set: Set = [1, 1, 2, 2, 3, 3, 3] // 배열과 혼돈되지 않도록 반드시 타입 명시!

print(set) // [1, 3, 2]



/*:
---
* Set을 언제 사용하는가?
---
*/
//:> Set의 값과 Dictionary의 키값은 Hashable
// 정렬순서보다 검색속도가 중요한 경우에 사용
// 검색에 내부적으로 Hashing 알고리즘 사용
// (hashing ===> 특정값을 고정된 길이의 값으로 변환하는 기법으로 인덱싱과 암호화에서 자주 사용됨)


// 또는 유일하면서, 집합의 수학적인 개념(합집합/교집합/차집합/대칭차집합)을 이용할 필요가 있을 때 (집합을 계산하기 간편한 함수를 내장)


/*:
 ---
 * Set의 타입 표기
 ---
 */
// 단축문법
let set1: Set = [1, 2, 3]

// 정식문법
let set2: Set<Int> = [1, 2, 3]



/*:
 ---
 * 빈 Set의 생성
 ---
 */
let emptySet: Set<Int> = []
let emptySet1 = Set<Int>()



/*:
 ---
 * Set의 기본 기능
 ---
 */
set.count
set.isEmpty


set.contains(1)
set.randomElement()



/*:
 ---
 * 업데이트 (update) - 삽입하기 / 교체하기 / 추가하기
 ---
 */
// 서브스크립트 관련 문법 없음 ⭐️ -> 순서도 key값도 없기 때문에

set = [1, 1, 2, 2, 3, 3, 3]

// (정식 기능) 함수 문법

set // [1, 3, 2]

set.update(with: 1)     // 1
// 기존의 "1"을 반환하고 새로운 "1"을 추가한다.

set.update(with: 7)     // nil
// 기존의 "7"이 없으므로 nil을 반환하고 새로운 "7"을 추가한다.

print(set) // [3, 1, 2, 7]

//:> Set는 append 함수를 제공하지 않음
// append는 순서가 있는 컬렉션의 끝에 추가하는 개념
// Set은 순서가 없기 때문에, update를 통해서 추가




/*:
 ---
 * 삭제(제거)하기 (remove)
 ---
 */
var stringSet: Set<String> = ["Apple", "Banana", "City", "Swift"]


// 요소 삭제해 보기
stringSet.remove("Swift")   // Optional("Swift")
// 옵셔널로 삭제한 요소를 리턴 (삭제하고 싶은 요소가 존재하지 않을 수 있기 때문에)
print(stringSet)                     // ["Banana", "Apple", "City"]



// 존재하지 않는 요소를 삭제해보기
stringSet.remove("Steve")       // nil    (에러는 발생하지 않음)



// 전체요소 삭제
stringSet.removeAll()
stringSet.removeAll(keepingCapacity: true)





/*:
## Set의 활용
* Set의 정의
---
*/
var a: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set = [1, 3, 5, 7, 9]
var c: Set = [2, 4, 6, 8, 10]
var d: Set = [1, 7, 5, 9, 3]


/*:
 ---
 * Set의 비교
 ---
 */
a == b
a != b

//Set(정렬되지 않은 컬렉션)은 어짜피 순서는 중요하지 않음
b == d  // 항상 true


/*:
---
* 부분집합 / 상위집합 / 서로소
---
*/
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]     // 홀수 모음
c = [2, 4, 6, 8, 10]    // 짝수 모음
d = [1, 7, 5, 9, 3]     // 홀수 모음



// 부분집합 여부를 판단

b.isSubset(of: a)   // true
// b가 a의 부분집합인가?

b.isStrictSubset(of: a)   // true 
// 진부분집합 여부 (a와 똑같지 않은 부분집합)



// 상위집합

a.isSuperset(of: b)    // true 상위집합 여부
a.isStrictSuperset(of: b)   // true  진상위집합 여부


// 서로소 여부: 겹치는 원소가 없을 때 서로소

d.isDisjoint(with: c) // true



/*:
---
* 합집합
---
*/
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]
d = [1, 7, 5, 9, 3]



var unionSet =  b.union(c)
// b와 c 원본은 변하지 않는다.

print(unionSet) // [9, 4, 7, 1, 5, 6, 3, 2, 8, 10]

//b.formUnion(c)
print(b) // [3, 1, 8, 6, 10, 2, 9, 7, 4, 5]
print(c) // [6, 8, 2, 10, 4]
// b의 원본이 변경: c와 b의 합집합이 b가 된다.

/*:
---
* 교집합
---
*/

var interSet = a.intersection(b)

print(interSet) // [9, 3, 7, 5, 1]

//a.formIntersection(b)      // 원본변경
print(a) // [1, 7, 3, 5, 9]
/*:
---
* 차집합
---
*/

var subSet = a.subtracting(b)

print(subSet)   // [2, 8, 6, 4]

//a.subtract(b)       // 원본변경
print(a) // [4, 6, 2, 8]
/*:
---
* 대칭차집합
---
*/

var symmetricSet = a.symmetricDifference(b)

//a.formSymmetricDifference(b)       // 원본변경





/*:
 ---
 * 반복문과의 결합
 ---
 */

let iteratingSet: Set = [1, 2, 3]


for num in iteratingSet {    // 정렬되지 않은 컬렉션이기 때문에, 실행할때마다 순서가 달라짐
    print(num)
}




/*:
 ---
 * 기타 유의점
 ---
 */

var newSet: Set = [1, 2, 3, 4, 5]

var newArray: Array = newSet.sorted()
// set을 정렬하는 순간 순서가 필요하게 되어 배열로 타입이 변하게 된다.


//:> Set을 정렬하면, 배열로 리턴함 (정렬은 순서가 필요하기 때문)







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
