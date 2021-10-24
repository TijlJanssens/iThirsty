//
//  tweedePaginaMap.swift
//  iThirsty
//
//  Created by Christel Gogaert on 09/09/2019.
//  Copyright © 2019 HoleLottaGangsh*t. All rights reserved.
//

import UIKit

class tweedePaginaMap: UIViewController {

    @IBOutlet weak var gebouwVerander: UILabel!
    @IBOutlet weak var afbeelding: UIImageView!
    @IBOutlet weak var beschrijving: UILabel!
   
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var stakker: UIStackView!
    @IBOutlet weak var terugKnop: UIButton!
    
    var getal = 100
    var automaat = Dbinnen1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Verander eerste label
        gebouwVerander.text = "Gebouw: \(automaat.gebouw) , Verdiep:  \(automaat.verdiep)"
        afbeelding.image = automaat.foto
        beschrijving.text = automaat.beschrijving
        
        // aanwezigheidslijst en prijslijst
        getal = automaat.drankjes.count-1
        for i in 0...getal{ // gaat alle drankjes af
            let label = UILabel(frame: CGRect(x: 0, y: (i*20), width: 200, height: 21))
            label.text = automaat.drankjes[i] + ": " + "\(automaat.prijslijst[i])"
            
            stakker.addSubview(label)
        }
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Adjust scrollbare hoeveelheid tot wat net nodig is
        
        //Op de een of andere reden werkt deze code niet als je het gwn in viewdidload zet???
        // HET MOET DUS IN VIEWDIDAPPEAR
        var breedte = scrollview.frame.width
        var frm: CGRect = terugKnop.frame
        getal = automaat.drankjes.count-1
        terugKnop.frame.origin = CGPoint(x: frm.origin.x, y: (CGFloat)(getal*20)+frm.origin.y)
        
        breedte = scrollview.frame.width
        frm = terugKnop.frame
        scrollview.contentSize = CGSize(width: breedte, height: frm.origin.y + 50)
    }

}
