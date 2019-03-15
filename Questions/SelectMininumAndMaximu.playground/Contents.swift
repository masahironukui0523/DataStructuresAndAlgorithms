// Goal: Find the minimum/maximum object in an unsorted array.

// 1 最小値を入れるための変数minを用意
// 2 minと配列の要素を前から順番に比較していき、もしminの値よりも比較対象が小さければminを更新する
// 3 minを返す

import Cocoa

let arr = [8, 3, 9, 4, 6, 4, 6 ,7 ,82 ,234 ,53]

func selectMinmum(array: [Int]) -> Int? {
    
    guard var min = array.first else {
        return nil
    }
    
    for value in array {
        if min > value {
            min = value
        }
    }
    
    return min
    
}

let min = selectMinmum(array: arr)

func selectMaximum(array: [Int]) -> Int? {
    
    guard var max = array.first else {
        return nil
    }
    
    for value in array {
        if max < value {
            max = value
        }
    }
    
    return max
    
}

let max = selectMaximum(array: arr)


func selectMinimumAndMaximum(array: [Int]) -> (Int, Int) {
    guard let max = selectMaximum(array: array) else { return (0, 0) }
    guard let min = selectMinmum(array: array) else { return (0, 0) }
    return (max, min)
}

let tuple = selectMinimumAndMaximum(array: arr)

print(tuple)
