//
//  Extension.swift
//  NestedTableview
//
//  Created by Kishan Barmawala on 02/08/23.
//

import UIKit

extension UITableView {
    
    public override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
    }
    
    public override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
}
