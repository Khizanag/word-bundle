import Foundation

var greeting = "Hello, playground"

let setA: Set<Int> = [ 1, 2, 3 ]
let setB: Set<Int> = [ 4, 5, 6 ]

print(setA.isDisjoint(with: setB))
