import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    
    @Published var mapView = MKMapView()
    //Region
    @Published var region : MKCoordinateRegion!
    //Alert
    @Published var permissionDenied = false
    //Map Type
    @Published var mapType : MKMapType = .standard
    //Search Text
    @Published var searchText = ""
    //Searched Places
    @Published var places : [Place] = []
    //Uopdate Map Type
    func updateMapType(){
        if mapType == .standard{
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    //Location Focus
    func focusLocation(){
        
        guard let _ = region else{return}
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    //Search Query
    func searchQuery(){
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        //Fetch
        MKLocalSearch(request: request).start { (response, _) in
            
            guard let result = response else{return}
            
            self.places = result.mapItems.compactMap({ (item) -> Place? in
                return Place(place: item.placemark)
            })
        }
    }
    
    //Select Search Result
    func selectPlace(place: Place){
        //Pin map
        searchText = ""
        
        guard let coordinate = place.place.location?.coordinate else{return}
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.place.name ?? "Name Unknown"
        
        //mapView.removeAnnotation(mapView.annotations)
        
        mapView.addAnnotation(pointAnnotation)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //Check Permissions
        switch manager.authorizationStatus {
        case .denied:
            //Alert
            permissionDenied.toggle()
        case .notDetermined:
            //Request
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            //If Permission Given
            manager.requestLocation()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //Error
        print(error.localizedDescription)
        
    }
    
    //Get User Region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else{return}
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        //Update Map
        self.mapView.setRegion(self.region, animated: true)
        //Smooth Animation
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
