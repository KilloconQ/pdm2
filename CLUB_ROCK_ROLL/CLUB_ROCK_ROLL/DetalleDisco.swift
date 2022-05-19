//
//  DetalleAlumno.swift
//  Practica7_RinconSherem (iOS)
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct DetalleDisco: View {

    let discos: Discos
  @State private var name: String = ""
  @State private var genre: String = ""
  @State private var author: String = ""
@State private var price: Double = 0.0
@State private var imgurl: String = ""
  @State private var validPrice = false
  @State private var notEmpty = false
    let coreDM: CoreDataManager
    @Binding var necesitaRefresh: Bool

    var body: some View {
        VStack {
          Text("\(discos.name ?? name)")
          .font(Font.system(size: 40, weight: .bold))
          .foregroundColor(.yellow)
              .padding()
              .frame(width: 300, height: 25)
          Text("\(discos.author ?? author)")
          .font(Font.system(size: 30, weight: .bold))
          .foregroundColor(.yellow)
              .padding()
              .frame(width: 300, height: 50)
          AsyncImage(url: URL(string: discos.imgurl ?? imgurl)){
            image in image
                .resizable()
                .scaledToFit()
        }placeholder: {
            ProgressView()
        }
            .cornerRadius(5)
            .padding()
          Text("\(discos.genre ?? genre)")
          .font(Font.system(size: 18, weight: .bold))
          .foregroundColor(.black)
              .padding()
              .frame(width: 300, height: 50)
          //Text("\(discos.price ?? price)")
          Text(String(format:"$\(discos.price ?? price)"))
          .font(Font.system(size: 18, weight: .bold))
          .foregroundColor(.black)
              .padding()
              .frame(width: 300, height: 50)

          Button("Añadir al carrito") {
            let name = discos.name ?? "Empty"
            let price = discos.price ?? 0.0
            let genre = discos.genre ?? "Empty"
            let author = discos.author ?? "Empty"
            let imgurl = discos.imgurl ?? "Empty"
            var validPrice = true
            var notEmpty = true
            if(name == "Empty" || genre == "Empty" || author == "Empty" || imgurl == "Empty"){
              notEmpty = false
            }
            if (price <= 0) {
              validPrice = false
            }
            if (notEmpty && validPrice){
              coreDM.saveCarrito(namec: name, genrec: genre, authorc: author, pricec: Float(price), imgurlc: imgurl)
            }
        }
          .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.yellow)
            .cornerRadius(15.0)
        }
        Spacer()// fin Vstack
    }// fin view
}

struct DetalleDisco_Previews: PreviewProvider {
    static var previews: some View {
        let discos = Discos()
        DetalleDisco(discos: discos, coreDM: CoreDataManager(), necesitaRefresh: .constant(false))
    }

}

