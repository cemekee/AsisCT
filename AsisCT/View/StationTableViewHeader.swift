//
//  StationTableViewHeader.swift
//  AsisCT
//
//  Created by Cem Eke on 19.11.2021.
//

import Foundation
import UIKit

class StationTableViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var lblStation: UILabel!
    
    @IBOutlet weak var lblRoute: UILabel!
    
    @IBOutlet weak var lblRemaining: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblRemaining.text = "Remaining Time"
        lblRoute.text = "Route Name"
        
    }
    
//    func update(data:Station) {
//        self.lblStationName.text = data.stationName
//        self.lblRouteName.text = data.
//    }
    
}
