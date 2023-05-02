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
    
//    private lazy var scrollView = UIScrollView().then {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.isScrollEnabled = true
//    }
    
//    private let contentsView = UIView()
    
    private let headerView = ProfileHeaderView()
    
    private lazy var tableView = UITableView().then {
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
        $0.rowHeight = 54
        $0.delegate = self
        $0.dataSource = self
        $0.isScrollEnabled = false
    }
    
    private let dummy = MyPage.dummy()
    
    override func setAddTarget() {
        headerView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        view.addSubviews(
            tableView,
            headerView)
        
//        scrollView.addSubview(contentsView)

        headerView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
//
//        contentsView.snp.makeConstraints{
//            $0.top.equalToSuperview()
//            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            $0.width.equalToSuperview()
//        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ProfileViewController {
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}


extension ProfileViewController: UITableViewDelegate {}
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
}
