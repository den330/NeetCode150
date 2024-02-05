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
    
}