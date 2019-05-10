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
    
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        // search for a next node until current.next is nil.
        while let next = current.next {
            prev = current
            current = next // last node
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    public mutating func remove(after node: Node<Value>) -> Value? {
        // unlink the node.
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    public func countNodes(head: Node<Value>) -> Int {
        
        var prev = head
        var current = head
        var count = 1
        
        while let next = current.next {
            prev = current
            current = next
            count += 1
        }
        
        return count
        
    }
    
    private mutating func copyNodes() {
        
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
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

//extension LinkedList: Collection {
//
//    public struct index: Comparable {
//
//        public var node: Node<Value>?
//
//        static public func ==(lhs: Index, rhs: Index) -> Bool {
//            switch (lhs.node, rhs.node) {
//            case let (left?, right?):
//                return left.next === right.next
//            case (nil, nil):
//                return true
//            default:
//                false
//            }
//        }
//
//        static public func <(lhs: Index, rhs: Index) -> Bool {
//            guard lhs != rhs else {
//                return false
//            }
//            let nodes = sequence(first: lhs.node) { $0?.next }
//            return nodes.contains { $0 === rhs.node }
//        }
//
//    }
//
//    public var startIndex: Index {
//        return Index(node: head)
//    }
//
//    public var endIndex: Index {
//        return Index(node: tail?.next)
//    }
//
//    public func index(after i: Index) -> Index {
//        return Index(node: i.node?.next)
//    }
//
//    public subscript(position: Index) -> Value {
//        return position.node!.value
//    }
//
//}
