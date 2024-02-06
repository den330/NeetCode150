// my sol
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    let row: [Int] = Array(repeating: 0, count: n)
    var numArr: [[Int]] = Array(repeating: row, count: m)
    var i = 0
    while i < max(m, n) {
        if i < n {
            numArr[0][i] = 1
        }
        if i < m {
            numArr[i][0] = 1
        }
        i += 1
    }
    var j = 1
    var t = 1
    while t < max(m, n) {
        var tempJ = j
        while tempJ < max(m, n) {
            if tempJ < n && t < m {
                numArr[t][tempJ] = numArr[t - 1][tempJ] + numArr[t][tempJ - 1]
            }
            
            if tempJ < m && t < n {
                numArr[tempJ][t] = numArr[tempJ][t - 1] + numArr[tempJ-1][t]
            }
            tempJ += 1
        }
        t += 1
        j += 1
    }
    return numArr[m - 1][n - 1]
}


//ideal
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    // Create a 2D array filled with 1s, as the base case for the first row and column is always 1
    var grid = Array(repeating: Array(repeating: 1, count: n), count: m)
    
    // Start from 1 since the first row and column are already initialized
    for i in 1..<m {
        for j in 1..<n {
            // The number of paths to reach this cell is the sum of the paths
            // from the cell above it and the cell to the left of it
            grid[i][j] = grid[i - 1][j] + grid[i][j - 1]
        }
    }
    
    // Return the number of unique paths to the bottom-right corner
    return grid[m - 1][n - 1]
}