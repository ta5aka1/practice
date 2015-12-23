//: Playground - noun: a place where people can play

import UIKit

let fans = [("Aさん", "ガッキー"),("Bさん","ささきき"),("Cさん","さとみ")]

let fansOfGakki = fans.filter{(_, target) in
    return target == "ガッキー"
}

print(fansOfGakki)


struct FibonacciGenerator: GeneratorType{
    typealias Element = Int
    var (a,b) = (0,1)
    mutating func next() -> Element? {
        let n = a
        (a,b) = (b, a+b)
        return n
    }
}

var fib = FibonacciGenerator()
fib.next()
fib.next()
fib.next()
fib.next()
fib.next()

struct FibonacciSequence: SequenceType {
    typealias Generator = FibonacciGenerator
    func generate() -> Generator {
        return Generator()
    }
}

for (i, n) in zip(0..<10, FibonacciSequence()) {
    print("F_\(i) = \(n)")
}