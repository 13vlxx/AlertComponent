//
//  ContentView.swift
//  AlertComponent
//
//  Created by Alex on 18/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var validateAlertIsPresented: Bool = false
    @State var destructiveAlertIsPresented: Bool = false
    @State var twoButtonsAlertIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                
                // Alerte simple
                Button {
                    print("Good")
                    self.validateAlertIsPresented = true
                } label: {
                    Text("Alerte simple avec titre").frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(.green))
                }.alert(isPresented: $validateAlertIsPresented) {
                    Alert(title: Text("Simple alerte"), message: Text("Voici mon alerte"))
                }
                
                // Alerte avec button de destruction
                Button {
                    self.destructiveAlertIsPresented.toggle()
                } label: {
                    Text("Alerte de suppression").frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(.red))
                }.alert(isPresented: $destructiveAlertIsPresented) {
                    Alert(title: Text("Alert App"), message: Text("Ce message sera supprimé"), dismissButton: Alert.Button.destructive(Text("Êtes-vous sûr ?")))
                }
                
                // Alerte avec 2 buttons + Callbacks
                Button {
                    self.twoButtonsAlertIsPresented.toggle()
                } label: {
                    Text("Alerte a 2 buttons + Callback").frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(.blue))
                }.alert(isPresented: $twoButtonsAlertIsPresented) {
                    Alert(title: Text("Alert App"), message: Text("Souhaitez vous continuer l'opération ?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                        print("Super c'est validé")
                    }), secondaryButton: Alert.Button.cancel(Text("Annuler"), action: {
                        print("Non, merci !")
                    }))
                }

                
                //Fin de Vstack
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
