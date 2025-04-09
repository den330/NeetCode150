
// reverse normal arrangement in order for easy checkup -> element as key, position as value

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numDict = Dictionary<Int,Int>() // element : position
    for (index, num) in nums.enumerated() {
        let diff = target - num
        if let diffIndex = numDict[diff] {
            return [index, diffIndex]
        }
        numDict[num] = index
    }
    return []
}
