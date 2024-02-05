func isPalindrome(_ s: String) -> Bool {
    if s.count == 0 || s.count == 1 {
        return true
    }
    var strArr = Array(s.lowercased())
    var endIndex = strArr.count - 1
    var startIndex = 0
    while startIndex < endIndex {
        let leftChar = strArr[startIndex]
        let rightChar = strArr[endIndex]
        var needSkip = false;
        if !leftChar.isLetter && !leftChar.isNumber {
            startIndex += 1
            needSkip = true
        }
        if !rightChar.isLetter && !rightChar.isNumber {
            endIndex -= 1
            needSkip = true
        }
        if needSkip {
            continue
        }
        if leftChar != rightChar {
            return false
        }
        startIndex += 1
        endIndex -= 1
    }
    return true
}

func isPalindrome2(_ s: String) -> Bool {
    if s.count == 0 || s.count == 1 {
        return true
    }
    var startIndex = s.startIndex
    var endIndex = s.index(before: s.endIndex)
    while startIndex < endIndex {
        while startIndex < endIndex && !s[startIndex].isLetter && !s[startIndex].isNumber {
            startIndex = s.index(after: startIndex)
        }
        while startIndex < endIndex && !s[endIndex].isLetter && !s[endIndex].isNumber {
            endIndex = s.index(before: endIndex)
        }
        if startIndex >= endIndex {
            return true
        }
        if s[startIndex].lowercased() != s[endIndex].lowercased() {
            return false
        }
        startIndex = s.index(after: startIndex)
        endIndex = s.index(before: endIndex)
    }
    return true
}