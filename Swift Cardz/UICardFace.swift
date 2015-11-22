//
//  UICardFace.swift
//  Swift Cardz
//
//  Created by Rodolfo Castillo on 21/11/15.
//  Copyright © 2015 Rodolfo Castillo. All rights reserved.
//

import UIKit

class UICardFace: UIView {
    
    var holderLabel: UILabel!
    
    func startUICardFace(labeltext: String, cornerRadiuz: CGFloat, boundz: CGRect, cardFront: Bool, cardBorder: CGFloat?, cardBorderColor: UIColor?, cardBackGroundColor: UIColor, font: UIFont){
        self.layer.cornerRadius = cornerRadiuz
        self.frame = boundz
        self.backgroundColor = cardBackGroundColor
        if cardFront == true {
        self.layer.borderWidth = cardBorder!
        self.layer.borderColor = cardBorderColor!.CGColor
        }
        self.frame.origin = CGPointMake(0, 0)
        self.clipsToBounds = true
        self.holderLabel = UILabel()
        self.holderLabel.font = font
        self.holderLabel.frame = CGRect(x: 20, y: 15, width: self.bounds.width - 40, height: self.bounds.height - 30)
        self.holderLabel.textAlignment = NSTextAlignment.Center
        self.holderLabel.numberOfLines = 10
        self.holderLabel.text = labeltext
        self.addSubview(holderLabel)
    }
    
    func setHolderText(theText: String){
        self.holderLabel.text = theText
        if self.holderLabel.textAlignment != NSTextAlignment.Center{
            self.holderLabel.textAlignment = NSTextAlignment.Center
        }
    }
    
}
