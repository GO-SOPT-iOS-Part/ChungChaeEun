//
//  LogoutFooterView.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

class LogoutFooterView: UITableViewHeaderFooterView {
    
    lazy var logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.setTitleColor(.gray2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 2
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
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
        self.addSubview(logoutButton)
        logoutButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(55)
        }
    }
}
