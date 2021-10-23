//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Alex Oliveira on 22/10/21.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? ""
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? ""
        }
        
        set {
            self.subtitle = newValue
        }
    }
}
