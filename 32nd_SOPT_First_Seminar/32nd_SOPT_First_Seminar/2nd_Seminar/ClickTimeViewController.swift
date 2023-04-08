//
//  ClickTimeViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/08.
//

import UIKit

import SnapKit
import Then

final class ClickTimeViewController: UIViewController {
    
    private let timesLabel = UILabel().then {
        $0.text = "클릭 횟수 0"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .white
        $0.layer.backgroundColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 20
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setTitle("다음으로!", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self,
                     action: #selector(nextButtonTapped),
                     for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}

extension ClickTimeViewController {
    private func layout() {
        view.addSubviews(timesLabel, nextButton)
        
        timesLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalTo(150)
        }
        
        nextButton.snp.makeConstraints{
            $0.top.equalTo(timesLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
    }
    
    @objc private func nextButtonTapped() {
        presentToClickViewController()
    }
    @objc
    private func presentToClickViewController() {
        let clickViewController = ClickViewController()
        clickViewController.delegate = self
        clickViewController.modalPresentationStyle = .popover
        self.present(clickViewController, animated: true)
    }
}

extension ClickTimeViewController: ClickProtocol {
    func ClickTimes(count: Int) {
        timesLabel.text = "클릭 횟수 \(count)"
    }
}
