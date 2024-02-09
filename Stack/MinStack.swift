class MinStack {
    private var stack: [(value: Int, min: Int)]

    init() {
        stack = []
    }
    
    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append((val, val))
        } else {
            let currentMin = stack.last!.min
            stack.append((val, min(val, currentMin)))
        }
    }
    
    func pop() {
        if !stack.isEmpty {
            stack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last?.value ?? 0
    }
    
    func getMin() -> Int {
        return stack.last?.min ?? 0
    }
}

/* 
The stack is an array of tuples, where each tuple contains the value of the element and the minimum value in the stack up to that point.
In the push method, when a new value is pushed onto the stack, it is paired with the current minimum value. This minimum value is the lesser of the new value being pushed and the minimum value of the stack before the push.
The pop method removes the last element from the stack, which is always the top element due to the stack's LIFO (Last In, First Out) nature.
The top method returns the value of the last element in the stack, which represents the top of the stack.
The getMin method returns the minimum value of the last element in the stack, which represents the minimum value in the current stack.
This implementation ensures that each of the stack operations (push, pop, top, and getMin) operates in 
O(1) time complexity by keeping an auxiliary record of the minimum value at each stage of the stack.
*/