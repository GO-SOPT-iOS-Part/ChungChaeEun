//
//  WeathersTableViewCell.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/07.
//

import UIKit

import SnapKit
import Then

final class WeathersTableViewCell: UITableViewCell {
    
    static let identifier = "WeathersTableViewCell"
    
    private lazy var weathersImage = UIImageView()
    private let cityLabel = UILabel()
    private let tempLabel = UILabel()
    private let humidityLabel = UILabel()
    
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
        separatorInset.left = 1
        selectionStyle = .default
        
        cityLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        tempLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        
        humidityLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    func setLayout() {
        contentView.addSubviews(
            weathersImage,
            cityLabel,
            tempLabel,
            humidityLabel)
        
        weathersImage.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        cityLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        tempLabel.snp.makeConstraints{
            $0.trailing.equalTo(cityLabel)
            $0.top.equalTo(cityLabel.snp.bottom).offset(15)
        }
        
        humidityLabel.snp.makeConstraints{
            $0.trailing.equalTo(cityLabel)
            $0.top.equalTo(tempLabel.snp.bottom).offset(15)
        }
    }
    
    func configureWeathersCell(_ weathers: Weathers) {
        if let imageURL = weathers.weather.first?.icon {
            weathersImage.getImageFromURL(imageURL)
        }
        cityLabel.text = weathers.name
        tempLabel.text = "현재 온도: " + String(weathers.main.temp) + "ºC"
        humidityLabel.text = "습도: " + String(weathers.main.humidity) + "%"
    }
}
