let value = 10
var value2 = 20

value2 = 100

var item:(String, Int) = ("pen", 100)
let (name, price) = item

print(name)
print(price)

let fruit = ("apple", "orange")
print(fruit.0)
print(fruit.1)

let a = 1 + 3
let b = 3 - 1
let c = 2 * 2
let d = 4 / 2
let e = 5 % 2

var f = 10
var g = f++
print(f)
print(g)

var h = 10
var i = ++h
print(h)
print(i)

let j = true
let k = false

print(j && j)
print(j && k)
print(j || k)
print(k || k)
print(!j)
print(!k)

let l = 5
let m = 10
print(l > m)
print(l < m)

for i in 1 ... 3 {
    print("1 ... 3 -> \(i)")
}
print("")

for i in 1 ..< 3 {
    print("1 ..< 3 -> \(i)")
}
