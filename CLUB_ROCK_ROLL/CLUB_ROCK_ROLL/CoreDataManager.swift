//
//  CoreDataManager.swift
//  Practica7_RinconSherem (iOS)
//
//  Created by alumno on 17/03/22.
//

import Foundation
import CoreData

class CoreDataManager {

    let persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("error Core Data Store \(error.localizedDescription)")
            }
        }
    }

    func update() {

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }

    }

    func getAllDiscos() -> [Discos] {
        let fetchRequest: NSFetchRequest<Discos> = Discos.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }

  func getAllCarrito() -> [Carrito] {
      let fetchRequest: NSFetchRequest<Carrito> = Carrito.fetchRequest()
      do {
          return try persistentContainer.viewContext.fetch(fetchRequest)
      } catch {
          return []
      }
  }

  func saveDiscos(name: String, genre: String, author: String, price: Float, imgurl: String) {

        let discos = Discos(context: persistentContainer.viewContext)
        discos.name = name
        discos.genre = genre
        discos.author = author
        discos.price = Double(price)
        discos.imgurl = imgurl
        discos.product_id = UUID()
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error al guardar disco \(error)")
        }
    }

    func saveCarrito(namec: String, genrec: String, authorc: String, pricec: Float, imgurlc: String) {

      let carrito = Carrito(context: persistentContainer.viewContext)
      carrito.namec = namec
      carrito.genrec = genrec
      carrito.authorc = authorc
      carrito.pricec = Double(pricec)
      carrito.imgurlc = imgurlc
      carrito.product_idc = UUID()
      do {
          try persistentContainer.viewContext.save()
      } catch {
          print("Error al guardar carrito \(error)")
      }
    }
  func deleteDisco(Discos: Discos){
      persistentContainer.viewContext.delete(Discos)
      do{
          try persistentContainer.viewContext.save()
      }
      catch{
          persistentContainer.viewContext.rollback()
      }
  }//fin delete
  func deleteCarrito(Carrito: Carrito){
      persistentContainer.viewContext.delete(Carrito)
      do{
          try persistentContainer.viewContext.save()
      }
      catch{
          persistentContainer.viewContext.rollback()
      }
  }//fin delete
}
