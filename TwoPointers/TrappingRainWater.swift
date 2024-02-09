func trap(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var currentCount = 0
    var currentLeftMax = 0
    var currentRightMax = 0
    let indexOfMaxValue = height.enumerated().max(by: { $0.element < $1.element })!.offset
    while left < indexOfMaxValue {
        let leftHeight = height[left]
        let difference = currentLeftMax - leftHeight
        if difference > 0 {
            currentCount += difference
        } else {
            currentLeftMax = leftHeight
        }
        left += 1
    }

    while right > indexOfMaxValue {
        let rightHeight = height[right]
        let difference = currentRightMax - rightHeight
        if difference > 0 {
            currentCount += difference
        } else {
            currentRightMax = rightHeight
        }
        right -= 1
    }
    return currentCount
}