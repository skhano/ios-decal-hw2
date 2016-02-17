//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var waves_butto: UIButton!
    @IBOutlet var kobe_button: UIButton!
    @IBOutlet var steph_button: UIButton!
    @IBOutlet var ball_button: UIButton!
    @IBOutlet var yeezy_button: UIButton!
    @IBOutlet var drake_button: UIButton!
    @IBOutlet var dj_khaled_button: UIButton!
    @IBOutlet var kimButton: UIButton!
    
    @IBOutlet var space_button: UIButton!
    @IBOutlet var Delete: UIButton!
    @IBOutlet var Return: UIButton!

    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    /*func createFrameForEveryButton() {
        for button in self.view.subviews {
            if button is UIButton {
                (button as! UIButton).backgroundColor = UIColor.blueColor()
                button.layer.cornerRadius = 3
                button.layer.masksToBounds = true
            }
        }
    }*/

    func returnCommand() {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    
    func deleteCommand() {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    func spaceCommand() {
       (textDocumentProxy as UIKeyInput).insertText(" ")
    }
    
    @IBAction func buttonPressed(button: UIButton) {
        var message =  button.titleLabel?.text
        switch message! {
        case "Return":
            returnCommand()
            break
        case "Delete":
            deleteCommand()
            break
        case "Space":
            spaceCommand()
            break
        default:
            (textDocumentProxy as UIKeyInput).insertText("\(message!) ")
            break
        }
    }
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
    }


}
