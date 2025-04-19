import Cocoa

protocol Exercise {
    var caloriesBurned: Double { get set }
    var minutes: Double { get set }
    var caloriesBurnedPerMinute: Double { get }
}

extension Exercise {
    var caloriesBurnedPerMinute: Double {
        caloriesBurned / minutes
    }
}

struct EllipticalWorkout: Exercise {
    var caloriesBurned: Double
    var minutes: Double
}

struct RunningWorkout: Exercise {
    var caloriesBurned: Double
    var minutes: Double
    var meters: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)
let runningWorkout = RunningWorkout(caloriesBurned: 350, minutes: 25, meters: 5000)

//func caloriesBurnedPerMinute<E: Exercise>(for exercise: E) -> Double {
//    exercise.caloriesBurned / exercise.minutes
//}
//
//print(caloriesBurnedPerMinute(for: ellipticalWorkout))
//print(caloriesBurnedPerMinute(for: runningWorkout))

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)
