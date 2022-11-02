import SwiftUI
import CoreLocation
import MapKit

struct RouteView: View {
    
    @StateObject var mapData = MapViewModel()
    //Location Manager
    @State var locationManager = CLLocationManager()
    var body: some View {
        ZStack {
            //Map View
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                
                VStack(spacing: 0) {
                    HStack{
                        Image(systemName: "magnifyingglass.circle")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $mapData.searchText)
                            .colorScheme(.light)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
                    //Results
                    if !mapData.places.isEmpty && mapData.searchText != ""{
                        
                        ScrollView{
                            VStack(spacing: 10){
                                
                                ForEach(mapData.places){place in
                                    Text(place.place.name ?? "")
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .onTapGesture {
                                            mapData.selectPlace(place: place)
                                        }
                                    
                                    Divider()
                                }
                            }
                            .padding(.top)
                        }
                        .background(Color.white)
                    }
                }
                .padding()
                
                Spacer()
                
                HStack{
                    Button(action: mapData.focusLocation, label: {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    
                    Button(action: mapData.updateMapType, label: {
                        Image(systemName: mapData.mapType == .standard ? "network" : "map")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 20)
            }
        }
        .onAppear(perform: {
            //Settings Delegate
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        //Permission Denied Alert
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("Permission Denied"), message: Text("Enable Permission in App Settings"), dismissButton: .default(Text("Go to Settings"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        })
        .onChange(of: mapData.searchText, perform: { value in
            let delay = 0.3
            DispatchQueue.main.asyncAfter(deadline: .now() + delay){
                if value == mapData.searchText{
                    //Search
                    self.mapData.searchQuery()
                }
            }
        })
        .preferredColorScheme(.dark)
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
    }
}
