import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {
    @Binding var showPopUp: Bool
    @Binding var tappedSpot: GMSMarker
    let curViewSelect: viewSelect
    @Binding var ifUpdated: Bool

    func makeUIViewController(context: Context) -> MapViewController {
        return MapViewController(showPopUp: $showPopUp, tappedSpot: $tappedSpot, curViewSelect: curViewSelect, ifUpdated: $ifUpdated)
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
    }
}
