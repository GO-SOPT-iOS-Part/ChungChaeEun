//
//  PosterCollectionViewCell.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class PosterCollectionViewCell: UICollectionViewCell {
    static let posterIdentifier = "PosterCollectionViewCell"
    
    let posterImage = UIImageView()
    
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
        contentView.addSubview(posterImage)
        posterImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configurePosterCell(_ poster: Poster) {
        posterImage.image = poster.image
    }
}
