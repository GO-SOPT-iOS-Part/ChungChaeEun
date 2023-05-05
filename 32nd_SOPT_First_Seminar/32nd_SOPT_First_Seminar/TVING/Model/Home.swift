//
//  Home.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/05.
//

import UIKit

struct Home {
    let title : String
    let more : UILabel
//    let collection : UICollectionView
}

extension Home {
    
    static func homeDummy() -> [Home] {
        return [Home(title: "티빙에서 꼭 봐야하는 콘텐츠", more: moreLabel),
                Home(title: "인기 LIVE 채널", more: moreLabel),
                Home(title: "1화 무료! 파라마운트+ 인기 시리즈", more: moreLabel)
        
        ]
    }
}


let moreLabel: UILabel = {
    let label = UILabel()
    let leadingImage = NSTextAttachment(image: .icn_right)
    let attributedString = NSMutableAttributedString()
    attributedString.append(NSAttributedString(string: "전체보기"))
    attributedString.append(NSAttributedString(attachment: leadingImage))
    label.attributedText = attributedString
    label.textColor = .gray2
    label.font = UIFont(name: "Pretendard-Medium", size: 11)
    return label
}()
