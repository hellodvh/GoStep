//
//  LocationManager.swift
//  GoStep
//
//  Created by Dylan Vanhout on 2022/10/30.
//

import Foundation
import CoreLocation
import Combine
import MapKit
import SwiftUI

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    let objectWillChange = PassthroughSubject<Void, Never>()
 
    @Published var speed: String = "" {
        willSet { objectWillChange.send() }
    }
    override init() {
        super.init()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        if (location.speedAccuracy >= 0) {
            let s: Double = 2.23694 * location.speed
            self.speed = String(format: "%.0f", s)
        }
    }
}
