func QuickSort(_ arr: [Int]) -> [Int] {
    if arr.count == 1 {
        return [arr.first!]
    }
    if arr.isEmpty {
        return []
    }
    let pivot = arr[Int((arr.count - 1) / 2)]
    let lowerArr = arr.filter({$0 < pivot })
    let higherArr = arr.filter({$0 > pivot })
    let equalArr = arr.filter({$0 == pivot})
    return QuickSort(lowerArr) + equalArr + QuickSort(higherArr)
}