// The MIT License (MIT)
// Copyright © 2021 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if canImport(UIKit) && (os(iOS))
import UIKit
import SparrowKit

open class NativeSkipableLargeActionToolBarView: NativeMimicrateToolBarView {
    
    // MARK: - Views
    
    public let actionButton = NativeLargeActionButton().do {
        $0.applyDefaultAppearance(with: .init(content: .white, background: .tint))
    }
    
    public let skipButton = SPDimmedButton().do {
        if #available(iOS 13.0, *) {
            $0.applyDefaultAppearance(with: .init(content: .tertiaryLabel, background: .clear))
        }
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold)
    }
    
    // MARK: - Init
    
    open override func commonInit() {
        super.commonInit()
        addSubview(actionButton)
        addSubview(skipButton)
    }
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        actionButton.layout(y: layoutMargins.top)
        
        skipButton.setWidthAndFit(width: layoutWidth)
        skipButton.frame.origin.y = actionButton.frame.maxY + 12
        skipButton.setXCenter()
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        layoutSubviews()
        return .init(width: size.width, height: skipButton.frame.maxY + layoutMargins.bottom)
    }
}
#endif