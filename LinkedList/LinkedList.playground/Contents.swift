import Cocoa

// generic -> which enable function, class to hold different type of value.
public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
        
    }
    
}

let node1 = Node(value: 13)
let node2 = Node(value: 23)
let node3 = Node(value: 34)

node1.next = node2
node2.next = node3

print(node1)
