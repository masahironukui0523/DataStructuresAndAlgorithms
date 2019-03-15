let array = [1,2,4,5,6,9,11,22,23,28,32]
let abcArray = ["g","b","c","d","e","f","a"]

func binarySeach<T: Comparable>(array: [T], searchKey: T) -> Int? {
    
    // from first of array to end of array. ※ Range type
    var range = 0 ..< array.count
    print(range)
    
    // startIndex == 0, endIndex == 6 (abcArray)
    while range.startIndex < range.endIndex {
        
        let midpoint = range.startIndex + (range.endIndex - range.startIndex) / 2

        if array[midpoint] == searchKey {
            return midpoint
        } else if array[midpoint] < searchKey {
            print(array[midpoint], searchKey)
            range = midpoint + 1 ..< range.endIndex
        } else {
            range = 0 ..< midpoint
        }
        
    }
    
    return nil
}


let ans = binarySeach(array: abcArray, searchKey: "g")

print(ans)
