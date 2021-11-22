//
//  StationTableViewCell.swift
//  AsisCT
//
//  Created by Cem Eke on 19.11.2021.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRoute: UILabel!
    
    @IBOutlet weak var lblRemaining: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func update(data:Bus) {
//        self.routeCode.text = data.routeCode
//        self.remainingTime.text = data.remainingTime
//    }
}
