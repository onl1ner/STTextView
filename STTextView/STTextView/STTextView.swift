//  MIT License
//
//  Copyright (c) 2020 Tamerlan Satualdypov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

@IBDesignable open class STTextView : UITextView, UITextViewDelegate {
    
    /// Placeholder string that will be shown in your TextView.
    @IBInspectable public var placeholder : String = "Enter your placeholder" {
        didSet {
            self.placeholderLabel.text = placeholder
        }
    }
    
    /// Color that would be applied to your placeholder text.
    @IBInspectable public var placeholderColor : UIColor = .gray {
        didSet {
            self.placeholderLabel.textColor = placeholderColor
        }
    }
    
    /// Attributed placeholder to show your attributed string.
    public var attributedPlaceholder : NSAttributedString? {
        didSet {
            self.placeholderLabel.text = nil
            self.placeholderLabel.attributedText = attributedPlaceholder
        }
    }
    
    /// Inset of a content inside your TextView. Do not use UITextView.contentInset property to change the inset.
    public var textInset : UIEdgeInsets {
        get { return self.textContainerInset }
        set {
            self.textContainerInset = newValue
            self.updateLayout()
        }
    }
    
    /// If true placeholder text will hide when user starts editing.
    public var shouldHidePlaceholderOnEditing : Bool = false
    
    lazy private var placeholderLabel : UILabel = {
        let label = UILabel()
        
        label.text = self.placeholder
        label.textColor = self.placeholderColor
        
        label.font = self.font
        label.textAlignment = self.textAlignment
        
        label.numberOfLines = 0
        label.backgroundColor = .clear
        
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text.isEmpty {
            if shouldHidePlaceholderOnEditing {
                placeholderLabel.isHidden = true
            }
        }
        return true
    }
    
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        placeholderLabel.isHidden = !textView.text.isEmpty
        return true
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentContent : NSString = NSString(string: textView.text)
        let newContent = currentContent.replacingCharacters(in: range, with: text)
        
        self.placeholderLabel.isHidden = !newContent.isEmpty
        
        return true
    }
    
    private func updateLayout() -> () {
        self.constraints.forEach { (constraint) in
            if let firstItem = constraint.firstItem as? UILabel {
                if firstItem == placeholderLabel { self.removeConstraint(constraint) }
            }
        }
        
        NSLayoutConstraint.activate(
            [placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                                   constant: self.textContainerInset.top),
             placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: self.textContainerInset.left + self.textContainer.lineFragmentPadding),
             placeholderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: -self.textContainerInset.right),
             placeholderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                      constant: -self.textContainerInset.bottom)])
    }
    
    private func addPlaceholder() -> () {
        self.insertSubview(placeholderLabel, at: 0)
        
        updateLayout()
    }
    
    private func initialConfiguration() -> () {
        self.delegate = self
        
        addPlaceholder()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialConfiguration()
    }
}
