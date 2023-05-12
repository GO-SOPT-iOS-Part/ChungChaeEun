//
//  WeathersDetailCollectionViewCell.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/12.
//

import UIKit

import SnapKit
import Then

final class WeathersDetailCollectionViewCell: UICollectionViewCell {
    
    static let weathersIdentifier = "WeathersDetailCollectionViewCell"
    
    let contentsView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 3, height: 3)
        $0.layer.shadowOpacity = 0.5
        $0.layer.masksToBounds = false
    }
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 25)
    }
    let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
    }
    private func setLayout() {
        contentView.addSubview(contentsView)
        contentsView.addSubviews(titleLabel, contentLabel)
        
        contentsView.snp.makeConstraints{
//            $0.width.height.equalTo((UIScreen.main.bounds.width - 40) / 2)
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        contentLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalTo(titleLabel)
        }
    }
}
