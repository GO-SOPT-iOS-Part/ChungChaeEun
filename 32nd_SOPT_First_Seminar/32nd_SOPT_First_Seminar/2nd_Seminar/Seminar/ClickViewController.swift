//
//  ClickViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/08.
//

import UIKit

import Then
import SnapKit

protocol ClickProtocol: AnyObject {
    func ClickTimes(count: Int)
}

final class ClickViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "횟수는?"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var clickButton = UIButton().then {
        $0.setTitle("click!", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self,
                     action: #selector(clickButtonTapped),
                     for: .touchUpInside)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("뒤로가기!", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self,
                     action: #selector(backButtonTapped),
                     for: .touchUpInside)
    }
    
    weak var delegate: ClickProtocol?
    
    var clickCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ClickViewController {
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubviews(titleLabel, clickButton, backButton)
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
        }
        clickButton.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        backButton.snp.makeConstraints{
            $0.top.equalTo(clickButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        
    }
    @objc
    private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        let count = clickCount
        delegate?.ClickTimes(count: count)
    }
    
    @objc
    func clickButtonTapped() {
        clickCount += 1
        if clickCount == 10 {
            clickCount -= 10
        }
        print(clickCount)
    }
}
