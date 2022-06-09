import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {
    @Binding var showPopUp: Bool
    @Binding var tappedSpot: GMSMarker

    func makeUIViewController(context: Context) -> MapViewController {
        return MapViewController(showPopUp: $showPopUp, tappedSpot: $tappedSpot)
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
    }
}
