//
//  CustomNavigationBar.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/15.
//

import UIKit

class CustomNavigationBar: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    func customInit() {
//        if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
//            view.frame = self.bounds
//            addSubview(view)
//        }
    }
    
}
