import Cocoa


let input = readLine()!.split(separator: " ")
let first = String(input.first!)
let second = String(input.last!)

// 1. Определить тип для rock, paper, scissors и назвать его Choice. Какой подойдет лучше?
// 2. Создать computed property для типа Choice, чтобы вычислять weakness
// 3. Создать структуру Game
//    a. Создать свойства для хранения счета двух игроков(p1Score, p2Score)
//    b. Создать свойство для хранения истории прошлых игр
//    c. Создать метод play внутри которого будут передаваться выборы игроков
//        i. Обновлять историю игр
//        ii. В зависимости от победителся повышать p1Score/p2Score и принтить "player 1 wins" / "player 2 wins" / "draw"
// 4. инициализировать выборы игроков используя first & second. Hint: rawValue




enum Choice: String {
    case rock = "rock"
    case scissors = "scissors"
    case paper = "paper"
    
  
}

var weakness = { (_ player: String) -> String in
    switch player {
    case Choice.rock.rawValue:
        return "paper"
    case Choice.scissors.rawValue:
        return "rock"
    case Choice.paper.rawValue:
        return "scissors"
    default:
        return "error"
    }
}

struct Game {
    var p1Score: Int = 0
    var p2Score: Int = 0
    var history: [String : String] = [:]
    
    mutating func play(_ p1Choice: String, against p2Choice: String) {
        
        if weakness(p1Choice) == p2Choice {
            print("player 2 wins")
            p2Score += 1
            history[p1Choice] = p2Choice
        } else if p1Choice == p2Choice {
            print("draw")
            history[p1Choice] = p2Choice
        } else {
            print("player 1 wins")
            p1Score += 1
            history[p1Choice] = p2Choice
        }
    }
}

var game = Game()
game.play(first, against: second)


