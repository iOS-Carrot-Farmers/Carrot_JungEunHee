//
//  HomeVC.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/07.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - UI Component Part
    @IBOutlet weak var postTableView: UITableView!
    
    // MARK: - Vars & Lets Part
    var appContentList: [AppContentData] = []
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAppContentList()
        setTableView()
        registerXib()
    }
    
    // MARK: - Custom Method Part
    func setTableView() {
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    
    func registerXib() {
        // xib 등록
        postTableView.register(UINib(nibName: PostTVC.identifier, bundle: nil), forCellReuseIdentifier: PostTVC.identifier)
    }
    
    func initAppContentList() {
        // 구조체에 데이터를 넣는 함수
        
        appContentList.append(contentsOf: [
            AppContentData(productImage: "당근프리뷰", name: "킹받이세요?", dong: "공릉동", update: "0", price: "1,107원", heart: "5"),
            AppContentData(productImage: "킹받아요", name: "킹받아요 사진", dong: "성수동", update: "1", price: "211,014원", heart: "4"),
            AppContentData(productImage: "포켓몬폰케", name: "포켓몬스터 친구들 슬림케이스", dong: "하계동", update: "2", price: "13,900원", heart: "3"),
            AppContentData(productImage: "투썸케이크", name: "스트로베리 초콜릿 생크림", dong: "중계동", update: "3", price: "35,000원", heart: "2"),
            AppContentData(productImage: "푸딩", name: "UMU 커스터드 푸딩", dong: "애월읍", update: "4", price: "6,000원", heart: "1"),
            AppContentData(productImage: "춘식이", name: "춘식이 인형", dong: "묵동", update: "5", price: "20,000원", heart: "0")
        ])
    }
    
}


// MARK: - Extension Part
extension HomeVC: UITableViewDelegate {
    // - 테이블 뷰의 동작과 모양 관리
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let postVC = self.storyboard?.instantiateViewController(withIdentifier: "PostVC") else {return}
        
        self.navigationController?.pushViewController(postVC, animated: true)
        

//        let object = self.appContentList[indexPath] // appContentList에 접근해 indexPath로 객체 만듦
//        let postVC = PostVC.init(coder: object)
        //        self.navigationController?.pushViewController(postVC, animated: true)

    }
}

extension HomeVC: UITableViewDataSource {
    // - 테이블을 만들 때 필요한 정보 제공
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath -> TVC 별로 데이터를 다르게 지정
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVC.identifier) as? PostTVC else {return UITableViewCell()}
        
        cell.setData(productData: appContentList[indexPath.row])
        return cell
    }
    
    
}
