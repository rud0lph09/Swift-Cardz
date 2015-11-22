//
//  BlueCircleButton.swift
//  Swift Cardz
//
//  Created by Rodolfo Castillo on 21/11/15.
//  Copyright © 2015 Rodolfo Castillo. All rights reserved.
//

/*
override func viewDidLoad() {
super.viewDidLoad()

var button = UIButton.buttonWithType(.Custom) as UIButton
button.frame = CGRectMake(160, 100, 50, 50)
button.layer.cornerRadius = 0.5 * button.bounds.size.width
button.setImage(UIImage(named:"thumbsUp.png"), forState: .Normal)
button.addTarget(self, action: "thumbsUpButtonPressed", forControlEvents: .TouchUpInside)
view.addSubview(button)
}

func thumbsUpButtonPressed() {
println("thumbs up button pressed")
}
*/

import UIKit

class BlueCircleButton: UIButton {
    func startBlueCircleButton(textLabel: String){
        self.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size
        .width
        self.titleLabel?.text = textLabel
    }
}