//
//  SecondViewController.swift
//  32nd_SOPT_First_Seminar
//
//  Created by 정채은 on 2023/04/01.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        // MARK: - 속성 추가
        label.shadowColor = .systemGray3
        label.shadowOffset = CGSize(width: 3, height:  3)
        return label
    }()
    
    // MARK: - 이미지 추가
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"환영해요.png")
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        // MARK: - 속성 추가
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        dataBind()
    }
    
    //    func dataBind(name: String) {
    //        nameLabel.text = name
    //    }
    
    var name: String?
    
    func dataBind() {
        guard let name = self.name else { return }
        nameLabel.text = "🎊\(name)님 환영합니다!🎊"
    }
    
}

private extension SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, welcomeImageView, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        NSLayoutConstraint.activate([welcomeImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
                                     welcomeImageView.heightAnchor.constraint(equalToConstant: 100),
                                     welcomeImageView.widthAnchor.constraint(equalToConstant: 100),
                                     welcomeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                                    ])
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: welcomeImageView.bottomAnchor, constant: 30),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    @objc
    func backButtonTapped() {
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
