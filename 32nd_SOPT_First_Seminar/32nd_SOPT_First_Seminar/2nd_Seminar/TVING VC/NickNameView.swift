//
//  NickNameView.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

class NickNameView: UIView, UITextFieldDelegate {
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-Medium", size: 23)
    }
    
    private lazy var nickNameTextField = UITextField().then {
        $0.placeholder = "닉네임"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.textColor = .gray4
        $0.layer.backgroundColor = UIColor.gray2.cgColor
        $0.layer.cornerRadius = 3
        $0.setPlaceholder(color: .gray4)
        $0.addLeftPadding()
        $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 0))
        $0.rightViewMode = .always
        $0.autocorrectionType = .no
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private lazy var clearNickNameButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_x_circle"), for: .normal)
        $0.addTarget(self, action: #selector(clearNickNameButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
    
    lazy var saveButton = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.isEnabled = false
        $0.setTitleColor(.gray2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
//        $0.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(
            titleLabel,
            nickNameTextField,
            saveButton
        )
        
        nickNameTextField.addSubview(clearNickNameButton)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(20)
        }
        nickNameTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        clearNickNameButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        saveButton.snp.makeConstraints{
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(214)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 키보드 업데이트 시 원하는 기능
        if nickNameTextField.hasText {
            saveButton.isEnabled = true
            saveButtonIsEnabled()
        } else {
            saveButton.isEnabled = false
            saveButtonIsEnabled()
        }
        
        if nickNameTextField.hasText && nickNameTextField.isEditing {
            clearNickNameButton.isHidden = false
        } else {
            clearNickNameButton.isHidden = true
        }
    }
    
    func saveButtonIsEnabled(){
        if saveButton.isEnabled == true {
            saveButton.layer.backgroundColor = UIColor.red1.cgColor
            saveButton.setTitleColor(.white, for: .normal)
            saveButton.layer.borderWidth = 0
        } else {
            saveButton.setTitleColor(.gray2, for: .normal)
            saveButton.backgroundColor = .black
            saveButton.layer.borderWidth = 1
        }
    }
    
    @objc private func clearNickNameButtonTapped() {
        nickNameTextField.text = ""
        saveButton.isEnabled = false
        saveButtonIsEnabled()
        clearNickNameButton.isHidden = true
    }
    
    private func setDelegate() {
        nickNameTextField.delegate = self
    }
    
//    @objc func saveButtonTapped() {
//        presentToWelcomeViewController()
//        let welcomeViewController = WelcomeViewController()
//        guard let name = emailTextField.text else { return }
//        welcomeViewController.name = name
//        welcomeViewController.modalPresentationStyle = .popover
//        self.present(welcomeViewController, animated: true)
//        self.dismiss(animated: true, completion: nil)
//    }
}
