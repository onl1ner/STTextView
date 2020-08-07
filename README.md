<img align="right" src="https://github.com/onl1ner/onl1ner/blob/master/Resources/STTextView/logo.gif?raw=true" width="225"/>

<p><h1 align="left">STTextView</h1></p>

![](https://cocoapod-badges.herokuapp.com/p/STTextView/badge.png)
![](https://img.shields.io/badge/iOS-10.0%2B-blue)
![](https://cocoapod-badges.herokuapp.com/v/STTextView/badge.png)
![](https://cocoapod-badges.herokuapp.com/l/STTextView/badge.(png|svg))
![](https://img.shields.io/badge/Swift-5-orange?logo=Swift&logoColor=white)
![](https://img.shields.io/github/last-commit/onl1ner/STTextView)

**STTextView** – easy and clean framework written in Swift. The framework adds a custom UITextView subclass with a needed ``placeholder`` property.


## Requirements
- iOS 10.0 or above.

Framework is compatible with Swift 5.

## Installation
``STTextView`` is available through [CocoaPods](https://cocoapods.org).

- Add the following line into your Podfile:

	```ruby
  pod 'STTextView'
  ```

- Then run this command in your terminal:

	```bash
  $ pod install
  ```

- Now you have a UITextView with a placeholder!

## Usage

### Interface Builder

Simply attach ``STTextView`` class to your UITextView object and you will be able to change the values through the Interface Builder.

### Swift

```swift
import STTextView

let textView = STTextView()
textView.placeholder = "Some placeholder text"
textView.placeholderColor = .secondaryLabel
```

You can also have an attributed placeholder. Use ``attributedPlaceholder`` property.

### Example
Open example project ``STTextViewExample/STTextViewExample.xcworkspace`` to see a simple demonstrations of framework usage.

## Contributing
Have some troubles? Feel free to open an issue.

## License
**STTextView** is under the terms and conditions of the MIT license.

```
MIT License

Copyright (c) 2020 Tamerlan Satualdypov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
