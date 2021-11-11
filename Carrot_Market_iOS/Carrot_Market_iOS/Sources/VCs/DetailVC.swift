//
//  DetailVC.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/11.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    var homeContentList: HomeContentData?
    
    // MARK: - UI Component Part
    
    // 1. 상품 사진
    @IBOutlet weak var productScrollView: UIScrollView!
    
    // 2. 사용자 정보
    @IBOutlet weak var productImage: UIScrollView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLacation: UILabel!
    
    // 3. 상세 설명
    @IBOutlet weak var productName: UILabel!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Method Part

}
