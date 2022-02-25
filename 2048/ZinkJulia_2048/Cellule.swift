//
//  Cellule.swift
//  ManonJulia_2048
//
//  Created by admin on 30/03/2021.
//

import Foundation

import UIKit

class GameCell: UICollectionViewCell {
    
    
    
    var valeurCase : Int = 0 {
        didSet {
            dessineCellule()
        }
    }
    var mouvement : Bool = false ;
    var texte : UILabel! = nil;
    
    
    
    
    
    func dessineCellule() {
        if texte == nil {
            texte = UILabel(frame: CGRect(x:0, y:0, width: self.bounds.size.width, height: self.bounds.size.height))
            texte.numberOfLines = 1
            texte.textAlignment = .center
            texte.textColor = UIColor.white
        }
        switch valeurCase {
        case let x where x == 2 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.96, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 4 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.88, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 8 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.80, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 16 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.72, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 32 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.64, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 64 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.56, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 128 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.48, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 256 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.40, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 512 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.32, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 1024 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.24, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x == 2048 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.16, saturation: 0.5, brightness: 1, alpha: 1)
        case let x where x >= 4096 :
            texte.text = "\(x)"
            self.backgroundColor = UIColor(hue: 0.08, saturation: 0.5, brightness: 1, alpha: 1)
        default :
            texte.text = ""
            self.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 1)
        }
        self.contentView.addSubview(texte)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)!
    }
    
}
 
