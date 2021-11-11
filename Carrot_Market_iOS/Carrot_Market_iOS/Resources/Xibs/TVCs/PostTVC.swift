//
//  PostTVC.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/11.
//

import UIKit

class PostTVC: UITableViewCell {
    
    static let identifier = "PostTVC"
    
    // MARK: - UI Component Part
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var heartLabel: UILabel!
    
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    // MARK: - Custom Method Part
    func setData(productData: HomeContentData) {
        // IBOutlets으로 선언했던 변수들에 데이터를 넣어주는 부분
        
        productImageView.image = productData.makeImage()
        
        nameLabel.text = productData.name
        priceLabel.text = productData.price
        heartLabel.text = productData.heart
        
        updateLabel.text = "\(productData.dong) · 끌올 \(productData.update)초 전"
        
    }
    
}

// MARK: - Extension Part
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        // @IBInspectable -> Inspector에서 해당 인터페이스 요소의 속성을 변경할 수 있게 함
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
