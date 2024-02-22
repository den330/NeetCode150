struct CarInfo {
  let speed: Int;
  let position: Int;
  let target: Int;
  var timeRemain: Double {
    return (Double(target) - Double(position)) / Double(speed)
  }  
}

func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    var index = 0
    var carInfoArr: [CarInfo] = []
    var fleetCount = 0
    while index < position.count {
        let currentPosition = position[index]
        let currentSpeed = speed[index]
        let carInfo = CarInfo(speed: currentSpeed, position: currentPosition, target: target)
        carInfoArr.append(carInfo)
        index += 1
    }

    carInfoArr.sort(by: {$0.position > $1.position})
    var currentMaxRem: Double?
    for car in carInfoArr {
        guard let theCurrentMaxRem = currentMaxRem else {
            currentMaxRem = car.timeRemain
            continue
        }
        if car.timeRemain > theCurrentMaxRem {
            fleetCount += 1
            currentMaxRem = car.timeRemain
        } 
    }

    return fleetCount + 1
}