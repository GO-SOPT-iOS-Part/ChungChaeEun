//
//  ProfileViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: BaseViewController {
    
    private let headerView = ProfileHeaderView()
    
    private lazy var tableView = UITableView().then {
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
        $0.rowHeight = 54
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let dummy1 = MyPage.dummy1()
    private let dummy2 = MyPage.dummy2()
    
    override func attribute() {
        headerView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        //        tableView.tableHeaderView = headerView
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        
        view.addSubview(
            tableView)
        
        //        tableView.addSubviews(headerView)
        
        //        scrollView.addSubview(contentsView)
        
        tableView.snp.makeConstraints{
            //            $0.top.equalTo(headerView.snp.bottom).offset(24)
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        //        headerView.snp.makeConstraints {
        //            $0.top.leading.trailing.equalToSuperview()
        //            $0.width.equalToSuperview()
        //        }
    }
}

extension ProfileViewController {
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate {}
extension ProfileViewController: UITableViewDataSource {
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 317
    //    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return dummy1.count
        case 1:
            return dummy2.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
                    cell.configureCell(dummy1[indexPath.row])
                } else if indexPath.section == 1 {
                    cell.configureCell(dummy2[indexPath.row])
                } else {
                    return UITableViewCell()
                }
        return cell
    }
}
