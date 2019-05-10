
import Foundation


class Stack<Element> {
    
    var storage = [Element]()
    
    func push(element: Element) {
        storage.append(element)
    }
    
    func pop() {
        storage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
    
    func isEmpty() -> Bool {
        return peek() == nil
    }
    
    init (_ elements: [Element]) {
        self.storage = elements
    }
}

let array = [34,52,52,5,62]

let stack = Stack(array)
stack.push(element: 23)

stack.pop()
print(stack.storage)

stack.peek()
stack.isEmpty()
