//
//  ViewController.swift
//  ManonJulia_2048
//
//  Created by admin on 30/03/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tailleGrille
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tailleGrille
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellules[indexPath.section][indexPath.row]!.dessineCellule()
        return cellules[indexPath.section][indexPath.row]!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:0, height:CGFloat(espacementCellules))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (cells.frame.width - CGFloat(espacementCellules*(tailleGrille+2)))/CGFloat(tailleGrille), height: (cells.frame.height - CGFloat(espacementCellules*(tailleGrille+2)))/CGFloat(tailleGrille))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cells.delegate = self
        cells.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: CGFloat(espacementCellules), bottom: 0, right: CGFloat(espacementCellules))
        layout.minimumLineSpacing = CGFloat(espacementCellules)
        
        cells.setCollectionViewLayout(layout, animated: false)
        
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                cellules[i][j] = cells.dequeueReusableCell(withReuseIdentifier: "cell2048", for: NSIndexPath(row: i, section: j) as IndexPath) as? GameCell
            }
        }
        
        cells.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
        
        let detectionMouvementR : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementR.direction = .right
        view.addGestureRecognizer(detectionMouvementR)
        let detectionMouvementL : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementL.direction = .left
        view.addGestureRecognizer(detectionMouvementL)
        let detectionMouvementH : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementH.direction = .up
        view.addGestureRecognizer(detectionMouvementH)
        let detectionMouvementB : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementB.direction = .down
        view.addGestureRecognizer(detectionMouvementB)
        
    }
    
    
    @objc func mouvement(sender:UISwipeGestureRecognizer) { switch sender.direction {
        case UISwipeGestureRecognizer.Direction.right:
            swipeRight()
        case UISwipeGestureRecognizer.Direction.left:
            swipeLeft()
        case UISwipeGestureRecognizer.Direction.up:
            swipeUp()
        case UISwipeGestureRecognizer.Direction.down:
            swipeDown()
        default:
            break }
    }
    
    
    @IBOutlet weak var cells: UICollectionView! ;

    @IBOutlet weak var boutonRemplir: UIButton! ;
    
    var tailleGrille : Int = 4
    var nombreLignes : Int
    var nombreColonnes : Int
    var cellules : [[GameCell?]]
    let espacementCellules = 15
    var score : Int = 0
    var highScore : Int = 0
    var aDejaGagne : Bool = false
    var grillePrecedente = [[Int]]()
    var grilleActuelle = [[Int]]()
        
    
    
    
    
    @IBAction func remplir() {
        score = 0
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                cellules[i][j]!.valeurCase = 0
            }
        }
        newTile()
        score = 0
        valeurScore.text = "\(score)"
    }


    required init?(coder aDecoder: NSCoder) {
        self.nombreLignes = tailleGrille
        self.nombreColonnes = tailleGrille
        cellules = [[]]
        cellules = ([[GameCell?]](repeating: [],count: nombreLignes))
        for i in 1...nombreLignes {
            let ligne = [GameCell?](repeating: nil, count: nombreColonnes)
            cellules[i-1] = ligne
        }
        super.init(coder: aDecoder)
        self.grillePrecedente = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
        self.grilleActuelle = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
    }
    
    init?(coder aDecoder: NSCoder, nombreLignes: Int, nombreColonnes: Int) {
        self.nombreLignes = tailleGrille
        self.nombreColonnes = tailleGrille
        cellules = [[]]
        cellules = ([[GameCell?]](repeating: [],count: nombreLignes))
        for i in 1...nombreLignes {
            let ligne = [GameCell?](repeating: nil, count: nombreColonnes)
            cellules[i-1] = ligne
        }
        super.init(coder: aDecoder)
        self.grillePrecedente = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
        self.grilleActuelle = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
    }

    
    func creerGrille() {
        cellules = ([[GameCell?]](repeating: [],count: tailleGrille))
        for i in 1...tailleGrille {
            let ligne = [GameCell?](repeating: nil, count: tailleGrille)
            cellules[i-1] = ligne
        }
        self.grillePrecedente = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
        self.grilleActuelle = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
    }
    
    
    
    
    
    func newTile() {
        // apparition d'une tile aléatoirement dans une des cellules vides
        // ou Game Over si le plateau est plein
        var L = [[Int]]()
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                if cellules[i][j]!.valeurCase <= 1 {
                    L.append([i,j])
                }
            }
        }
        let n = L.count
        if n == 0 {
            let defaite = UIAlertController(title : "Coup dur...", message : "Vous avez perdu :)", preferredStyle: .alert)
            let action = UIAlertAction(title : "Ok", style : .default) { (action : UIAlertAction) in }
            defaite.addAction(action)
            self.present(defaite, animated: true, completion: nil)
            for i in 0...(tailleGrille-1) {
                for j in 0...(tailleGrille-1) {
                    cellules[i][j]!.valeurCase = 0
                }
            }
            score = 0
            valeurScore.text = "\(score)"
        }
        else {
            let k = Int.random(in: 0...(n-1))
            let i2 = L[k][0]
            let j2 = L[k][1]
            cellules[i2][j2]!.valeurCase = 2
        }
    }

    
    
    // LEFT ---------------------------------------------------------
    
    
    func swipeLeft() {
        shiftLeft()
        mergeLeft()
        shiftLeft()
        newTile()
        if score > highScore {
            highScore = score
            valeurHighScore.text = "\(highScore)"
        }
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                grillePrecedente[i][j] = grilleActuelle[i][j]
                grilleActuelle[i][j] = cellules[i][j]!.valeurCase
            }
        }
    }
    
    
    func shiftLeft() {
        // décalage des tiles vers la gauche (le plus possible)
        for i in 0...(tailleGrille-1) {
            var L = [Int]()
            for j in 0...(tailleGrille-1) {
                let c = cellules[i][j]!.valeurCase
                if c >= 2 {
                    L.append(c)
                }
            }
            if !L.isEmpty {
                for j in 0...(tailleGrille-1) {
                    cellules[i][j]!.valeurCase = 0
                }
                let n = L.count
                for k in 0...(n-1) {
                    cellules[i][k]!.valeurCase = L[k]
                }
            }
        }
    }
    
    
    func mergeLeft() {
        // fusion des tiles de même valeur dans la direction gauche
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-2) {
                let c = cellules[i][j]!.valeurCase
                if c == cellules[i][j+1]!.valeurCase && cellules[i][j]!.valeurCase >= 2 {
                    cellules[i][j]!.valeurCase = c*2
                    cellules[i][j+1]!.valeurCase = 0
                    score = score + cellules[i][j]!.valeurCase
                    valeurScore.text = "\(score)"
                    if !aDejaGagne && cellules[i][j]!.valeurCase == 2048 {
                        let victoire = UIAlertController(title : "Bravo !", message : "Vous avez gagné :)", preferredStyle: .alert)
                        let action = UIAlertAction(title : "Continuer", style : .default) { (action : UIAlertAction) in }
                        victoire.addAction(action)
                        self.present(victoire, animated: true, completion: nil)
                        aDejaGagne = true
                    }
                }
            }
        }
    }
    
    
    // UP ------------------------------------------------------------------------
    
    func swipeUp() {
        shiftUp()
        mergeUp()
        shiftUp()
        newTile()
        if score > highScore {
            highScore = score
            valeurHighScore.text = "\(highScore)"
        }
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                grillePrecedente[i][j] = grilleActuelle[i][j]
                grilleActuelle[i][j] = cellules[i][j]!.valeurCase
            }
        }
    }
    
    func shiftUp() {
        for i in 0...(tailleGrille-1) {
            var L = [Int]()
            for j in 0...(tailleGrille-1) {
                let c = cellules[j][i]!.valeurCase
                if c >= 2 {
                    L.append(c)
                }
            }
            if !L.isEmpty {
                for j in 0...(tailleGrille-1) {
                    cellules[j][i]!.valeurCase = 0
                }
                let n = L.count
                for k in 0...(n-1) {
                    cellules[k][i]!.valeurCase = L[k]
                }
            }
        }
    }
    
    
    func mergeUp() {
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-2) {
                let c = cellules[j][i]!.valeurCase
                if c == cellules[j+1][i]!.valeurCase && cellules[j][i]!.valeurCase >= 2 {
                    cellules[j][i]!.valeurCase = c*2
                    cellules[j+1][i]!.valeurCase = 0
                    score = score + cellules[j][i]!.valeurCase
                    valeurScore.text = "\(score)"
                    if !aDejaGagne && cellules[i][j]!.valeurCase == 2048 {
                        let victoire = UIAlertController(title : "Bravo !", message : "Vous avez gagné :)", preferredStyle: .alert)
                        let action = UIAlertAction(title : "Continuer", style : .default) { (action : UIAlertAction) in }
                        victoire.addAction(action)
                        self.present(victoire, animated: true, completion: nil)
                        aDejaGagne = true
                    }
                }
            }
        }
    }

    
    
    // RIGHT -----------------------------------------------------------
    
    func swipeRight() {
        flipHori()
        shiftLeft()
        mergeLeft()
        shiftLeft()
        flipHori()
        newTile()
        if score > highScore {
            highScore = score
            valeurHighScore.text = "\(highScore)"
        }
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                grillePrecedente[i][j] = grilleActuelle[i][j]
                grilleActuelle[i][j] = cellules[i][j]!.valeurCase
            }
        }
    }
    
    func flipHori() {
        var C = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                C[i][j] = cellules[i][j]!.valeurCase
            }
        }
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                cellules[i][j]!.valeurCase = C[i][(tailleGrille-1)-j]
            }
        }
    }
    
    
    
    // DOWN -------------------------------------------------
    
    func swipeDown() {
        flipVerti()
        shiftUp()
        mergeUp()
        shiftUp()
        flipVerti()
        newTile()
        if score > highScore {
            highScore = score
            valeurHighScore.text = "\(highScore)"
        }
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                grillePrecedente[i][j] = grilleActuelle[i][j]
                grilleActuelle[i][j] = cellules[i][j]!.valeurCase
            }
        }
    }
    
    func flipVerti() {
        var C = Array(repeating: (Array(repeating: 0, count: tailleGrille)), count: tailleGrille)
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                C[i][j] = cellules[i][j]!.valeurCase
            }
        }
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                cellules[i][j]!.valeurCase = C[(tailleGrille-1)-i][j]
            }
        }
    }
    
    
    
    @IBAction func undo() {
        for i in 0...(tailleGrille-1) {
            for j in 0...(tailleGrille-1) {
                cellules[i][j]!.valeurCase = grillePrecedente[i][j]
            }
        }
    }
    
    
    
    
    
    @IBOutlet weak var valeurScore : UILabel!
    
    @IBOutlet weak var valeurHighScore : UILabel!
    
    @IBOutlet weak var boutonUndo : UIButton!
    
    @IBOutlet weak var boutonHome : UIButton!
    
    @IBAction func home(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
