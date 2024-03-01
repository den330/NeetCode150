func findMin(_ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count - 1
    while low < high {
        let mid = (low + high) / 2
        if nums[mid] > nums[high] {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return nums[low]
}