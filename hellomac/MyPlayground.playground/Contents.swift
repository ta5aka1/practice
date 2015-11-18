print (4 / 3 * 3.14 * 6378 * 6378 * 6378 )  //地球の体積

var x = 3
print( x*x )
var y = 4

var tax = 1.08
tax = 1.05


for n in 1...9 {
    print (3 * n)
}

import Foundation
// 9x9 tables.
for x in 1...9 {
    var rows = ""
    for y in 1...9{
        rows = rows + String(format:"%3d", x * y)
    }
    print(rows)
}