//
//  ImageLocation.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import UIKit

struct ImageLocation {
    var image: UIImage
    
    init(image: UIImage) {
      self.image = image
    }
    
    init?(dictionary: [String: String]) {
      guard
        let photo = dictionary["Photo"],
        let image = UIImage(named: photo)
        else {
          return nil
      }
      self.init(image: image)
    }
    
    static func allPhotos() -> [ImageLocation] {
      var photos: [ImageLocation] = []
      guard
        let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
        let photosFromPlist = NSArray(contentsOf: URL) as? [[String: String]]
        else {
          return photos
      }
      for dictionary in photosFromPlist {
        if let photo = ImageLocation(dictionary: dictionary) {
          photos.append(photo)
        }
      }
      return photos
    }
}
