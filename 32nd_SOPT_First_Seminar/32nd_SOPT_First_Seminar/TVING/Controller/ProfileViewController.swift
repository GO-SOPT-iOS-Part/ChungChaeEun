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
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
        $0.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        $0.register(SettingFooterView.self, forHeaderFooterViewReuseIdentifier: "SettingFooterView")
        $0.register(LogoutFooterView.self, forHeaderFooterViewReuseIdentifier: "LogoutFooterView")
        $0.rowHeight = 54
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .black
    }
    
    private let dummy1 = MyPage.dummy1()
    private let dummy2 = MyPage.dummy2()
    
    override func attribute() {
//        let logoutFooterView = LogoutFooterView()
//        logoutFooterView.logoutButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        tableView.register(ProfileHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: ProfileHeaderView.cellIdentifier)
        tableView.register(SettingFooterView.self,
                           forHeaderFooterViewReuseIdentifier: SettingFooterView.cellIdentifier)
        tableView.register(LogoutFooterView.self,
                           forHeaderFooterViewReuseIdentifier: LogoutFooterView.cellIdentifier)
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension ProfileViewController: beforeButtonDelegate {
    func beforeButtonTapped() {
        profileBeforeButtonTapped()
    }
}

extension ProfileViewController {
    func profileBeforeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
//    @objc
//    private func mainButtonTapped() {
//        let loginViewController = LoginViewController()
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
//        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: loginViewController)
//    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0 :
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.cellIdentifier) as! ProfileHeaderView
            view.cellDelegate = self
            return view
        default :
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 351 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0 :
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingFooterView.cellIdentifier) as? SettingFooterView else { return UIView() }
            return view
        case 1 :
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: LogoutFooterView.cellIdentifier) as? LogoutFooterView else { return UIView() }
            return view
        default :
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 32 : 90
    }
    
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
