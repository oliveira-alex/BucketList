//
//  ContentView.swift
//  BucketList
//
//  Created by Alex Oliveira on 20/10/2021.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var showingFailedAuthenticateAlert = false
    
    var body: some View {
        if isUnlocked {
            PlacesView()
        } else {
            Button("Unlock Places") { self.authenticate() }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .alert(isPresented: $showingFailedAuthenticateAlert) {
                    Alert(title: Text("No biometrics"), message: Text("Unlock without authenticate?"), primaryButton: .default(Text("Yes"), action: {
                        self.isUnlocked = true
                    }), secondaryButton: .cancel())
                }
        }
        
    }
        
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock you places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // Shows the default "Face Not Recognized" alert
                    }
                }
            }
        } else {
            // no biometry
            DispatchQueue.main.async {
                self.showingFailedAuthenticateAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


