//
//  Registro.swift
//  crud_lista_pg_19feb22_pm
//
//  Created by Alejandro Rincón
//

import SwiftUI

struct Registro: View {
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var respuesta = Response(id: -1, token: "0")
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Registro")
                .font(Font.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                    .padding()
                    .frame(width: 300, height: 50)
            Text("Regístrate para recibir cupones y sorpresas cada semana")
                .padding()
                .frame(width: 300)
            TextField("Correo", text: $mail)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.gray)
                .cornerRadius(20.0)
            SecureField("Contraseña", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.gray)
                .cornerRadius(20.0)
            Button("Confirmar", action: {
                postdatos(parameters: ["email": self.mail, "password": self.password])
            }).font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.yellow)
                .cornerRadius(15.0)
            Text("ID de confirmación: \(respuesta.id)")
                .padding()
                .frame(width: 300)
            Text("Token de confirmación: \(respuesta.token)")
                .padding()
                .frame(width: 300)
        }.padding([.leading, .trailing], 27.5)
    }

    func postdatos(parameters: [String: Any]){
        guard let url = URL(string: "https://reqres.in/api/register") else
        {
            print("error url")
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request)
        { (data,res,error) in

            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }

            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(Response.self, from: d)
                    print("Los datos son \(result)")
                    DispatchQueue.main.async {
                        print("Los datos son \(result)")
                        self.respuesta = result
                    } //fin async
                } // fin data
                else
                {
                    print("No hay datos")
                }
            }//fin del do
            catch let JsonError
            {
                print("Error en json", JsonError.localizedDescription)
             }
        }.resume() // fin dataTask
    }
}

