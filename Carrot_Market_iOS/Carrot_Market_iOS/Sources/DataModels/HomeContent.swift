//
//  HomeContent.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/11.
//

import UIKit

// 데이터 모델 구조체
struct HomeContentData {
    
    // 1. HomeVC
    let productImage: String
    let name: String
    let dong: String
    let update: String
    let price: String
    let heart: String
    
    // 2. DetailVC
    let content: String
    let views: Int
    let category: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: productImage)
    }
    
}
