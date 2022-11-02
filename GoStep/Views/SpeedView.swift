import SwiftUI

struct SpeedView: View {
    @ObservedObject var locationManager = LocationManager()
    var speed: String { return locationManager.speed }
    
    var body: some View {
        NavigationView {
            VStack {
                //                Text("Speedometer")
                //                    .font(.system(size: 42))
                //                    .padding(.bottom)
                Text(speed)
                    .foregroundColor(.green)
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text("km/h")
                    .font(.system(size: 50))
                    .padding(.bottom)
            }
            .navigationTitle("Speedometer")
        }
    }
}
struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView()
    }
}


