func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict: [Int : Int] = [:]
    for num in nums {
        dict[num, default: 0] += 1
    }
    var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
    for (key, value) in dict {
        buckets[value].append(key)
    }
    var resultArr: [Int] = []
    for i in stride(from: buckets.count - 1, to: 0, by: -1) {
        for num in buckets[i] {
            resultArr.append(num)
            if resultArr.count == k {
                return resultArr
            }
        }
    }
    return resultArr
}

print(topKFrequent([1,2,3,4,4,5,5,5], 2))

/*
    LeetCode: https://leetcode.com/problems/top-k-frequent-elements/
    1. Each element from the original array is placed into exactly one bucket, based on its frequency.
    2. Even though there's a nested loop to iterate over the elements within each bucket, each element that was in the original array is considered exactly once across all iterations of this nested loop. In other words, the total number of iterations performed by the inner loop across all iterations of the outer loop is n^2.
 */