func isValidSudoku(_ board: [[Character]]) -> Bool {
    struct SquareIndex: Hashable {
        let row: Int
        let col: Int
    }
    var digitSetForRow = Set<Int>()
    var digitSetForCol = Set<Int>()
    var digitDictForSquare: [SquareIndex : Set<Int>] = [:]
    for m in 0..<9 {
        for n in 0..<9 {
            if let digit = Int(String(board[m][n])), 1...9 ~= digit {
                if !digitSetForRow.insert(digit).inserted {
                    return false
                }

                let theSquareItBelongs = SquareIndex(row: m/3, col: n/3)
                if !digitDictForSquare[theSquareItBelongs, default: Set<Int>()].insert(digit).inserted {
                    return false
                }
            }

            if let digit = Int(String(board[n][m])), 1...9 ~= digit {
                if !digitSetForCol.insert(digit).inserted {
                    return false
                }
            }
        }
        digitSetForRow.removeAll()
        digitSetForCol.removeAll()
    }
    return true
}