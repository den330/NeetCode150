// My sol
func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea = 0

    var stack = Stack()
    for (index, height) in heights.enumerated() {
        var startX = index
        while stack.length > 0 && stack.peek()! > height {
            let heightInfo = stack.pop()!
            let currentIndex = heightInfo.startX
            let currentHeight = heightInfo.height
            let currentArea = (index - currentIndex) * currentHeight
            maxArea = max(maxArea, currentArea)
            startX = currentIndex
        }
        stack.push(HeightInfo(height, startX))
    }

    while let heightInfo = stack.pop() {
        let currentArea = heightInfo.currentHeight * (heights.count - heightInfo.startX)
        maxArea = max(maxArea, currentArea)
    }
    return maxArea
}

class HeightInfo {
    let height: Int
    let startX: Int
    init(height: Int, startX: Int) {
        self.height = height
        self.startX = startX
    }
}

class Stack {
    private var arr: [HeightInfo] = []
    
    func push(_ s: HeightInfo) {
        arr.append(s)
    }

    func pop() -> HeightInfo? {
        return arr.isEmpty ? nil : arr.removeLast()
    }

    func length() -> HeightInfo {
        return arr.count
    }

    func peek() -> HeightInfo? {
        return arr.last
    }
}

// refined by gpt.
func largestRectangleArea2(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack: [(index: Int, height: Int)] = []

    for (index, height) in heights.enumerated() {
        var lastPopIndex = index
        while let last = stack.last, last.height > height {
            let popped = stack.removeLast()
            let area = (index - popped.index) * popped.height
            maxArea = max(maxArea, area)
            lastPopIndex = popped.index
        }
        stack.append((lastPopIndex, height))
    }

    while let last = stack.last {
        let popped = stack.removeLast()
        let area = (heights.count - popped.index) * popped.height
        maxArea = max(maxArea, area)
    }

    return maxArea
}