//
//  NosotrosView.swift
//  CLUB_ROCK_ROLL
//
//  Created by Fernando Corrales on 18/05/22.
//

import SwiftUI

struct NosotrosView: View {
    var body: some View {
        VStack {
//            HStack {
//                Text("El Club del Rock 'n' Roll")
//            }
            HStack {
                Image("club")
                    .resizable()
                    .scaledToFit()
            }
            VStack {
                Text(
                    "El Club del Rock 'n' Roll es una tienda mexicana de Vinyl, LP's, Acetatos o como te guste llamarles. Por si fuera poco cada tanto organizamos eventos de cata para escuchar un buen acetato mientras tomas un mezcal."
                )
                .padding()
                Text(
                    "Por si fuera poco organiza eventos con artistas, catas de mezcal y vino y venta de merchandising. Además, si te dedicas a la música aquí podemos masterizar, grabar en vinil y ocuparnos del arte de tu proyecto."
                )
                .padding()
            }

        }
        .navigationTitle("El Club del Rock 'n' Roll")
    }
}

struct NosotrosView_Previews: PreviewProvider {
    static var previews: some View {
        NosotrosView()
    }
}
