//
//  WelcomeViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/10.
//

import UIKit

import Then
import SnapKit

final class WelcomeViewController: UIViewController {
    
    private let tvingImageView = UIImageView().then {
        $0.image = UIImage(named: "tving")
    }
    
    let welcomeLabel = UILabel().then {
        $0.text = "님\n반가워요!"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Bold", size: 23)
        $0.textColor = .gray1
    }
    
    private lazy var mainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .red1
        $0.layer.cornerRadius = 3
        $0.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }
    var name: String?
    
    func nameDataBind() {
            guard let name = self.name else { return }
            welcomeLabel.text = "\(name) 님\n반가워요!"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        nameDataBind()
    }
}

extension WelcomeViewController {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        view.addSubviews(
            tvingImageView,
            welcomeLabel,
            mainButton)
        
        tvingImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(58)
            $0.width.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints{
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-66)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    @objc
    private func mainButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        let pageViewController = PageViewController()
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: pageViewController)
    }
}
