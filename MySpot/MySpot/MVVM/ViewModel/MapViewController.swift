import GoogleMaps
import SwiftUI
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate{

    let map =  GMSMapView(frame: .null)
    var isAnimating: Bool = false

    override func loadView() {
        super.loadView()
        map.camera = GMSCameraPosition.camera(withLatitude: 35.89, longitude: 128.61, zoom: 15.0)
        self.view = map
        
        curlocationManager.requestAlwaysAuthorization()

        tempInitFunc(map: map)
        
        if CLLocationManager.locationServicesEnabled() {
            curlocationManager.delegate = self
            curlocationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            curlocationManager.startUpdatingLocation()
        }
        
        let curLocation = GMSMarker()
        curLocation.position = getLocation() ?? CLLocationCoordinate2D(latitude: 35.89, longitude: 128.61)
        curLocation.icon = UIImage(systemName: "circle.fill")?.withTintColor(appUIColor)
        curLocation.map = map

//        print(curlocationManager.location?.coordinate.longitude))

        
        
        /*
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 35.89, longitude: 128.61)
        marker.title = "IT-5"
        marker.snippet = "Korea"
        marker.icon = GMSMarker.markerImage(with: UIColor.green)
        marker.map = map
         */
    
    /*
         // Do any additional setup after loading the view.
         // Create a GMSCameraPosition that tells the map to display the
         // coordinate -33.86,151.20 at zoom level 6.
         let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
         let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
         self.view.addSubview(mapView)

         // Creates a marker in the center of the map.
         let marker = GMSMarker()
         marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
         marker.title = "Sydney"
         marker.snippet = "Australia"
         marker.map = mapView
     */
    
    }
}
