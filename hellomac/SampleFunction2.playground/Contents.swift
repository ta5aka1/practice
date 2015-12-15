
var oddTotal = Array(1...10)
    .filter{(number) in number % 2 == 1}
    .reduce(0){(total, number) in total + number}
print(oddTotal)

let numberArray = [3, 2, 8, 10, 4, 6, 5, 1]

let maxNum = numberArray.reduce(0){(result, number) in max(result, number)}
print(maxNum)


let reduceRet2 = numberArray.reduce(0){
    (var n, var m) -> Int in n + m
}
print(reduceRet2)

let reduce3 = numberArray.reduce(0){(var n, var m) in n + m}
print(reduce3)

let reduce4 = numberArray.reduce(0){ $0 + $1 }
print(reduce4)