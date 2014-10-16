//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Dom on 9/4/14.
//  Copyright (c) 2014 dolodev. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    
    private struct SerializationKeys {
        static let name = "name"
        static let photo = "photo"
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(name, forKey: SerializationKeys.name)
        if let thePhoto = photo {
            coder.encodeObject(thePhoto, forKey: SerializationKeys.photo)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(SerializationKeys.name) as String
        photo = aDecoder.decodeObjectForKey(SerializationKeys.photo) as? UIImage // ? is nil if no photo
    }
    
    let name: String // let means immutable
    var photo: UIImage? // from UIKit
    var isComplete: Bool { // computed property, whether or not photo is nil
        get { // we make this a property, rather than a method
            return photo != nil
        }
    }
    init (name:String) { // because we have name as let, we need an initializer  // not called init function
        self.name = name
    }
}
