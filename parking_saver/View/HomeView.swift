//
//  HomeView.swift
//  parking_saver
//
//  Created by 林 明虎 on 2024/11/19.
//

import SwiftUI
import MapKit

struct ParkingLocation: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct HomeView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.681236, longitude: 139.767125),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var savedLocation: ParkingLocation?

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: savedLocation == nil ? [] : [savedLocation!]) { location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                if let userLocation = locationManager.userLocation {
                    region.center = userLocation
                }
            }

            Button(action: {
                // 現在の位置を駐車位置として保存
                if let userLocation = locationManager.userLocation {
                    savedLocation = ParkingLocation(coordinate: userLocation)
                }
            }) {
                Text("駐車位置を記録")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
