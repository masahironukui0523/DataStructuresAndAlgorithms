import Cocoa

var sampleString = "19970523"

func convert(input: String) -> Int {
    
    var num = 1
    var ans = 0
    
    let inputReversed = input.reversed()
    
    for v in inputReversed {
        
        let valueMap = [
            
            "0" as Character : 0,
            "1" : 1,
            "2" : 2,
            "3" : 3,
            "4" : 4,
            "5" : 5,
            "6" : 6,
            "7" : 7,
            "8" : 8,
            "9" : 9
        
        ]
        
        // 数字が頭からIntとして代入される
        var value = valueMap[v]!
        
        // 位の数をかける
        value *= num
        
        // 答えに足していく
        ans += value
        
        // 位をあげる
        num *= 10
        
    }
    
    return Int(ans)
    
}

let number = convert(input: sampleString)
print(number)
