//
//  CLUB_ROCK_ROLLApp.swift
//  CLUB_ROCK_ROLL
//
//  Created by alumno on 16/05/22.
//

import SwiftUI

@main
struct CLUB_ROCK_ROLLApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(coreDM: CoreDataManager())
        }
    }
}
