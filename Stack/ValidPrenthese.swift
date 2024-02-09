func isValid(_ s: String) -> Bool {
    var charStack = Stack()
    for char in s {
        switch char {
        case "[", "{", "(":
            charStack.push(char)
        case "]":
            if charStack.pop() != "[" {
                return false
            }
        case "}":
            if charStack.pop() != "{" {
                return false
            }
        case ")":
            if charStack.pop() != "(" {
                return false
            }
        default:
            fatalError()
        }
    }
    return charStack.isEmpty()
}


struct Stack {
    private var arr: [Character] = []
    
    func push(_ s: Character) {
        arr.append(s)
    }

    func pop() -> Character? {
        return arr.isEmpty ? nil : arr.removeLast()
    }

    func length() -> Int {
        return arr.count
    }
}