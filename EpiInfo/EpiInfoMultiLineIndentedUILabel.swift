//
//  EpiInfoMultiLineIndentedUILabel.swift
//  EpiInfo
//
//  Created by John Copeland on 3/11/15.
//

import UIKit

class EpiInfoMultiLineIndentedUILabel: UILabel {
  
  var numLines = 1.0
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func drawTextInRect(rect: CGRect) {
    var insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
    super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
