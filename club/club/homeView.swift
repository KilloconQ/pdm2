//
//  homeView.swift
//  club
//
//  Created by Fernando Corrales on 04/05/22.
//

import SwiftUI

struct homeView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Bienvenido [usuario]")
            }
            TextField { }
            Spacer()
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
