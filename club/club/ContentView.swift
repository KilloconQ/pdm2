//
//  ContentView.swift
//  club
//
//  Created by Fernando Corrales on 26/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            //abrir TabView
            Text("Bienvenido")
                .tabItem{
                Image(systemName: "phone.fill")
                Text("Inicio")
            }
            Text("Otra cosa")
                .tabItem{
                Image(systemName: "tv.fill")
                Text("TV")
            }
            ListaJSON()
                .tabItem{
                Image(systemName: "mail.fill")
                Text("Mail")
            }
        }//cerrar TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
