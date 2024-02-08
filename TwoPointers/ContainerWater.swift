func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    
    while left < right {
        let width = right - left
        let minHeight = min(height[left], height[right])
        let currentArea = width * minHeight
        maxArea = max(maxArea, currentArea)
        
        //什么时候你成为瓶颈，什么时候动你
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return maxArea
}