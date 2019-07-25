//
//  CientistasCell.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit

class CientistasCell: UITableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var fotoCientista: UIImageView!
    
    @IBOutlet weak var nomeCientista: UILabel!
    
    
    @IBOutlet weak var especializacaoCientista: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
