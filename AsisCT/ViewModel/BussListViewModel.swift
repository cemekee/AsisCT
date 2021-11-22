//
//  BussListViewModel.swift
//  AsisCT
//
//  Created by Cem Eke on 19.11.2021.
//

import UIKit
import Foundation
import MapKit

class BussListViewModel {
    
    var stations = [Station]()
    var updateUI : ()->() = {}
    
    func fetchUsers() {
        Service.instance.request("https://private-ba4027-busremainingtime.apiary-mock.com/stations", params: nil) { (response : Buss) in
            self.stations = response.stations
                self.updateUI()
        }
        self.updateUI()
    }
    
    func addBookMark(s:Int) {
       
    }
}
