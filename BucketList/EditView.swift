//
//  EditView.swift
//  BucketList
//
//  Created by Alex Oliveira on 22/10/21.
//

import MapKit
import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $placemark.wrappedTitle)
                    TextField("Description", text: $placemark.wrappedSubtitle)
                }
            }
            .navigationTitle("Edit place")
            .toolbar {
                Button("Done") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
    }
}
