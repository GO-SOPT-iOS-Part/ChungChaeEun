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
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.shadowColor = .systemGray3
        label.shadowOffset = CGSize(width: 3, height:  3)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
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
        nameLabel.text = name
    }

}

private extension SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
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
