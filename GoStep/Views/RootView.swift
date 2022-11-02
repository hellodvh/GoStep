import SwiftUI

struct RootView: View {
    
    var body: some View {
        TabView {
            StatsView()
                .tabItem{
                    Image(systemName: "waveform.path.ecg")
                        .renderingMode(.original)
                    Text("Health Stats")
                }
            SpeedView()
                .tabItem{
                    Image(systemName: "speedometer")
                        .symbolRenderingMode(.palette)
                    Text("Speedometer")
                }
            RouteView()
                .tabItem{
                    Image(systemName: "mappin.and.ellipse")
                        .symbolRenderingMode(.palette)
                    Text("Map Finder")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()  
    }
}
