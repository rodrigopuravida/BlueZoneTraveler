import UIKit
//Tips for delete by index by sunuan - github
//Also added more functionality for learning and interviewing purposes
//Using Generics for any data.  In this case defined as String on Test Cases section
class Node<T> {
    var data:T? = nil
    var next:Node<T>? = nil
    init(data:T?) {
        self.data = data
    }
    func getData() -> T? {
        return data
    }
    func setData(d:T?) {
        self.data = d
    }
    func getNext() -> Node<T>? {
        return next
    }
    func setNext(n:Node<T>?) {
        self.next = n
    }
}

class LinkedList<T> {
    var root:Node<T>? = nil
    init() {
        self.root = nil
    }
    
    func add(d:T?) {
        if (self.root == nil) {
            self.root = Node(data: d)
            return
        }
        var temp:Node<T>? = self.root
        while (temp != nil) {
            if (temp!.getNext() == nil) {
                var child:Node<T>? = Node(data: d)
                temp!.setNext(child)
                break
            }
            else {
                temp = temp!.getNext()
            }
        }
    }
    
    func deleteByIndex(n:Int) {
        var temp:Node<T>? =  self.root
        var prev:Node<T>? = nil
        var h:Int = 0;
        while (temp != nil && h < n) {
            prev = temp;
            temp = temp!.getNext()
            h++
        }
        if (temp != nil && h == n) {
            if (prev == nil) {
                self.root = temp!.getNext()
            }
            else {
                prev!.setNext(temp!.getNext())
            }
        }
    }
    
    func get(i:Int) -> T? {
        var temp:Node<T>? = self.root
        var arr:Int = 0
        while (arr < i && temp != nil) {
            temp = temp!.getNext()
            arr++
        }
        if (temp == nil) {
            return nil
        }
        else {
            return temp!.getData()
        }
    }
}

var listOfStrings:LinkedList<String> = LinkedList<String>()

//TEST SECTION
listOfStrings.add("Batman")
listOfStrings.add("Gordon")
listOfStrings.add("Joker")
listOfStrings.add("Riddler")
listOfStrings.get(0)
listOfStrings.get(1)
listOfStrings.deleteByIndex(1)
listOfStrings.deleteByIndex(0);
//NOW Joker is the head and Riddler the Tail after removing our Superheroes
listOfStrings.get(0)
listOfStrings.get(1)