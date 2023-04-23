//
//  PhotoViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/22.
//

import UIKit

import SnapKit
import Then

class PhotoViewController: BaseViewController {
    
    private var dummyCase = Photo.dummy() {
        didSet {
            // 변화가 있을 떄마다 reload 해주어서 변화값을 보여줌
            self.collectionView.reloadData()
        }
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    override func setStyle() {
        collectionView.do {
            $0.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
        }
    }
    
    override func setLayout() {
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}

extension PhotoViewController: UICollectionViewDelegate {}

extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.configureCell(dummyCase[indexPath.item])
        
        cell.handler = { [weak self] in
            guard let self else { return }
            self.dummyCase[indexPath.item].heartTapped.toggle()
        }
        return cell
    }
}

