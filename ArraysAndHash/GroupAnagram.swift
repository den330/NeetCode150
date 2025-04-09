
// key: character frequency distribution. value: an array of strings that satisfy that distribution. 

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anaDict = [[Int] : [String]]()
    for str in strs {
        var arr = [Int](repeating: 0, count: 26)
        for c in str {
            let index = Int(c.asciiValue!) - 97
            arr[index] += 1
        }
        anaDict[arr, default: []].append(str)
    }
    return Array(anaDict.values)
}
