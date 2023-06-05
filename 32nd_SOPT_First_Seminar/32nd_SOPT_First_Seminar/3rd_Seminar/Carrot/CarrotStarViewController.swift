//
//  CarrotStarViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/27.
//

import UIKit

import SnapKit
import Then
import RealmSwift

final class CarrotStarViewController: UIViewController {
    
    let localRealm = try! Realm()
    
    private lazy var tableView = UITableView().then {
        $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
        $0.rowHeight = 120
        $0.delegate = self
        $0.dataSource = self
    }
    
    public var filterDummy : [Carrot] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.filterDummy = realmDummy()
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension CarrotStarViewController {
    
    func realmDummy() -> [Carrot] {
        let starred = localRealm.objects(Carrot.self).filter("star = %@", true)
        var array : [Carrot] = []
        starred.forEach{
            array.append($0)
        }
        return array
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension CarrotStarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier, for: indexPath) as? CarrotTableViewCell else {
            return UITableViewCell()
        }

        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)

        let item = filterDummy[indexPath.row]
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
        let item = filterDummy[indexPath.row]

        item.star.toggle()
        let starImageName = item.star ? "star.fill" : "star"
        cell.starButton.setImage(UIImage(systemName: starImageName), for: .normal)
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(item, update: .modified)
            }
        } catch {
            print("Realm 업데이트 오류: \(error)")
        }
    }
}
