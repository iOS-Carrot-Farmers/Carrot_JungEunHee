//
//  HomeVC.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/07.
//

import UIKit

import JJFloatingActionButton

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
        
        setFloatingBtn()
    }
    
    // MARK: - Custom Method Part
    func setTableView() {
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    
    private func setFloatingBtn() {
        let actionButton = JJFloatingActionButton()
        actionButton.buttonColor = UIColor(red: 238/255, green: 133/255, blue: 72/255, alpha: 1)
        
        postTableView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
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
        
        return UIScreen.main.bounds.width * (145/375)   // 화면 비율 고려
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)    // 셀 터치 시 회색표시 안 뜨게 해줌
        
        guard let detailVC = UIStoryboard(name: "DetailSB", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.modalTransitionStyle = .crossDissolve

        self.present(detailVC, animated: true, completion: nil)
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
