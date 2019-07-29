//
//  CeluladePerfil.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 12/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import UIKit

class PerfilCell: UITableViewCell{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var fotoperfil: UIImageView!
    
    @IBOutlet weak var nomelabel: UILabel!
    
    @IBOutlet weak var especlabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
