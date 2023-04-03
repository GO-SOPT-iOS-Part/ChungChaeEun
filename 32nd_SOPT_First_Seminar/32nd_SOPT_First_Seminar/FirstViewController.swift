//
//  FirstViewController.swift
//  32nd_SOPT_First_Seminar
//
//  Created by 정채은 on 2023/04/01.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.shadowColor = .systemGray3
        label.shadowOffset = CGSize(width: 2, height: 2)
        return label
    }()
    
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                                 action: #selector(presentButtonTapped),
                                 for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
      }()
      
      private lazy var pushButton: UIButton = {
          let button = UIButton()
          button.setTitle("push!", for: .normal)
          button.backgroundColor = .yellow
          button.setTitleColor(.black, for: .normal)
          button.addTarget(self,
                                   action: #selector(pushButtonTapped),
                                   for: .touchUpInside)
          button.layer.cornerRadius = 20
          return button
      }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 20
        textField.addLeftPadding()
            return textField
        }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
}


private extension FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
        let secondViewController = SecondViewController()
        guard let name = nameTextField.text else { return }
//        if let name = nameTextField.text {
//                    secondViewController.dataBind(name: name)
//                }
        secondViewController.modalPresentationStyle = .popover
        secondViewController.name = name
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        let secondViewController = SecondViewController()
//        if let name = nameTextField.text {
//                    secondViewController.dataBind(name: name)
//                }
        guard let name = nameTextField.text else { return }
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        pushToSecondViewController()
    }
    
}


extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
