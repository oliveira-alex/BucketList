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
            if self.title == nil || self.title == "Unkown place" {
                return ""
            } else {
                return self.title!
            }
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            if self.subtitle == nil || self.subtitle == "No description" {
                return ""
            } else {
                return self.subtitle!
            }
        }
        
        set {
            self.subtitle = newValue
        }
    }
}
