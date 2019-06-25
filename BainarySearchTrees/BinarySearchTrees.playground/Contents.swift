import Cocoa

struct BinarySearchTree<Element: Comparable> {
    
    private(set) var root: BinaryNode<Element>?
    init() {}

}

extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        guard let root = root else { return "Empty" }
        return String(describing: root)
    }
    
}

extension BinarySearchTree {
    
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        
        // Nodeがnilなら再帰はここで終わる
        guard let node = node else {
            return BinaryNode(value)
        }
        
        // parameterで受け取った値を親Nodeの値と比較してleftかrightに入れるかを決める。 再帰でleftとrightがnilになるまで実行
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        // root
        return node
    }
    
    func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    mutating func remove(_ value: Element) {
        root = remove(root, value: value)
    }
    
    private func remove(_ node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            
        } else if value < node.value {
            
        } else {
            node.rightChild = remove(node, value: value)
        }
        return node
    }
        
}

var bst = BinarySearchTree<Int>()

bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)
print(bst.contains(34))
print(bst.root?.rightChild?.min)
