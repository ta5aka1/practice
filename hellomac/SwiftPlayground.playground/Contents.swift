var odds = [Int]()
for i in 1...10 {
    if i % 2 == 1 {
        odds.append(i)
    }
}

print(odds)


func isOdd(number: Int) -> Bool{
    return number % 2 == 1
}
var odds2 = Array(1...10).filter(isOdd)
print(odds2)
