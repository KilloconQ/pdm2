//
//  Cart.swift
//  CLUB_ROCK_ROLL
//
//  Created by alumno on 18/05/22.
//

import SwiftUI

struct Cart: View {
  let coreDM: CoreDataManager
@State private var carrito: [Carrito] = [Carrito]()
  @State private var necesitaRefresh: Bool = false
@State private var validPrice = false
@State private var notEmpty = false
  private func llenaCarrito() {
    carrito = coreDM.getAllCarrito()
  }
    var body: some View {
      Text("Carrito")
      VStack {
        List {
            ForEach(carrito, id: \.self) { carrito in
              HStack {
                Text("\(carrito.namec ?? "")")
                Spacer()
                Text(String(format:"$\(carrito.pricec ?? 0.0)"))
              }
//              Text("\(carrito.namec ?? "")\t \(carrito.pricec ?? 0.0)")

            }//fin ForEach
            .onDelete(perform: {
                indexSet in indexSet.forEach{
                    index in
                    let carrito = carrito[index]
                    coreDM.deleteCarrito(Carrito: carrito)
                    llenaCarrito()
                }//fin ForEach
            })
        }//fin List
        .listStyle(PlainListStyle())
        .accentColor(necesitaRefresh ? .white: .black)
        Spacer()
    } // fin VStack
    .padding()
    .navigationTitle("Carrito")
    .onAppear(perform: {
        llenaCarrito()
    })
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart(coreDM: CoreDataManager())
    }
}
