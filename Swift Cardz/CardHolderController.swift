//
//  ViewController.swift
//  Swift Cardz
//
//  Created by Rodolfo Castillo on 21/11/15.
//  Copyright © 2015 Rodolfo Castillo. All rights reserved.
//

//Class: Esta clase controla la vista donde se ve la tarjeta

import UIKit

class CardHolderController: UIViewController {

    let card = UICard()
    
    
    //Este Metodo realiza acciones cuando la vista se confirma de que cargo correctamente
    override func viewDidLoad() {
        super.viewDidLoad()
        card.backgroundColor = UIColor.grayColor()
        card.UICardShows(20, xOrigin: 15, yOrigin: (view.bounds.height / 2) - (((view.bounds.width + 30) / 2) / 2), widthOfCard: (view.bounds.width - 30), heightOfCard: ((view.bounds.width - 30) / 1.3))
        view.addSubview(card)
        print("The Card Holder View Controller has Started")
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Manejo de memoria y alertas
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

