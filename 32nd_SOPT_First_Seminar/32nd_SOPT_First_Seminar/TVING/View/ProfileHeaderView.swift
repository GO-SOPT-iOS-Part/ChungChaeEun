//
//  ProfileHeaderView.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class ProfileHeaderView: UITableViewHeaderFooterView {
    
    lazy var beforeButton = UIButton().then {
        $0.setImage(UIImage(named:"icn_btn_before"), for: .normal)
    }
    
    private lazy var notificationButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bell")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private lazy var settingButton = UIButton().then {
        $0.setImage(UIImage(systemName: "gearshape")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "chaentopia"
        $0.font = UIFont(name: "Pretendard-Bold", size: 17)
        $0.textColor = .white
    }
    
    private lazy var changeButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-Medium", size: 10)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.layer.cornerRadius = 2
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }
    
    private let ticketView = UIView().then {
        $0.backgroundColor = .gray5
        $0.layer.cornerRadius = 3
    }
    
    private let myTicketLabel: UILabel = {
        let label = UILabel()
        let leadingImage = NSTextAttachment(image: UIImage(systemName: "ticket")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: "  나의 이용권"))
        label.attributedText = attributedString
        label.textColor = .gray3
        label.font = UIFont(name: "Pretendard-Medium", size: 13)
        return label
    }()
    
    private let myCashLabel: UILabel = {
        let label = UILabel()
        let leadingImage = NSTextAttachment(image: UIImage(systemName: "c.circle")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: "   티빙캐시"))
        label.attributedText = attributedString
        label.textColor = .gray3
        label.font = UIFont(name: "Pretendard-Medium", size: 13)
        return label
    }()
    
    private let ticketCountLabel = UILabel().then {
        $0.text = "사용중인 이용권이 없습니다."
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textColor = .gray3
    }
    
    private let cashCountLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = .white
    }
    
    private let tvProgramView = UIView().then {
        $0.backgroundColor = .gray5
        $0.layer.cornerRadius = 3
    }
    
    private let tvProgramLabel: UILabel = {
        let label = UILabel()
        let programImage = NSTextAttachment(image: UIImage(named:"와이미지타이어보다싸다")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "이용권을 구매하고 "))
        attributedString.append(NSAttributedString(attachment: programImage))
        attributedString.append(NSAttributedString(string: " 등 인기 프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"))
        label.numberOfLines = 2
        label.attributedText = attributedString
        label.textColor = .gray2
        label.font = UIFont(name: "Pretendard-SemiBold", size: 13)
        return label
    }()
    
    private let nextButton = UIButton().then {
        $0.setImage(UIImage(systemName:"chevron.right" )?.withTintColor(.gray2, renderingMode: .alwaysOriginal), for: .normal)
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
        self.addSubviews(
            beforeButton,
            notificationButton,
            settingButton,
            profileImage,
            nameLabel,
            changeButton,
            ticketView,
            tvProgramView
        )
        
//        self.contentView.addSubview(beforeButton)
        
        ticketView.addSubviews(
            myTicketLabel,
            myCashLabel,
            ticketCountLabel,
            cashCountLabel
        )
        
        tvProgramView.addSubviews(
            tvProgramLabel,
            nextButton
        )
        
        beforeButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(10)
        }
        
        notificationButton.snp.makeConstraints{
            $0.top.equalTo(beforeButton)
            $0.trailing.equalToSuperview().inset(67)
        }
        
        settingButton.snp.makeConstraints{
            $0.top.equalTo(notificationButton)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        profileImage.snp.makeConstraints{
            $0.top.equalTo(beforeButton.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(24)
            $0.width.height.equalTo(74)
        }
        
        nameLabel.snp.makeConstraints{
            $0.centerY.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(22)
        }
        
        changeButton.snp.makeConstraints{
            $0.centerY.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(23)
        }
        
        ticketView.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(29)
            $0.height.equalTo(92)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        myTicketLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(11)
        }
        
        ticketCountLabel.snp.makeConstraints{
            $0.top.equalTo(myTicketLabel)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        myCashLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-18)
            $0.leading.equalToSuperview().offset(12)
        }
        
        cashCountLabel.snp.makeConstraints{
            $0.top.equalTo(myCashLabel)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        tvProgramView.snp.makeConstraints{
            $0.top.equalTo(ticketView.snp.bottom).offset(12)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        tvProgramLabel.snp.makeConstraints{
            $0.centerY.equalTo(tvProgramView)
            $0.leading.equalToSuperview().offset(18)
        }
        
        nextButton.snp.makeConstraints{
            $0.centerY.equalTo(tvProgramView)
            $0.trailing.equalToSuperview().inset(13)
        }
    }
}
