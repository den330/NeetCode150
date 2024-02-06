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