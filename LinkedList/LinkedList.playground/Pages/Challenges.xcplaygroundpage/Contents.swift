import Foundation

var linkedList = LinkedList<Int>()
(1...4).forEach { linkedList.append($0) }
linkedList.push(0)
linkedList.append(10)

// challenge 1: Create a function that prints out the elements of a linked list in reverse order.
func reverseOrder(list: LinkedList<Int>) {
    
    var prev = list.head
    var current = list.head
    var newLinkedList = LinkedList<Int>()
    
    while true {
        let next = current?.next
        
        prev = current
        current = next
        newLinkedList.push((prev?.value)!)
        
        if current == nil {
            break
        }
    }
    
    print(newLinkedList)
    
    current = newLinkedList.head
    
    while true {
        let next = current?.next
        
        print(current!.value)
        current = next
        
        if current == nil {
            break
        }
    }
}


func getMiddleNode(list: LinkedList<Int>) -> Node<Int> {
    
    let middle = list.countNodes(head: linkedList.head!) / 2
    
    return list.node(at: middle)!
    
}

reverseOrder(list: linkedList)
print(getMiddleNode(list: linkedList).value)
