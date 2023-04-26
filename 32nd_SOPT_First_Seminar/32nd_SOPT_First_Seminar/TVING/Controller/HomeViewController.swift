//
//  HomeViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "tvingTitle")
    }
    
    private let topGradationImage = UIImageView().then {
        $0.image = UIImage(named: "gradation")
    }
    
    private lazy var profileButton = UIButton().then {
        $0.setImage(UIImage(named:"profile"), for: .normal)
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        view.addSubviews(topGradationImage, titleImage, profileButton)
        
//        topGradationImage.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(94)
//        }
        
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalToSuperview().offset(11)
        }
        
        profileButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.height.equalTo(33)
        }
    }
}

extension HomeViewController {
    
    @objc
    private func profileButtonTapped() {
        pushToProfileViewController()
    }
    
    private func pushToProfileViewController() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}
