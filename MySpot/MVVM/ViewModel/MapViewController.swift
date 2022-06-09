import GoogleMaps
import SwiftUI
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate{

    let map =  GMSMapView(frame: .null)
    var isAnimating: Bool = false

    var showPopUp: Binding<Bool>
    var tappedSpot: Binding<GMSMarker>

    init(showPopUp: Binding<Bool>, tappedSpot: Binding<GMSMarker>) {
        self.showPopUp = showPopUp
        self.tappedSpot = tappedSpot
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
    
    override func loadView() {
        super.loadView()
        map.camera = GMSCameraPosition.camera(withLatitude: 35.89, longitude: 128.61, zoom: 15.0)
        map.delegate = self
        
        curlocationManager.requestAlwaysAuthorization()

        self.view = map

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        showPopUp.wrappedValue = true
        return true // or false as needed.
    }
}
