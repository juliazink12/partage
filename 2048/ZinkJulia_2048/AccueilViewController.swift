//
//  AccueilViewController.swift
//  ManonJulia_2048
//
//  Created by Julia Zink on 13/04/2021.
//

import UIKit

class AccueilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var bouton4 : UIButton!
    @IBOutlet weak var bouton5 : UIButton!
    @IBOutlet weak var bouton6 : UIButton!
    @IBOutlet weak var bouton8 : UIButton!
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue4") {
            (segue.destination as! ViewController).tailleGrille = 4
        }
        else if (segue.identifier == "segue5") {
            (segue.destination as! ViewController).tailleGrille = 5
            (segue.destination as! ViewController).creerGrille()
        }
        else if (segue.identifier == "segue6") {
            (segue.destination as! ViewController).tailleGrille = 6
            (segue.destination as! ViewController).creerGrille()
        }
        else if (segue.identifier == "segue8") {
            (segue.destination as! ViewController).tailleGrille = 8
            (segue.destination as! ViewController).creerGrille()
        }
    }
    
    
    
    // changer valeur de tailleGrille (et espacement cellules ?)
    
}
