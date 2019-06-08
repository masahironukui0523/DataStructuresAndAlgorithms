
import Foundation


class Stack<Element: Comparable> {
    
    var storage = [Element]()
    
    var maxValue: Element? {
        return subStorage.last
    }
    
    func push(element: Element) {
        storage.append(element)
        print("----------------------------------------")
        if let max = subStorage.last {
            if max < element {
                print("new element(\(element)) is larger than max(\(max))", subStorage)
                subStorage.append(element)
            } else {
                print("max(\(max)) is larger than new element(\(element))", subStorage)
                subStorage.append(max)
            }
        } else {
            subStorage.append(element)
        }
    }
    
    func pop() {
        storage.popLast()
        subStorage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
    
    func isEmpty() -> Bool {
        return peek() == nil
    }
    
    init (_ elements: [Element]) {
        self.storage = elements
        
        // sort関数を使わずにソートする
        guard var max = elements.first else { return }
        elements.forEach {
            if max < $0 {
                max = $0
                self.subStorage.append($0)
            } else {
                self.subStorage.append(max)
            }
        }
    }
    
    // original
    private var subStorage = [Element]()
    
}


let array = [4,13,3,5,4]
//let array = [Int]()

let stack = Stack(array)
//stack.push(element: 23)
stack.push(element: 4)
stack.push(element: 2)
stack.push(element: 5)
stack.push(element: 14)
stack.push(element: 1)
stack.push(element: 15)
stack.pop()

print(stack.maxValue)
