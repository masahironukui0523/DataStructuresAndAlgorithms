import Cocoa

/*
 1. dictionaryを作って値を検索できるようにする
 2. 最小値である1を持った変数minを定義
 3. dictionaryにminが存在する場合にminを1づつ増やしていき、存在しない場合まで繰り返し処理
*/

var array = [1, 3, 6, 4, 1, 2, -1]

public func solution(_ A : inout [Int]) -> Int {
    
    var dic: [Int:Bool] = [:]
    
    A.forEach {
        dic[$0] = true
    }
    
    var min = 1
    
    while true {
        if dic[min] == nil {
            return min
        }
        min = min+1
    }
    
    return min
}

print(solution(&array))

