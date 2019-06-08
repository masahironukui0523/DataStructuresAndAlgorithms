import Cocoa

// sol 1
var num = 4629
var num2 = 593842709
var num3 = 7204702570280572085

func getAns(num: Int) -> Int {
    let count = String(num).count
    var ans = 0
    for i in (1...count) {
        let v = num / Int(pow(Double(10), Double(i - 1))) % 10
        ans += v * Int(pow(Double(10), Double(count - i)))
    }
    return ans
}

let ans = getAns(num: num3)
print(ans)


// sol 2
func getAns2(num: Int) -> Int {
    let str = String(num)
    return Int(String(str.reversed()))!
}

let ans2 = getAns2(num: num3)
print(ans2)
