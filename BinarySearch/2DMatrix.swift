func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var rowUpperBound: Int = matrix.count - 1
    var rowLowerBound: Int = 0 
    while rowUpperBound >= rowLowerBound {
        let middleRowIndex = (rowUpperBound + rowLowerBound) / 2
        let middleRow = matrix[middleRowIndex]
        if middleRow.last! < target {
            rowLowerBound = middleRowIndex + 1
        } else if middleRow.first! > target {
            rowUpperBound = middleRowIndex - 1
        } else {
            return binSearch(middleRow, target)
        }
    }
    return false
}

func binSearch(_ nums: [Int], _ target: Int) -> Bool {
    var upperBound: Int = nums.count - 1
    var lowerBound: Int = 0
    while upperBound >= lowerBound {
        let middleIndex = (upperBound + lowerBound) / 2
        let middleNum = nums[middleIndex]
        if middleNum == target {
            return true
        } else if middleNum > target {
            upperBound = middleIndex - 1
        } else {
            lowerBound = middleIndex + 1
        }
    }
    return false
}