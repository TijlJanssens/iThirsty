//
//  Automaat.swift
//  iThirsty
//
//  Created by Fien Janssens on 09/07/2019.
//  Copyright © 2019 HoleLottaGangsh*t. All rights reserved.
//

import UIKit
import MapKit

class Automaat: NSObject {
    var verdiep: Int
    var gebouw: Character
    var drankjes: Array<String>
    var foto: UIImage
    var beschrijving: String
    var prijslijst: Array<Double> // Deze prijslijst MOET geordend zijn volgens de bijhorende drankjes!!
    var coord: CLLocationCoordinate2D
    
    // Voor app ontwikkelen zonder beschrijving (is korter
    init(_ verdiep: Int, _ gebouw: Character, _ drankjes: Array<String>, _ foto: UIImage, _ prijslijst: Array<Double>, _ coord: CLLocationCoordinate2D){
        self.verdiep = verdiep
        self.drankjes = drankjes
        self.gebouw = gebouw
        self.foto = foto
        self.beschrijving = "BeschrijvingHier"
        self.prijslijst = prijslijst
        self.coord = coord
    }
    
    // Voor de daadwerkelijke app is de beschrijving nodig
    init(_ verdiep: Int, _ gebouw: Character, _ drankjes: Array<String>, _ foto: UIImage, _ beschrijving: String, _ prijslijst: Array<Double>, _ coord: CLLocationCoordinate2D){
        self.verdiep = verdiep
        self.drankjes = drankjes
        self.gebouw = gebouw
        self.foto = foto
        self.beschrijving = beschrijving
        self.prijslijst = prijslijst
        self.coord = coord
    }
    
}
