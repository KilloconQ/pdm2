//
//  ContentView.swift
//  Shared
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct Admin: View {

    let coreDM: CoreDataManager
    @State private var name: String = ""
    @State private var genre: String = ""
    @State private var author: String = ""
  @State private var price: String = ""
  @State private var imgurl: String = ""
    @State private var discos: [Discos] = [Discos]()
    @State private var necesitaRefresh: Bool = false
  @State private var validPrice = false
  @State private var notEmpty = false

  private func llenaDiscos() {
      discos = coreDM.getAllDiscos()
  }

    var body: some View {
        TabView{
            NavigationView{
                VStack {
                    TextField("Ingresa el nombre del disco", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Ingresa el género del disco", text: $genre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Ingresa el autor del disco", text: $author)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Ingresa el precio del disco", text: $price)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Ingresa la imagen del disco", text: $imgurl)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Guardar") {
                      var validPrice = true
                      var notEmpty = true
                      if(name.isEmpty || price.isEmpty || genre.isEmpty || author.isEmpty || imgurl.isEmpty){
                        notEmpty = false
                      }
                      if (Float(price)! <= 0) {
                        validPrice = false
                      }
                      if (notEmpty && validPrice){
                        coreDM.saveDiscos(name: name, genre: genre, author: author, price: Float(price)!, imgurl: imgurl)
                      }

                    }// fin button
                    List {
                        ForEach(discos, id: \.self) { discos in
                            NavigationLink(
                                destination:
                                DetalleDisco(discos: discos, coreDM: coreDM, necesitaRefresh: $necesitaRefresh),
                                label: {
                                    Text(discos.name ?? "")
                                })//fin label
                        }//fin ForEach
                    }//fin List
                    .listStyle(PlainListStyle())
                    .accentColor(necesitaRefresh ? .white: .black)
                    Spacer()
                } // fin VStack
                .padding()
                .navigationTitle("Discos")
                .onAppear(perform: {
                    llenaDiscos()
                })
            }.tabItem{
                Text("Discos")
                Image(systemName: "graduationcap")
            }
          NavigationView{
              VStack {
                TextField("Ingresa el nombre del disco", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Ingresa el género del disco", text: $genre)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Ingresa el autor del disco", text: $author)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Ingresa el precio del disco", text: $price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Ingresa la imagen del disco", text: $imgurl)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Guardar") {
                  coreDM.saveDiscos(name: name, genre: genre, author: author, price: Float(price)!, imgurl: imgurl)
                }// fin button
                List {
                    ForEach(discos, id: \.self) { discos in
                        NavigationLink(
                            destination:
                            DetalleDisco(discos: discos, coreDM: coreDM, necesitaRefresh: $necesitaRefresh),
                            label: {
                                Text(discos.name ?? "")
                            })//fin label
                    }//fin ForEach
                }//fin List
                .listStyle(PlainListStyle())
                .accentColor(necesitaRefresh ? .white: .black)
                Spacer()
            } // fin VStack
            .padding()
            .navigationTitle("Discos")
            .onAppear(perform: {
                llenaDiscos()
            })
          }.tabItem{
              Text("Profesor")
              Image(systemName: "briefcase")
          }
      }
  }
}


struct Admin_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

