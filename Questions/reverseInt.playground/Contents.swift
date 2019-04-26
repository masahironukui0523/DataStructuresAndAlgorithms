import Cocoa

var num = 4629

func getAns(num: Int) -> Int {
    let count = String(num).count
    var ans = 0
    for i in (1...count) {
        let v = num / Int(pow(Double(10), Double(i - 1))) % 10
        ans += v * Int(pow(Double(10), Double(count - i)))
    }
    return ans
}

let ans = getAns(num: num)
print(ans)
