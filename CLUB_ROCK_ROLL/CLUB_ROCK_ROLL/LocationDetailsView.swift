import SwiftUI
import MapKit

struct LocationDetailsView: View {
  let place: Place
  
  var body: some View {
    VStack(spacing: 20) {
      Text(place.name)
        .font(.title)
      AsyncImage(url: URL(string: place.imgurl)){
        image in image
            .resizable()
            .scaledToFit()
    }placeholder: {
        ProgressView()
    }
        .cornerRadius(5)
        .padding()
      Text(place.horario)
        .font(.title2)
    }
    .navigationTitle(place.name)
  }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "\(latitude);\(longitude)"
  }
}
