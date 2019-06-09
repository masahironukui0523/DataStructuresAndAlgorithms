import Cocoa

var array = [9,3,9,3,9,7,9]

public func solution(_ A : inout [Int]) -> Int {
    var z = 0
    
    for i in A {
        z ^= i
        print(z)
    }
    
    return z
}

solution(&array)
