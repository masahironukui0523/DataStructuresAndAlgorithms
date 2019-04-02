import Cocoa

let node1 = Node(value: 13)
let node2 = Node(value: 23)
let node3 = Node(value: 34)

node1.next = node2
node2.next = node3

print(node1)
