//
//  ContentView.swift
//  Shared
//
//  Created by alumno on 17/03/22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var imgurl: String
  var horario: String
  var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {

    let coreDM: CoreDataManager
    @State private var name: String = ""
    @State private var genre: String = ""
    @State private var author: String = ""
  @State private var price: String = ""
  @State private var imgurl: String = ""
    @State private var discos: [Discos] = [Discos]()
  @State private var carrito: [Carrito] = [Carrito]()
    @State private var necesitaRefresh: Bool = false
  @State private var validPrice = false
  @State private var notEmpty = false
  @State var showOrderSheet = false
  @State var showOrderSheet2 = false
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.429262143605804, longitude: -99.1688672957473), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

  var crr = Place(name: "Club del Rock 'n' Roll Reforma", imgurl: "https://media-cdn.tripadvisor.com/media/photo-s/0c/3a/d8/17/crobar-london.jpg", horario: "Abierto 9:00 - 19:00", coordinate: CLLocationCoordinate2D(latitude: 19.429262143605804, longitude: -99.1688672957473))

  var rRecords = Place(name: "Club del Rock 'n' Roll Roma", imgurl: "https://recordstores.love/images/mthumb.php?w=1200&rot=0&src=s2101_32251.jpg", horario: "Abierto 10:00 - 21:00", coordinate: CLLocationCoordinate2D(latitude: 19.417174360623285, longitude: -99.16427973166336))

  var faramalla = Place(name: "Club del Rock 'n' Roll Centro", imgurl: "https://www.dondeir.com/wp-content/uploads/2017/05/tienda-de-discos-chowell.jpg", horario: "Abierto 9:30 - 20:00", coordinate: CLLocationCoordinate2D(latitude: 19.429680892814034, longitude: -99.15189575135513))

  private func llenaDiscos() {
      discos = coreDM.getAllDiscos()
  }

  private func llenaCarrito() {
    carrito = coreDM.getAllCarrito()
  }
  

    var body: some View {
        TabView{
          NavigationView{
              Registro()
          }.tabItem{
            Text("Registro")
            Image(systemName: "book")
        }
          NavigationView{
              VStack {
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
            .navigationBarItems(trailing: Button(action: {
              showOrderSheet = true
              showOrderSheet2 = false
            }, label: {
                Image(systemName: "cart")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }))
            .sheet(isPresented: $showOrderSheet) {
                Cart(coreDM: CoreDataManager())
            }
            .navigationBarItems(trailing: Button(action: {
              showOrderSheet = false
              showOrderSheet2 = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }))
            .sheet(isPresented: $showOrderSheet2) {
                CreaDisco(coreDM: CoreDataManager())
            }
            .navigationBarItems(trailing: Button(action: {
              llenaDiscos()
            }, label: {
                Image(systemName: "arrow.down.right.and.arrow.up.left")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }))
            .sheet(isPresented: $showOrderSheet) {
                Cart(coreDM: CoreDataManager())
            }
          }.tabItem{
              Text("Discos")
              Image(systemName: "opticaldisc")
          }
          NavigationView{
              EventosView()
          }.tabItem{
              Text("Eventos")
              Image(systemName: "calendar")
          }
          NavigationView{
              NosotrosView()
          }.tabItem{
              Text("Nosotros")
              Image(systemName: "person")
          }
          NavigationView {
            Map(coordinateRegion: $region, annotationItems: [crr, rRecords, faramalla]) { place in
              MapAnnotation(coordinate:
                              place.coordinate){
                NavigationLink {
                  LocationDetailsView(place: place)
                } label: {
                  PlaceAnnotationView(title: place.name)
                }
              }
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("Ubicaciones")
            .navigationBarTitleDisplayMode(.inline)

          }
          .tabItem{
              Text("Sucursales")
              Image(systemName: "map")
          }
        }
        .accentColor(.yellow)
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

