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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension WeathersDetailViewController {
    private func setStyle() {
        view.backgroundColor = .white
//        cityLabel.do {
//            $0.font = .systemFont(ofSize: 20)
//        }
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
            $0.backgroundColor = .gray
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
        separateLine)
        
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
            $0.trailing.leading.equalToSuperview().inset(5)
            $0.height.equalTo(1)
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
