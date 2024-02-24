func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count < 2 { return arr }
    let middleIndex: Int = arr.count / 2
    let leftArr = mergeSort(Array(arr[0..<middleIndex]))
    let rightArr = mergeSort(Array(arr[middleIndex..<arr.count]))
    return merge(leftArr, rightArr)
}

func merge(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    if arr1.isEmpty { return arr2 }
    if arr2.isEmpty { return arr1 }
    var resultArr: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < arr1.count && rightIndex < arr2.count {
        let leftNum = arr1[leftIndex]
        let rightNum = arr2[rightIndex]
        if leftNum < rightNum {
            resultArr.append(leftNum)
            leftIndex += 1
        } else {
            resultArr.append(rightNum)
            rightIndex += 1
        }
    }
    while leftIndex < arr1.count {
        resultArr.append(arr1[leftIndex])
        leftIndex += 1
    }
    while rightIndex < arr2.count {
        resultArr.append(arr2[rightIndex])
        rightIndex += 1
    }
    return resultArr
}