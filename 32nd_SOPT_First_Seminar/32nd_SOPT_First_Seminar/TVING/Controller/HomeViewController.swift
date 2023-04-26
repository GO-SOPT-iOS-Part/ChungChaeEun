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
    
    private let profileButton = UIButton().then {
        $0.setImage(UIImage(named:"profile"), for: .normal)
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
        }
    }
}
