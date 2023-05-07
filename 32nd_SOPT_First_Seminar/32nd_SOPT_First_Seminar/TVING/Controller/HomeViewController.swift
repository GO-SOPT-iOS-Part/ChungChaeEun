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
    
    let homeTableView = UITableView()
    
    private let homeHeaderView = HomeHeaderView()

    override func setStyle() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        view.addSubview(homeHeaderView)
        
        homeHeaderView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(600)
        }
    }
}
