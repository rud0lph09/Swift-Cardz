//
//  UICard.swift
//  Swift Cardz
//
//  Created by Rodolfo Castillo on 21/11/15.
//  Copyright © 2015 Rodolfo Castillo. All rights reserved.
//

import UIKit

class UICard: UIView, UITextViewDelegate {
    
    //Mark: Constants and Variables --
    
    let frontView = UICardFace()
    let backView = UICardFace()
    var frontIsShowing: Bool!
    let textEditingField = UITextView()
    let borderForCard: CGFloat = 10
    
    //-- END of mark
    
    //Mark: SetUp of the View --
    
    func UICardShows(cornerRadiuz: CGFloat, xOrigin: CGFloat, yOrigin: CGFloat, widthOfCard: CGFloat, heightOfCard: CGFloat){ //Put anything here that you want to load at the start of the CardView
        self.frame = CGRect(x: xOrigin, y: yOrigin, width: widthOfCard, height: heightOfCard)

        let doubleTap = UITapGestureRecognizer(target: self, action: "switchFaces")
        doubleTap.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTap)
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPress")
        self.addGestureRecognizer(longPress)
        self.layer.cornerRadius = cornerRadiuz
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.5;
        self.layer.masksToBounds = false;
        frontIsShowing = true
        frontView.startUICardFace("Concept", cornerRadiuz: cornerRadiuz, boundz: self.frame, cardFront: true, cardBorder: 10, cardBorderColor: UIColor.whiteColor(), cardBackGroundColor: UIColor.redColor(), font: UIFont(name:"HelveticaNeue-Bold", size: 20.0)!)
        frontView.holderLabel.textColor = UIColor.whiteColor()
        frontView.holderLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        backView.startUICardFace("Description", cornerRadiuz: cornerRadiuz, boundz: self.frame, cardFront: false, cardBorder: nil, cardBorderColor: nil, cardBackGroundColor: UIColor.whiteColor(), font: UIFont(name:"HelveticaNeue-Light", size: 20.0)!)
        textEditingField.alpha = 0.5
        textEditingField.font = UIFont(name:"HelveticaNeue-Light", size: 20.0)
        self.addSubview(textEditingField)
        self.addSubview(backView)
        self.addSubview(frontView)
        
    }
    
    // -- END of Mark
    
    //Mark: Selectors --
    
    func longPress(){
        print("Action Detected: User is Long Pressing the card")
        beginEdditingText()
    }
    
    func switchFaces(){
        print("ActionDetected: Switching Face of Card")
        switch frontIsShowing {
        case true:
            UIView.transitionFromView(frontView, toView: backView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            self.frontIsShowing = false
        case false:
            UIView.transitionFromView(backView, toView: frontView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            self.frontIsShowing = true
        default:
            print("ERROR, no card detected")
        }
    }
    
    // -- END of Mark
    
    //Mark: Methods for textField --
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            stopEdittingText(textView)
        }
        return true
    }
    
    func beginEdditingText(){
        switch frontIsShowing {
        case true:
            textEditingField.text = frontView.holderLabel.text
        case false:
            textEditingField.text = backView.holderLabel.text
        default:
            print("ERROR, no card detected")
        }
        self.bringSubviewToFront(textEditingField)
        frontView.holderLabel.hidden = true
        backView.holderLabel.hidden = true
        textEditingField.editable = true
        textEditingField.layer.cornerRadius = self.layer.cornerRadius - 10
        textEditingField.frame = CGRect(x: 15, y: 15, width: self.bounds.width - 30, height: self.bounds.height - 30)
        textEditingField.delegate = self
        textEditingField.textAlignment = NSTextAlignment.Center
        textEditingField.returnKeyType = .Done
        textEditingField.becomeFirstResponder()
        
    }
    
    func stopEdittingText(textView: UITextView){
        switch frontIsShowing {
        case true:
            frontView.holderLabel.text = textView.text
            textView.resignFirstResponder()
            textView.editable = false
            self.sendSubviewToBack(textView)
        case false:
            backView.holderLabel.text = textView.text
            textView.resignFirstResponder()
            textView.editable = false
            self.sendSubviewToBack(textView)
        default:
            print("ERROR, no card detected")
        }
        frontView.holderLabel.hidden = false
        backView.holderLabel.hidden = false
    }
    
    //-- END of Mark

    
}
