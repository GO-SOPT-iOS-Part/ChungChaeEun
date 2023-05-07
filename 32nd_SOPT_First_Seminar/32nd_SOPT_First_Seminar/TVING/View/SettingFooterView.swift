//
//  SettingFooterView.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

class SettingFooterView: UITableViewHeaderFooterView {
    
    private let separateView = UIView().then{
        $0.backgroundColor = .gray4
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .black
    }
    
    private func setLayout() {
        self.addSubview(separateView)
        separateView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
