import SwiftUI

//Onboarding Model
struct Onboarding: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var text: String
}
//Onboarding Sample
var slides: [Onboarding] = [
    .init(imageName: "sammy-3", title: "Walk", text:"No matter your fitness level or goals - GoStep will track your steps walked and calories burned"),
    .init(imageName: "sammy-4", title: "Run", text:"This app is suited for all types of runners and will help you achieve a more healthier life."),
    .init(imageName: "sammy-2", title: "Activity Stats", text: "We track your health stats and provide you the best way to view all the details."),
]
//Fonts Strings
let workSansBold = "WorkSans-Bold"
let workSansSemiBold = "WorkSans-SemiBold"
let workSansRegular = "WorkSans-Regular"
let workSansMedium = "WorkSans-Medium"
//Dummy Text
let dummyText = "Lorem ipsum dolor sit amet consectetur adipiscing elit volutpat, tortor elementum sapien eu inceptos sociosqu."
