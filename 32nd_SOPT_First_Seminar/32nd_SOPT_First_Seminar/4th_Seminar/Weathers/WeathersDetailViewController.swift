//
//  WeathersDetailViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/12.
//

import UIKit

import SnapKit
import Then

final class WeathersDetailViewController: UIViewController {
    
    let cityLabel = UILabel()
    let weathersImage = UIImageView()
    let tempLabel = UILabel()
    let descriptionLabel = UILabel()
    let maxMinLabel = UILabel()
    let separateLine = UIView()
    let weathersFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
//        $0.minimumInteritemSpacing = 10
//        $0.minimumLineSpacing = 10
    }
    
    lazy var weathersCollectionView = UICollectionView(frame: .zero,
                                                               collectionViewLayout: self.weathersFlowLayout).then{
        $0.register(WeathersDetailCollectionViewCell.self, forCellWithReuseIdentifier: WeathersDetailCollectionViewCell.weathersIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .clear
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension WeathersDetailViewController {
    private func setStyle() {
        view.backgroundColor = .white
        tempLabel.do {
            $0.font = .boldSystemFont(ofSize: 20)
        }
        descriptionLabel.do {
            $0.font = .systemFont(ofSize: 15)
        }
        maxMinLabel.do {
            $0.font = .systemFont(ofSize: 15)
        }
        separateLine.do {
            $0.backgroundColor = .gray1
        }
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = cityLabel.text
    }
    
    private func setLayout() {
        
        view.addSubviews(
            cityLabel,
            weathersImage,
            tempLabel,
            descriptionLabel,
            maxMinLabel,
            separateLine,
        weathersCollectionView)
        
        weathersImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        
        tempLabel.snp.makeConstraints{
            $0.top.equalTo(weathersImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(tempLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        maxMinLabel.snp.makeConstraints{
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        separateLine.snp.makeConstraints{
            $0.top.equalTo(maxMinLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(15)
            $0.height.equalTo(1)
        }
        weathersCollectionView.snp.makeConstraints{
            $0.top.equalTo(separateLine.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    func configureWeathersDetailCell(_ weathers: Weathers) {
        if let imageURL = weathers.weather.first?.icon {
            weathersImage.getImageFromURL(imageURL)
        }
        cityLabel.text = weathers.name
        tempLabel.text = String(weathers.main.temp) + "ºC"
        descriptionLabel.text = weathers.weather[0].descript
        maxMinLabel.text = "최대: " + String(weathers.main.temp_max) + "ºC  최소: " + String(weathers.main.temp_min) + "ºC"
    }
}

extension WeathersDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 10) / 2, height: (UIScreen.main.bounds.width - 10) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeathersDetailCollectionViewCell.weathersIdentifier, for: indexPath) as? WeathersDetailCollectionViewCell else { return UICollectionViewCell() }
//        cell.configurePosterCell(posterDummyCase[indexPath.row])
        let weathersDetailCollectionViewCell = WeathersDetailCollectionViewCell()
//        let weathers = Weathers
        switch indexPath.item {
        case 0:
            weathersDetailCollectionViewCell.titleLabel.text = "체감 온도"
//            weathersDetailCollectionViewCell.contentLabel.text = weathers.main.feels_like
            weathersDetailCollectionViewCell.contentLabel.text = "1"
        case 1:
            weathersDetailCollectionViewCell.titleLabel.text = "습도"
            weathersDetailCollectionViewCell.contentLabel.text = "2"
        case 2:
            weathersDetailCollectionViewCell.titleLabel.text = "압력"
            weathersDetailCollectionViewCell.contentLabel.text = "3"
        case 3:
            weathersDetailCollectionViewCell.titleLabel.text = "바람"
            weathersDetailCollectionViewCell.contentLabel.text = "4"
        default:
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
