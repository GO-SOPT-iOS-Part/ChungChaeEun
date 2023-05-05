//
//  CategoryCollectionViewCell.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class CategoryCollectionViewCell: UICollectionViewCell {
    static let categoryIdentifier = "CategoryCollectionViewCell"
    
    let categoryTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(){
        self.backgroundColor = .clear
    }
    
    private func setLayout(){
    }
}

