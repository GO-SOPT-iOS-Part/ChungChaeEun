//
//  HomeHeaderView.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class HomeHeaderView: BaseView {
    
    private var posterDummyCase = Poster.posterDummy()
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 0
        $0.minimumLineSpacing = 0
//        $0.itemSize = CGSize(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.width * 1.328)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: self.flowLayout).then{
        $0.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.posterIdentifier)
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .clear
    }
    
    override func setStyle() {
        self.backgroundColor = .clear
    }
    
    override func setLayout() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension HomeHeaderView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterDummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.posterIdentifier, for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
        cell.configurePosterCell(posterDummyCase[indexPath.row])
        return cell
    }
}

extension HomeHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
