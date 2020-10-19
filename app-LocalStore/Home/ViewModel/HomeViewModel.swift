//
//  HomeViewModel.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import Foundation

class HomeViewModel {
    
    var listLocations: [Location] = [] {
        didSet {
            listLocationsDidUpdate?()
        }
    }
    
    var listLocationsDidUpdate: (() -> Void)?
    
    var count: Int {
        listLocations.count
    }
    
    func fetchListLocations() {
        Service.fetchLocations() { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let list):
                self.listLocations = list
            case .failure:
                self.listLocationsDidUpdate?()
            }
        }
    }
}
