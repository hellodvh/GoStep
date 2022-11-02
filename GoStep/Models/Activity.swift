import Foundation

struct Activity: Identifiable {
    var id: String
    var name: String
    var image: String
    
    static func allActivities() -> [Activity] {
        return [
        Activity(id: "activeEnergyBurned", name: "Calories Burned", image: "icons8-fire-in-my-heart-40"),
        Activity(id: "appleExerciseTime", name: "Exercise Time", image: "icons8-heart-with-pulse-40"),
        Activity(id: "appleStandTime", name: "Standing Time", image: "icons8-standing-man-40"),
        Activity(id: "distanceWalkingRunning", name: "Distance Travelled", image: "icons8-running-40"),
        Activity(id: "stepCount", name: "Step Count", image: "icons8-step-40"),
        ]
    }
}
