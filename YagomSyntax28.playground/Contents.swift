import Cocoa

// higher - order function 고차함수

// 전달인자로 함수를 전달받거나
// 함수실행의 결과를 함수로 반환하는 함수

// map, filter, reduce

// map
// 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
// 컨테이너 - Array, Dictionary, Set 이런 애들

let numbers: [Int] = [0,1,2,3,4] // 하나하나의 요소를 변환하고 싶음
var doubledNumbers: [Int] // 2배로
var strings: [String] // 문자열로




// for 구문 사용 - 귀찮음
doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers) // [0,2,4,6,8]
print(strings) // ["0","1","2","3","4"]



// map 메소드를 사용 - 클로저가 들어감
// numbers의 각 요소를 2배하여 새로운 배열 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map ({ (number: Int) -> String in
    return "\(number)"
})
print(doubledNumbers) // [0,2,4,6,8]
print(strings) // ["0","1","2","3","4"]




// filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출



// for 구문 사용
// 변수 사용에 주목하자
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0,2,4]



// filter 메소드 사용
// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter {
    (number: Int) -> Bool in
    return number % 2 == 0
}

print(evenNumbers) // [0,2,4]




// reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합

let someNumbers: [Int] = [2,8,15]



// for 구문 사용
// 변수 사용에 주목하자
var result: Int = 0

// someNumbers의 모든 요소를 더한다.
for number in someNumbers {
    result += number
}

print(result) // 25



// reduce 메소드 사용
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더한다.
let sum: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
    
    return first + second
})

print(sum) // 25



// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺀다.
var subtract: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
    
    return first - second
})

print(subtract) // -25



// 초기값이 3이고 someNumbers 내부의 모든 값을 더한다.
/*
 
let sumFromThree: Int = someNumbers.reduce(3, {
    (first: Int, second: Int) -> Int in

    return first + second
})

print(sumFromThree) // 28

 */

let sumFromThree: Int = someNumbers.reduce(3) {
    $0 + $1
}
print(sumFromThree) // 28
