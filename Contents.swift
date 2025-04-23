import Cocoa

protocol Exercise: CustomStringConvertible {
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

extension Exercise {
    var description: String {
        "Exercise(\(Self.self), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

extension Exercise {
    var title: String {
        "\(Self.self) - \(minutes) minutes"
    }
}

struct EllipticalWorkout: Exercise {
    var caloriesBurned: Double
    var minutes: Double
}

struct RunningWorkout: Exercise {
    var title = "Gotta go fast!"
    
    var caloriesBurned: Double
    var minutes: Double
    var meters: Double
    
    var description: String {
        "\(Self.self)(\(caloriesBurned) calories and \(meters)m in \(minutes) minutes)"
    }
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

print(ellipticalWorkout)
print(runningWorkout)

let tenKRun = RunningWorkout(caloriesBurned: 750, minutes: 60, meters: 10000) // Gotta go fast!
let workout: Exercise = tenKRun // RunningWorkout - 60.0 minutes

print(tenKRun.title)
print(workout.title)
