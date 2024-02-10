func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    var stack = [Character]()
    generate(&result, &stack, n, n)
    return result
}

func generate(_ result: inout [String], _ stack: inout [Character], _ left: Int, _ right: Int) {
    // If no more parentheses need to be added, convert the stack to a string and add it to the result.
    if left == 0 && right == 0 {
        result.append(String(stack))
        return
    }
    
    // If there are left parentheses to add, add one to the stack and recurse.
    if left > 0 {
        stack.append("(")
        generate(&result, &stack, left - 1, right)
        stack.removeLast() // Remove the last added element to backtrack
    }
    
    // If we have more right parentheses left to add than left, add a right one to the stack and recurse.
    if right > left {
        stack.append(")")
        generate(&result, &stack, left, right - 1)
        stack.removeLast() // Remove the last added element to backtrack
    }
}

// Example usage:
let combinations = generateParenthesis(3)
print(combinations)


//left在right上面，因此最后只能backtrack到left这里作为节点