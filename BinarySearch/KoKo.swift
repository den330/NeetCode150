class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var minSpeed: Int = 1
        var maxSpeed: Int = piles.max()!
        while maxSpeed >= minSpeed {
            let midSpeed = (minSpeed + maxSpeed) / 2
            if isSpeedEnough(midSpeed, piles, h) {
                maxSpeed = midSpeed - 1
            } else {
                minSpeed = midSpeed + 1
            }
        }
        return minSpeed
    }

    func isSpeedEnough(_ speed: Int, _ piles: [Int], _ h: Int) -> Bool {
        var sum: Double = 0
        for pile in piles {
            sum += ceil(Double(pile) / Double(speed))
        }
        return Int(sum) <= h
    }
}