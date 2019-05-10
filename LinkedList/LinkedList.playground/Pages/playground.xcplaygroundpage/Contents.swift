import Cocoa

let node1 = Node(value: 1)

var list = LinkedList<Int>()
list.head = node1
list.push(0)
list.append(4)
list.push(3)
list.append(23)
list.push(21)
list.append(29)

list.pop()

let count = list.countNodes(head: list.head!)

print(count)


var listA = LinkedList<Int>()
(1...3).forEach { listA.append($0) }

var listB = listA
listB.push(0)
listA.push(100)

print(listA)
print(listB)
