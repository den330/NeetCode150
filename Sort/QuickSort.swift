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

func QuickSort2(_ arr: inout [Int], _ low: Int, _ high: Int) {
    if low >= high { return }
    let pivot = arr[high]
    var lowSlot = low
    for i in low..<high {
        if arr[i] < pivot {
            arr.swapAt(i, lowSlot)
            lowSlot += 1
        }
    }
    arr.swapAt(high, lowSlot)
    QuickSort(&arr,  low, lowSlot - 1)
    QuickSort(&arr, lowSlot + 1,  high)
}