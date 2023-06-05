//
//  CarrotViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/22.
//

import UIKit

import Then
import SnapKit
import RealmSwift

final class CarrotViewController: BaseViewController {
    
    let localRealm = try! Realm()
    
    private let tableView = UITableView()
    
    public let dummy = Carrot.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        
        view.backgroundColor = .white
        
        tableView.do {
            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
//        try! localRealm.write {
//            localRealm.add(dummy)
//        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension CarrotViewController: UITableViewDelegate {}
extension CarrotViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier, for: indexPath) as? CarrotTableViewCell else {
            return UITableViewCell()
        }
        
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)
        
        let item = dummy[indexPath.row]
        cell.configureCell(item)
        
        let starImageName = item.star ? "star.fill" : "star"
        cell.starButton.setImage(UIImage(systemName: starImageName), for: .normal)
        
        return cell
    }
    
    @objc @IBAction func starButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? CarrotTableViewCell else {
            return
        }
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let item = dummy[indexPath.row]
        
        do {
            let realm = try Realm()
            try realm.write {
                item.star.toggle()
                let starImageName = item.star ? "star.fill" : "star"
                cell.starButton.setImage(UIImage(systemName: starImageName), for: .normal)
                
                realm.add(item, update: .modified)
            }
        } catch {
            print("Realm 업데이트 오류: \(error)")
        }
    }
}
