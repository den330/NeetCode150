func evalRPN(_ tokens: [String]) -> Int {
    var tokenStack = Stack()
    for token in tokens {
        if let num = Int(token) {
            tokenStack.push(token)
        } else {
            switch token {
                case "+", "-", "*", "/":
                    guard let top1 = tokenStack.pop(), let top2 = tokenStack.pop() else { fatalError() }
                    let result = operation(op: token, num1: Int(top2)!, num2: Int(top1)!)
                    let resultStr = String(result)
                    tokenStack.push(resultStr)
                default: fatalError()
            }
        }
    }
    return Int(tokenStack.pop()!)!
}

func operation(op: String, num1: Int, num2: Int) -> Int {
    switch op {
        case "+": return num1 + num2
        case "-": return num1 - num2
        case "*": return num1 * num2
        case "/": return num1 / num2
        default: fatalError()
    }
}

class Stack {
    private var arr: [String] = [];
    func push(_ str: String) {
        arr.append(str)
    }
    func pop() -> String? {
        if arr.isEmpty { return nil }
        return arr.removeLast()
    }
    func length() -> Int {
        return arr.count
    }
    func top() -> String? {
        return arr.last
    }
}


/* gpt solution
class Stack<T> {
    private var array: [T] = []

    func push(_ element: T) {
        array.append(element)
    }

    func pop() -> T? {
        return array.popLast()
    }

    func isEmpty() -> Bool {
        return array.isEmpty
    }

    func top() -> T? {
        return array.last
    }
}

func evalRPN(_ tokens: [String]) -> Int {
    let stack = Stack<Int>()
    for token in tokens {
        if let num = Int(token) {
            stack.push(num)
        } else {
            // Since the input is guaranteed to be valid, we can force unwrap.
            let num2 = stack.pop()!
            let num1 = stack.pop()!
            let result = performOperation(op: token, num1: num1, num2: num2)
            stack.push(result)
        }
    }
    // The final result will be the only element left in the stack.
    return stack.pop()!
}

func performOperation(op: String, num1: Int, num2: Int) -> Int {
    switch op {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    case "/":
        return num1 / num2
    default:
        fatalError("Unexpected operator encountered")
    }
}
*/