import Cocoa

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

var list = LinkedList<Int>()
list.head = node1
list.push(0)
list.append(4)
list.append(4)
list.push(9)

let node = list.node(at: 3)!
list.insert(value: 100, after: node)
list.pop()
list.pop()
list.pop()
list.pop()
list.pop()
list.pop()
list.tail




print(list)

