func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var stack = Stack()
    var result = Array(repeating: 0, count: temperatures.count)
    for i in 0..<temperatures.count {
        while !stack.isEmpty() && temperatures[i] > temperatures[stack.peek()!] {
            let index = stack.pop()!
            result[index] = i - index
        }
        stack.push(i)
    }
    return result
}

class Stack {
    var stack: [Int] = []
    
    func push(_ value: Int) {
        stack.append(value)
    }
    
    func pop() -> Int? {
        return stack.popLast()
    }
    
    func peek() -> Int? {
        return stack.last
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
}