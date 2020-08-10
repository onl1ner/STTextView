//
//  TableViewController.swift
//  STTextViewExample
//
//  Created by onl1ner onl1ner on 07/08/2020.
//  Copyright © 2020 onl1ner onl1ner. All rights reserved.
//

import UIKit
import STTextView

class TableViewController: UITableViewController {
    @IBOutlet var placeholderTextView: STTextView!
    @IBOutlet var attributedPlaceholderTextView: STTextView!
    
    @IBOutlet var hidePlaceholderSwitch: UISwitch!
    
    @objc private func switchValueChanged(_ sender : UISwitch) {
        placeholderTextView.shouldHidePlaceholderOnEditing = sender.isOn
    }
    
    @objc private func shouldEndEditing(_ sender : UITapGestureRecognizer) -> () {
        view.endEditing(true)
    }
    
    private func attributedTextExample() -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle : NSUnderlineStyle.single.rawValue,
            .font : UIFont.systemFont(ofSize: 15)
        ]
        
        return NSAttributedString(string: "Beautiful attributed placeholder text", attributes: attributes)
    }
    
    private func addTapGesture() -> () {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(shouldEndEditing(_:)))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Note: You could also change the placeholder by using Interface Builder.
        placeholderTextView.placeholder = "Beautiful placeholder text!"
        placeholderTextView.shouldHidePlaceholderOnEditing = hidePlaceholderSwitch.isOn
        
        attributedPlaceholderTextView.attributedPlaceholder = attributedTextExample()
        attributedPlaceholderTextView.placeholderColor = .secondaryLabel
        
        hidePlaceholderSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        addTapGesture()
    }
}

