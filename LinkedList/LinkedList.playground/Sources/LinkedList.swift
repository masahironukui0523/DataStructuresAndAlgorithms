import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        
        var currentNode = head
        var currentIndex = 0
        
        while currentIndex < index && currentNode != nil {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    public mutating func insert(value: Value, after node: Node<Value>) {
        guard tail !== node else {
            append(value)
            return 
        }
        // node.next = 指定したnodeの後ろ, insertするnodeのnextには手前のnodeの元々後ろにあったnodeを入れる
        node.next = Node(value: value, next: node.next)
    }
    
    public mutating func pop() {
        head = head?.next
        if isEmpty {
            tail = nil
        }
    }
    
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "is empty"
        }
        return String(describing: head)
    }
}
