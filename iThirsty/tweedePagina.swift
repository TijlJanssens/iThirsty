//
//  tweedePagina.swift
//  iThirsty
//
//  Created by Fien Janssens on 10/07/2019.
//  Copyright © 2019 HoleLottaGangsh*t. All rights reserved.
//

import UIKit
import MapKit

let Bverdiep1 = Automaat(1, "B", ["Ice Tea Green", "Ice Tea", "7-Up", "Coca-Cola","Fanta","Tropico","Minute Maid", "Koffie","Water","RedBull","Nalu", "Tiramisu","Liègoise","Pudding","Rijstpap","Condooms", "Chips", "Kauwgom", "Koekjes", "Chocolade Wafels","snoep","Chocoladerepen","Snacks"],#imageLiteral(resourceName: "IMG_2638"),[1.10, 1.10, 0.90, 1.00, 1.00,1.00, 1.00, 0.80, 1.00, 1.70, 1.70, 1.00, 0.70, 1.00, 1.00, 1.50, 0.80, 1.30, 1.00, 0.80, 0.80, 1.00, 0.90],CLLocationCoordinate2D(latitude: 50.8217931, longitude: 4.3936197)) // snacks erbij gezet voor indentificatie ( een prijs van 0.90 gegeven (gemiddelde)

let Qlinksrechts = Automaat(1,"Q",["Coca-Cola","Fanta", "Nalu"], #imageLiteral(resourceName: "IMG_2649"), [0.70,0.70,0.90],CLLocationCoordinate2D(latitude: 50.821105, longitude: 4.3949484)) // foto te maken, lijst aan te vullen

let Dbuiten = Automaat(1,"D",["Coca-Cola","Coca-Cola Zero", "Ice Tea", "Fanta", "Tropico", "Sprite","Water", "Nalu", "RedBull"],#imageLiteral(resourceName: "IMG_2640"), "hjkdehdkhcjksdhjksdhfkjsdhfkjdshfkjsdhfkjdshfkjdshfkjdshfkjdshfkjsdhfkjdshfkjshjkfhsjkfhsdjkfhsdjkfhdsjhsdjkhfkjsdhfkjsdhfjksdhfjkhsdkjfhsjdkfhsjdkfhsjkhfjksdfhkjsdhfjkshdfkjshjlolziar" ,[1.00,1.00,1.00,1.00,1.00,1.00,1.00,1.00,1.70,1.70],CLLocationCoordinate2D(latitude: 50.8216084, longitude: 4.39453365))

let Dbinnen1 = Automaat(2,"D",["Coca-Cola","Fanta", "Nalu"], #imageLiteral(resourceName: "IMG_2643"), [0.70,0.70,0.90],CLLocationCoordinate2D(latitude: 50.821517, longitude: 4.3942593)) // lijst aan te vullen

let Dbinnen2 = Automaat(3,"D",["Coca-Cola","Fanta", "Nalu"], #imageLiteral(resourceName: "IMG_2645"), [0.70,0.70,0.90],CLLocationCoordinate2D(latitude: 50.82162, longitude: 4.3942611)) // lijst aan te vullen

let tussenFGF = Automaat(4,"F",["Coca-Cola", "Fuze Tea", "Fanta", "Sprite","Water", "Water Fusion", "Nalu","Minute Maid","Chips","Chocolade Reep","kauwgom", "Snacks"],#imageLiteral(resourceName: "IMG_2649") ,[0.70,0.80,0.70, 0.70,0.60,0.70, 1.00, 0.90,1.00,0.80,1.00,0.90],CLLocationCoordinate2D(latitude: 50.8217385, longitude:
    4.3967769))

let tussenFGG = Automaat(4,"G",["Coca-Cola", "Fuze Tea", "Fanta", "Sprite","Water", "Water Fusion", "Nalu","Minute Maid","Chips","Chocolade Reep","kauwgom","Snacks"],#imageLiteral(resourceName: "IMG_2649") ,[0.70,0.80,0.70, 0.70,0.60,0.70, 1.00, 0.90,1.00,0.80,1.00,0.90],CLLocationCoordinate2D(latitude: 50.8217385, longitude: 4.3967769))

let F1 = Automaat(1,"F",["Coca-Cola","Coca-Cola Zero", "Fuze Tea", "Fanta","Fanta Lemon", "Sprite","Water", "Water Fusion", "Nalu","Minute Maid","Aquarius",],#imageLiteral(resourceName: "IMG_2653"),[0.70,0.70,0.70,0.70, 0.70,0.70,0.60,0.70, 1.00, 0.90, 0.90],CLLocationCoordinate2D(latitude:50.8213703, longitude: 4.3955127))

let Lachter = Automaat(0,"L", ["Coca-Cola","Coca-Cola Zero","Fanta","Aquarius","water"],#imageLiteral(resourceName: "IMG_2655"),[0.70,0.70,0.70,0.90,0.70],CLLocationCoordinate2D(latitude:50.824677, longitude: 4.395610))

let automaatLijst = [Bverdiep1,Qlinksrechts,Dbuiten,Dbinnen1,Dbinnen2,tussenFGF,tussenFGG,F1,Lachter]


class tweedePagina: UIViewController {

    @IBOutlet weak var afbeelding: UIImageView!
    @IBOutlet weak var gebouwVerander: UILabel!
    @IBOutlet weak var beschrijving: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var terugKnop: UIButton!
    
    @IBOutlet weak var stakker: UIStackView!
    var getal = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dichtsbijzijndeAutomaat = vindAutomaat()
        
        // Verander eerste label
        gebouwVerander.text = "Gebouw: \(dichtsbijzijndeAutomaat.gebouw) , Verdiep:  \(dichtsbijzijndeAutomaat.verdiep)"
        afbeelding.image = dichtsbijzijndeAutomaat.foto
        beschrijving.text = dichtsbijzijndeAutomaat.beschrijving
        
       // aanwezigheidslijst en prijslijst
        getal = dichtsbijzijndeAutomaat.drankjes.count-1
        for i in 0...getal{ // gaat alle drankjes af
            let label = UILabel(frame: CGRect(x: 0, y: (i*20), width: 200, height: 21))
            label.text = dichtsbijzijndeAutomaat.drankjes[i] + ": " + "\(dichtsbijzijndeAutomaat.prijslijst[i])"
            
            stakker.addSubview(label)
        }
       gekozenGebouw = "p"
       gekozenVerdiep = -1
       gekozenDrankje = ""
    }
  
    func vindAutomaat() -> Automaat{
        /*if gekozenGebouw == "E"{
            return tussenFGF
        }
        else if gekozenGebouw == "T" {
            return tussenFGG
        }
        else if gekozenGebouw == "Z" {
            return Lachter
        }*/
        
        
        
        var lijst = automaatLijst
        for automat in lijst { // alle automaten weg die je drankje niet bevatten
            var volger = 0; //heel lelijk opgelost
            inner: for drank in automat.drankjes {
                if gekozenDrankje == drank {
                    volger += 1
                    break inner // je stapt eruit want het drankje is er toch al in!
                }
            }
            if volger==0 { // betekent dat het drankje er niert in zit
                lijst = lijst.filter { $0 != automat } // yeet automaat uit lijst
            }
        }
        // Nu filteren op gebouw
        if gekozenGebouw == "E" && lijst.contains(tussenFGF){
            return tussenFGF
        }
        else if gekozenGebouw == "T" && lijst.contains(tussenFGG){
            return tussenFGG
        }
        
        else if gekozenGebouw == "Z" && lijst.contains(Lachter){
            return Lachter
        }
        
        
        
        
        let alfabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let getal1 = alfabet.firstIndex(of: gekozenGebouw)!
        var volger2 = 0
        var afstand1 = 100 // de kleinste afstand = afstand 1
        var afstand2 : Int
        var getal2: String.Index
        var besteAutomaat = lijst[0]
        for automat in lijst{ // alle automaten filteren op dichtste gebouw
            getal2 = alfabet.firstIndex(of: automat.gebouw)!
            afstand2 = abs(alfabet.distance(from: getal1, to: getal2)) // de huidige afstand = afstand 2
            if (afstand2<afstand1 && volger2>0){
                afstand1 = afstand2
                for automat2 in lijst{
                    if automat2.gebouw == besteAutomaat.gebouw {
                        lijst = lijst.filter { $0 != automat2 } // de vorige beste moet eruit en alle andere met hetzelfde gebouw
                    }
                
                }
                besteAutomaat = automat
            }
            else if (afstand2==afstand1 && volger2>0){ //niks doen want allebei moeten ze in de lijst blijven
            }
            else if (afstand2<afstand1 && volger2==0){ // dit gebeurt in de eerste stap (niks eruit yeeten dus)
                afstand1 = afstand2
                volger2 += 1
            }
            else{ // dus afstand2>afstand1 -> we moeten de huidige automaat yeeten
                lijst = lijst.filter { $0 != automat }
            }
        }
        
        // Nu filteren op verdiep
        if lijst.count > 1{
            var afstand1 = 100 // de kleinste afstand = afstand 1
            let getal1 = gekozenVerdiep
            var volger3 = 0
            var besteAutomaat=lijst[0]
            for automat in lijst{
                var afstand2 = abs(automat.verdiep - getal1)
                if (afstand2<afstand1 && volger3>0){
                    afstand1 = afstand2
                    lijst = lijst.filter { $0 != besteAutomaat } // de vorige beste moet eruit
                    besteAutomaat = automat
                }
                else if (afstand2<afstand1 && volger3==0){ // dit gebeurt in de eerste stap (niks eruit yeeten dus)
                    afstand1 = afstand2
                    volger3 += 1
                }
                else{ // dus afstand2>afstand1 -> we moeten de huidige yeeten
                    lijst = lijst.filter { $0 != automat }
                }
                
            
            }
        }
        return lijst[0] // geeft de beste automaat weer
        
        
        // er zit daadwerkelijk maar 1 in!!
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Adjust scrollbare hoeveelheid tot wat net nodig is
        
        //Op de een of andere reden werkt deze code niet als je het gwn in viewdidload zet???
        // HET MOET DUS IN VIEWDIDAPPEAR
        var breedte = scrollview.frame.width
        var frm: CGRect = terugKnop.frame
        terugKnop.frame.origin = CGPoint(x: frm.origin.x, y: (CGFloat)(getal*20)+frm.origin.y)
        
        breedte = scrollview.frame.width
        frm = terugKnop.frame
        scrollview.contentSize = CGSize(width: breedte, height: frm.origin.y + 50)
    }
    
    


}
