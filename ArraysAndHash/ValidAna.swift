class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }

        var countS = [Character: Int]()
        var countT = [Character: Int]()

        let sArray = Array(s)
        let tArray = Array(t)

        for i in 0..<s.count {
            countS[sArray[i], default: 0] += 1
            countT[tArray[i], default: 0] += 1
        }

        return countS == countT
    }
}
