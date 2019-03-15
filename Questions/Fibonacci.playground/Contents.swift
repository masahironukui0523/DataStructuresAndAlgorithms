import Cocoa
// その月のrabbitの数がn1、翌月のrabbitの数がn2
// rabbitはに生まれた二ヶ月経てばnew rabbitを生む

class RabbitCupple {
    
    static var numberOfObject = 0

    var monthAfterBirth: Int = 0
    var id: Int = 0
    
    func birth() -> RabbitCupple {
        let newRabbitCupple = RabbitCupple()
        return newRabbitCupple
    }
    
    init() {
        RabbitCupple.numberOfObject += 1
        self.id = RabbitCupple.numberOfObject
    }
    
}

class Fibnacci {
    
    var n1: Int = 0
    var n2: Int = 0
    var n3: Int = 0
    
    var rabbit: RabbitCupple! {
        didSet {
            self.rabbits.append(rabbit)
            self.numberOfRabbitCupple = self.rabbits.count
            print("Hello World! My id is: ", rabbit.id)
        }
    }
    
    var rabbits = [RabbitCupple]()
    var numberOfRabbitCupple: Int = 0
    
    func makeProgress() {
        
        print("生後二ヶ月を超えたうさぎの合計", n3)
        
        // 初月は1カップルだけ
        if rabbits[0].monthAfterBirth < 2 {
            rabbits[0].monthAfterBirth += 1
            return
        }
        
        n1 = rabbits.count
        
        for rabbit in rabbits {
            rabbit.monthAfterBirth += 1
            if rabbit.monthAfterBirth > 1 {
                self.rabbit = rabbit.birth()
            }
        }
        
        n2 = rabbits.count
        
        n3 = n1 + n2
        
        n1 = n2
        n2 = n3
        
    }
    
}

var count = 0
let fib = Fibnacci()
let rabbit = RabbitCupple()
fib.rabbit = rabbit

while count < 12 {
    fib.makeProgress()
    count += 1
}
