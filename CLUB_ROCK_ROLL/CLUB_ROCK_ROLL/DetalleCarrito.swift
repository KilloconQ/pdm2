//
//  DetalleAlumno.swift
//  Practica7_RinconSherem (iOS)
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct DetalleCarrito: View {

    let carrito: Carrito
  
  @State private var name: String = ""
  @State private var genre: String = ""
  @State private var author: String = ""
@State private var price: Double = 0.0
@State private var imgurl: String = ""
  @State private var validPrice = false
  @State private var notEmpty = false
    let coreDM: CoreDataManager

    var body: some View {
        VStack {
          Text("\(carrito.namec ?? name)")
          .font(Font.system(size: 24, weight: .bold))
          .foregroundColor(.red)
              .padding()
              .frame(width: 300, height: 25)
          Text("\(carrito.authorc ?? author)")
          .font(Font.system(size: 24, weight: .bold))
          .foregroundColor(.red)
              .padding()
              .frame(width: 300, height: 50)
          AsyncImage(url: URL(string: carrito.imgurlc ?? imgurl)){
            image in image
                .resizable()
                .scaledToFit()
        }placeholder: {
            ProgressView()
        }
            .cornerRadius(5)
            .padding()
          Text("\(carrito.genrec ?? genre)")
          .font(Font.system(size: 18, weight: .bold))
          .foregroundColor(.red)
              .padding()
              .frame(width: 300, height: 50)
          Text("\(carrito.pricec ?? price)")
          .font(Font.system(size: 18, weight: .bold))
          .foregroundColor(.red)
              .padding()
              .frame(width: 300, height: 50)
        }
        Spacer()// fin Vstack
    }// fin view
}

struct DetalleCarrito_Previews: PreviewProvider {
    static var previews: some View {
        let carrito = Carrito()
        DetalleCarrito(carrito: carrito, coreDM: CoreDataManager())
    }

}

