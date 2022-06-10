import GoogleMaps
import SwiftUI
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate{

    let mapView =  GMSMapView(frame: .null)
    var isAnimating: Bool = false

    var showPopUp: Binding<Bool>
    var tappedSpot: Binding<GMSMarker>
    let curViewSelect: viewSelect
    var ifUpdated: Binding<Bool>

    init(showPopUp: Binding<Bool>, tappedSpot: Binding<GMSMarker>, curViewSelect: viewSelect, ifUpdated: Binding<Bool>) {
        self.showPopUp = showPopUp
        self.tappedSpot = tappedSpot
        self.curViewSelect = curViewSelect
        self.ifUpdated = ifUpdated
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
    
    override func loadView() {
        super.loadView()
        mapView.camera = GMSCameraPosition.camera(withLatitude: 35.892442, longitude: 128.609194, zoom: 18.0)
        mapView.delegate = self
        
        curlocationManager.requestAlwaysAuthorization()

        self.view = mapView

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
//        tempInitFunc(map: mapView, SpotDataArray: &MySpotsMarker)
        
        if CLLocationManager.locationServicesEnabled() {
            curlocationManager.delegate = self
            curlocationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            curlocationManager.startUpdatingLocation()
        }
        
        switch curViewSelect {
        case .Spots:
            markSpotsLocation1(map: mapView)
        case .MySpots:
            markSpotsLocation2(map: mapView)
        case .FriendSpots:
            markSpotsLocation3(map: mapView)
        }

        
        let curLocation = GMSMarker()
        curLocation.position = getLocation() ?? CLLocationCoordinate2D(latitude: 35.89, longitude: 128.61)
        curLocation.icon = UIImage(systemName: "circle.fill")?.withTintColor(appUIColor)
        curLocation.map = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        showPopUp.wrappedValue = true
        tappedSpot.wrappedValue = marker
        return true // or false as needed.
    }
            
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        print(mapView.camera.zoom)
//        print(mapView.camera.target.longitude)
//        print(mapView.camera.target.latitude)
        if mapView.camera.zoom < 15{
            ifUpdated.wrappedValue = true
        }
        else{
            ifUpdated.wrappedValue = false
            if SpotsLocation.count != 0{
                print(SpotsLocation[0].longitude)
            }
        }
    }
}
