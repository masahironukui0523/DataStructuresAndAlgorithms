import Cocoa

let input0 = 26 // 11010 1
let input1 = 529 // 1000010001 4
let input2 = 20 // 10100 1
let input3 = 561892 // 10001001001011100100 3
let input4 = 74901729 // 100011101101110100011100001 4
let input5 = 1376796946 // 1010010000100000100000100010010

public func solution(_ N : Int) -> Int {
    var n = N
    var maxLength = 0
    var tempMaxLength = 0
    var startFlag = false
    while true {
        let binaryN = n % 2
        n /= 2
        if binaryN == 1 {
            startFlag = true
            if n == 1 {
                if maxLength < tempMaxLength {
                    return tempMaxLength
                }
                return maxLength
            }
            if maxLength < tempMaxLength {
                maxLength = tempMaxLength
            }
            tempMaxLength = 0
        } else if binaryN == 0 && startFlag {
            tempMaxLength += 1
        }
        if n == 0 {
            return maxLength
        }
    }
}

solution(input4)


public func solution2(N : Int) -> Int {
    var n = N
    
    while n > 0 && n % 2 == 0 {
        n /= 2
    }
    
    var i = 0
    
    var l = 0
    
    while n > 0 {
        if n % 2 == 0 {
            i += 1
        } else {
            l = max(i, l)
            i = 0
        }
        
        n /= 2
    }
    
    return l
}

solution2(N: input4)
