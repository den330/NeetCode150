function encode(strList: [String]) -> String {
    return strList.map { String($0.count) + '#' + $0}.joined(separator: "")
}

func decode(str: String) -> [String] {
    var resultArray: [String] = []
    var startIndex = str.startIndex
    
    while startIndex < str.endIndex {
        var hashIndex = startIndex
        while str[hashIndex] != "#" {
            hashIndex = str.index(after: hashIndex)
        }
        // Convert the string before the '#' into an integer
        if let number = Int(str[startIndex..<hashIndex]) {
            let stringStartIndex = str.index(after: hashIndex)
            let stringEndIndex = str.index(stringStartIndex, offsetBy: number)
            // Append the substring to the result array
            resultArray.append(String(str[stringStartIndex..<stringEndIndex]))
            // Move the startIndex to the end of the current substring for the next iteration
            startIndex = stringEndIndex
        } else {
            // Handle error or unexpected format
            break
        }
    }
    return resultArray
}