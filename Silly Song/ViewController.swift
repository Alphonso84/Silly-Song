//
//  ViewController.swift
//  Silly Song
//
//  Created by user on 8/16/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    var name = lowercaseName
    
    for character in lowercaseName.characters {
        switch character {
        case "a","e", "i", "o", "u":
            return name
        case "b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z":
            name = name.replacingOccurrences(of: String(character), with: "")
        default:
            break
        }
    }
    
    return name
}

func lyricsForName(fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let fullName = fullName
    
    let song = [
        "\(fullName), \(fullName), Bo B\(shortName)",
        "Banana Fana Fo F\(shortName)",
        "Me My Mo M\(shortName)",
        "\(fullName)"].joined(separator: "\n")
    
    return song
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
       
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            let name = nameField.text
            lyricsView.text = lyricsForName(fullName: name!)
        } else {
            let errorAlert = "Enter your name silly"
            lyricsView.text = errorAlert
        }
    }

}
