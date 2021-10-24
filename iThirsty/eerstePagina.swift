//
//  eerstePagina.swift
//  iThirsty
//
//  Created by Tijl Janssens on 09/07/2019.
//  Copyright © Tijl Janssens. All rights reserved.
//
// Gebruik dit in de appdescription als logo! <a href="https://nl.freepik.com/vrije-foto-vectoren/achtergrond">Achtergrond vector gemaakt door macrovector - nl.freepik.com</a>
import UIKit

var gekozenGebouw: Character = "p"
var gekozenVerdiep = -1
var gekozenDrankje = ""





class eerstePagina: UIViewController {

    
    @IBOutlet weak var kiesdrankje: UIButton!
    @IBOutlet var Drankjes: [UIButton]!
    
    
    @IBOutlet weak var kiesverdiep: UIButton!
    @IBOutlet var Verdiepen: [UIButton]!
    
    @IBOutlet weak var kiesgebouw: UIButton!
    @IBOutlet var Gebouwen: [UIButton]!
    
    @IBOutlet weak var zoekknop: UIButton!
    @IBOutlet weak var Scrolkijk: UIScrollView!
    
    @IBOutlet weak var terugKnop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*Verdiepen.forEach{(button1) in
         self.Scrolkijk.addSubview(button1)}
         
         Gebouwen.forEach{(button2) in
         self.Scrolkijk.addSubview(button2)}
         
         Drankjes.forEach{(button3) in
         self.Scrolkijk.addSubview(button3)}*/
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let breedte = Scrolkijk.frame.width
        let frm: CGRect = terugKnop.frame
        
        Scrolkijk.contentSize = CGSize(width: breedte, height: frm.origin.y + 50)
        
    }
    
    
    @IBAction func kiesGebouw(_ sender: UIButton) {
        dichtopengebouw()
        
    }
    
    @IBAction func kiesVerdiep(_ sender: Any) {
        dichtopenverdiep()
    }
    
    @IBAction func kiesDrankje(_ sender: Any) {
        dichtopendrankje()    }
    
    func verandertitel(_ knop: UIButton,_ woord: String){
        knop.setTitle(woord, for: .normal)
    }
    
    enum Gebouwenenum: String {
        case gebouwb = "B"
        case gebouwd = "D"
        case gebouwe = "E"
        case gebouwf = "F"
        case gebouwg = "G"
        case gebouwt = "T"
        case gebouwk = "K"
        case gebouwl = "L"
        case gebouwq = "Q"
        case gebouwz = "Z"
    }
    
    enum Verdiepenenum: String {
        case verdiep0 = "0"
        case verdiep1 = "1"
        case verdiep2 = "2"
        case verdiep3 = "3"
        case verdiep4 = "4"
        case verdiep5 = "5"
        case verdiep6 = "6"
        case verdiep7 = "7"
        case verdiep8 = "8"
        case verdiep9 = "9"
    }
    
    enum Drankjesenum: String {
        case cola = "Coca-Cola"
        case icetea = "Ice Tea"
        case fanta = "Fanta"
        case sprite = "Sprite"
        case tropico = "Tropico"
        case fuzetea = "Fuze Tea"
        case minmaid = "Minute Maid"
        case redbull = "RedBull"
        case nalu = "Nalu"
        case aquarius = "Aquarius"
        case koffie = "Koffie"
        case water = "Water"
        case snacks = "Snacks"
    }
    
    func dichtopengebouw(){
        Gebouwen.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })}
        
        var breedte = Scrolkijk.frame.width
        var frm: CGRect = terugKnop.frame
        
        Scrolkijk.contentSize = CGSize(width: breedte, height: frm.origin.y + 50)
    }
    
    
    
    @IBAction func gebouwTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let gebouw = Gebouwenenum(rawValue: title)
            
            else{
            return
            
        }
        
        switch gebouw {
        case .gebouwb:
            verandertitel(kiesgebouw, "B")
            dichtopengebouw()
            gekozenGebouw = "B"
            
        case .gebouwd:
            verandertitel(kiesgebouw, "D")
            dichtopengebouw()
            gekozenGebouw = "D"
            
        case .gebouwe:
            verandertitel(kiesgebouw, "E")
            dichtopengebouw()
            gekozenGebouw = "E"
            
        case .gebouwf:
            verandertitel(kiesgebouw, "F")
            dichtopengebouw()
            gekozenGebouw = "F"
            
        case .gebouwg:
            verandertitel(kiesgebouw, "G")
            dichtopengebouw()
            gekozenGebouw = "G"
            
        case .gebouwt:
            verandertitel(kiesgebouw, "T")
            dichtopengebouw()
            gekozenGebouw = "T"
            
        case .gebouwk:
            verandertitel(kiesgebouw, "K")
            dichtopengebouw()
            gekozenGebouw = "K"
            
        case .gebouwl:
            verandertitel(kiesgebouw, "L")
            dichtopengebouw()
            gekozenGebouw = "L"
            
        case.gebouwq:
            verandertitel(kiesgebouw, "Q")
            dichtopengebouw()
            gekozenGebouw = "Q"
            
        case .gebouwz:
            verandertitel(kiesgebouw, "Z")
            dichtopengebouw()
            gekozenGebouw = "Z"
            
        }
        
    }
    
    func dichtopenverdiep(){
        Verdiepen.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })}
        
        var breedte = Scrolkijk.frame.width
        var frm: CGRect = terugKnop.frame
        
        
        Scrolkijk.contentSize = CGSize(width: breedte, height: frm.origin.y + 50)
    }
    
    @IBAction func verdiepTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let verdiep = Verdiepenenum(rawValue: title) else{
            return
            
        }
        switch verdiep {
        case .verdiep0:
            verandertitel(kiesverdiep, "0")
            dichtopenverdiep()
            gekozenVerdiep = 0
            
        case .verdiep1:
            verandertitel(kiesverdiep, "1")
            dichtopenverdiep()
            gekozenVerdiep = 1
            
        case .verdiep2:
            verandertitel(kiesverdiep, "2")
            dichtopenverdiep()
            gekozenVerdiep = 2
            
        case .verdiep3:
            verandertitel(kiesverdiep, "3")
            dichtopenverdiep()
            gekozenVerdiep = 3
            
        case .verdiep4:
            verandertitel(kiesverdiep, "4")
            dichtopenverdiep()
            gekozenVerdiep = 4
            
        case .verdiep5:
            verandertitel(kiesverdiep, "5")
            dichtopenverdiep()
            gekozenVerdiep = 5
            
        case .verdiep6:
            verandertitel(kiesverdiep, "6")
            dichtopenverdiep()
            gekozenVerdiep = 6
            
        case .verdiep7:
            verandertitel(kiesverdiep, "7")
            dichtopenverdiep()
            gekozenVerdiep = 7
            
        case .verdiep8:
            verandertitel(kiesverdiep, "8")
            dichtopenverdiep()
            gekozenVerdiep = 8
            
        case .verdiep9:
            verandertitel(kiesverdiep, "9")
            dichtopenverdiep()
            gekozenVerdiep = 9
            
            
        }
        
    }
    func dichtopendrankje(){
        Drankjes.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })}
        
        var breedte = Scrolkijk.frame.width
        var frm: CGRect = terugKnop.frame
        
        
        
        Scrolkijk.contentSize = CGSize(width: breedte, height: frm.origin.y + 50)
    }
    
    
    @IBAction func drankjeTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let drankje = Drankjesenum(rawValue: title) else{
            return
            
        }
        switch drankje {
        case .cola:
            verandertitel(kiesdrankje, "Coca-Cola")
            dichtopendrankje()
            gekozenDrankje = "Coca-Cola"
            
        case .icetea:
            verandertitel(kiesdrankje, "Ice Tea")
            dichtopendrankje()
            gekozenDrankje = "Ice Tea"
            
        case .fanta:
            verandertitel(kiesdrankje, "Fanta")
            dichtopendrankje()
            gekozenDrankje = "Fanta"
            
        case .sprite:
            verandertitel(kiesdrankje, "Sprite")
            dichtopendrankje()
            gekozenDrankje = "Sprite"
            
        case .tropico:
            verandertitel(kiesdrankje, "Tropico")
            dichtopendrankje()
            gekozenDrankje = "Tropico"
            
        case .fuzetea:
            verandertitel(kiesdrankje, "Fuze Tea")
            dichtopendrankje()
            gekozenDrankje = "Fuze Tea"
            
        case .minmaid:
            verandertitel(kiesdrankje, "Minute Maid")
            dichtopendrankje()
            gekozenDrankje = "Minute Maid"
            
        case .redbull:
            verandertitel(kiesdrankje, "RedBull")
            dichtopendrankje()
            gekozenDrankje = "RedBull"
            
        case .nalu:
            verandertitel(kiesdrankje, "Nalu")
            dichtopendrankje()
            gekozenDrankje = "Nalu"
            
        case .aquarius:
            verandertitel(kiesdrankje, "Aquarius")
            dichtopendrankje()
            gekozenDrankje = "Aquarius"
            
        case .koffie:
            verandertitel(kiesdrankje, "Koffie")
            dichtopendrankje()
            gekozenDrankje = "Koffie"
            
        case .water:
            verandertitel(kiesdrankje, "Water")
            dichtopendrankje()
            gekozenDrankje = "Water"
            
        case .snacks:
            verandertitel(kiesdrankje, "Snacks")
            dichtopendrankje()
            gekozenDrankje = "Snacks"
            
        }
        
    }
    
    @IBAction func zoekertje(_ sender: Any) {
        if kiesdrankje.titleLabel!.text! == "Kies Drankje" || kiesgebouw.titleLabel!.text! == "Kies Gebouw" || kiesverdiep.titleLabel!.text! == "Kies Verdiep"{
            let alert = UIAlertController(title: "Vul alles in", message: "Je bent iets vergeten aan te duiden", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style:UIAlertAction.Style.default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "tweedePagina") as! tweedePagina
            present(homeView, animated: true, completion: nil)
        }
    }
    

}
