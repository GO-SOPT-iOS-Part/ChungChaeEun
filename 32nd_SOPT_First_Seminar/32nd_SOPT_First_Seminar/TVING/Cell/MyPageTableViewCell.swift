//
//  MyPageTableViewCell.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewCell: UITableViewCell {
    static let identifier = "MyPageTableViewCell"
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.textColor = .gray2
    }
    
    private lazy var nextImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        self.backgroundColor = .black
        separatorInset.left = 0
        selectionStyle = .none
    }

    func setLayout() {
        contentView.addSubviews(titleLabel, nextImage)
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        nextImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    func configureCell(_ myPage: MyPage) {
        titleLabel.text = myPage.title
        nextImage.image = myPage.image
    }
}
