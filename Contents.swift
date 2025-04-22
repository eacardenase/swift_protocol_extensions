import Cocoa

protocol Exercise {
    var caloriesBurned: Double { get set }
    var minutes: Double { get set }
}

extension Exercise {
    var caloriesBurnedPerMinute: Double {
        caloriesBurned / minutes
    }
}

extension Exercise {
    func adding(calories: Double) -> Self {
        var dupe = self
        
        dupe.caloriesBurned += calories
        
        print("Creating a new \(Self.self) with \(dupe.caloriesBurned)cal burned.")
        
        return dupe
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

let ellipticalCopy = ellipticalWorkout.adding(calories: 50)
let runningCopy = runningWorkout.adding(calories: 100)

print(EllipticalWorkout.self) // EllipticalWorkout
print(type(of: EllipticalWorkout.self)) // EllipticalWorkout.Type

//extension Sequence where Element: Exercise {
extension Sequence where Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        
        for exercise in self {
            total += exercise.caloriesBurned
        }
        
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]

print(mondayWorkout.totalCaloriesBurned())
