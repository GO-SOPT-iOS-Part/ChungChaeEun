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
    
    private let pageControl = UIPageControl().then {
        $0.numberOfPages = 6
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .gray3
        $0.currentPageIndicatorTintColor = .white
        $0.transform = CGAffineTransform(scaleX: 0.7 , y: 0.7)
    }
    
    override func setStyle() {
        self.backgroundColor = .clear
    }
    
    override func setLayout() {
        self.addSubviews(collectionView,pageControl)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(-40)

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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.pageControl.currentPage = page
      }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width/2)
        
        let newPage = Int(x/width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}

//제스처 하나에 하나씩 넘겨지도록
extension HomeHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}


