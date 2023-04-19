//
//  LoginViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/10.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_before"), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        $0.textColor = .gray1
    }
    
    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.textColor = .gray2
        $0.layer.backgroundColor = UIColor.gray4.cgColor
        $0.layer.cornerRadius = 3
        $0.setPlaceholder(color: .gray2)
        $0.addLeftPadding()
        $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 0))
        $0.rightViewMode = .always
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.keyboardType = .emailAddress
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.textColor = .gray2
        $0.layer.backgroundColor = UIColor.gray4.cgColor
        $0.layer.cornerRadius = 3
        $0.setPlaceholder(color: .gray2)
        $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 0))
        $0.rightViewMode = .always
        $0.addLeftPadding()
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.isSecureTextEntry = true
        $0.textContentType = .password
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private lazy var clearEmailButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_x_circle"), for: .normal)
        $0.addTarget(self, action: #selector(clearEmailButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var clearPasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_x_circle"), for: .normal)
        $0.addTarget(self, action: #selector(clearPasswordButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var hiddenEyeButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_eye_slash"), for: .normal)
        $0.addTarget(self, action: #selector(hiddenEyeButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.isEnabled = false
        $0.setTitleColor(.gray2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private let findIdButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.titleLabel!.textAlignment = .center
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .gray4
    }
    
    private let findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.titleLabel!.textAlignment = .center
    }
    
    private let noAccountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.textColor = .gray3
    }
    
    private lazy var nickNameButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.titleLabel!.textAlignment = .center
        $0.setUnderline()
        $0.addTarget(self, action: #selector(nickNameButtonTapped), for: .touchUpInside)
    }
    
    var nickName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setDelegate()
        setLayout()
    }
}

extension LoginViewController {
    private func style() {
        view.backgroundColor = .black
    }
    private func setLayout() {
        view.addSubviews(
            backButton,
            titleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            findIdButton,
            lineView,
            findPasswordButton,
            noAccountLabel,
            nickNameButton
        )
        
        emailTextField.addSubview(clearEmailButton)
        passwordTextField.addSubviews(clearPasswordButton, hiddenEyeButton)
        
        backButton.snp.makeConstraints{
            $0.width.equalTo(8)
            $0.height.equalTo(15)
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(24)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        clearEmailButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(7)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        hiddenEyeButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        clearPasswordButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-56)
        }
        
        
        loginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.height.equalTo(52)
        }
        
        findIdButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(85)
        }
        
        lineView.snp.makeConstraints{
            $0.height.equalTo(12)
            $0.width.equalTo(1)
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(findIdButton)
        }
        
        findPasswordButton.snp.makeConstraints{
            $0.top.equalTo(findIdButton)
            $0.trailing.equalToSuperview().offset(-86)
        }
        
        noAccountLabel.snp.makeConstraints{
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(51)
        }
        
        nickNameButton.snp.makeConstraints{
            $0.top.equalTo(findIdButton.snp.bottom).offset(26)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.equalTo(22)
            $0.width.equalTo(128)
        }
    }
    @objc
    private func clearEmailButtonTapped() {
        emailTextField.text = ""
        loginButton.isEnabled = false
        loginButtonIsEnabled()
        clearEmailButton.isHidden = true
    }
    
    @objc
    private func clearPasswordButtonTapped() {
        passwordTextField.text = ""
        loginButton.isEnabled = false
        loginButtonIsEnabled()
        clearPasswordButton.isHidden = true
        hiddenEyeButton.isHidden = true
    }
    
    @objc
    private func hiddenEyeButtonTapped() {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.layer.borderWidth = 1
    }
    
    func loginButtonIsEnabled() {
        if loginButton.isEnabled == true {
            loginButton.layer.backgroundColor = UIColor.red1.cgColor
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.layer.borderWidth = 0
        } else {
            loginButton.setTitleColor(.gray2, for: .normal)
            loginButton.backgroundColor = .black
            loginButton.layer.borderWidth = 1
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 키보드 업데이트 시 원하는 기능
        if emailTextField.hasText && passwordTextField.hasText {
            loginButton.isEnabled = true
            loginButtonIsEnabled()
        } else {
            loginButton.isEnabled = false
            loginButtonIsEnabled()
        }
        
        if emailTextField.hasText && emailTextField.isEditing {
            clearEmailButton.isHidden = false
        } else {
            clearEmailButton.isHidden = true
        }
        
        if passwordTextField.hasText && passwordTextField.isEditing {
            clearPasswordButton.isHidden = false
            hiddenEyeButton.isHidden = false
        } else {
            clearPasswordButton.isHidden = true
            hiddenEyeButton.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    // Return 누르면 다음 텍스트필드로 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        } else if textField == self.passwordTextField {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    private func setDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc private func loginButtonTapped() {
        presentToWelcomeViewController()
    }
    
    @objc func presentToWelcomeViewController() {
        let welcomeViewController = WelcomeViewController()
        if ((nickName?.isEmpty) != nil) {
            guard let name = nickName else { return }
            welcomeViewController.name = name
        } else {
            guard let name = emailTextField.text else { return }
            welcomeViewController.name = name
        }
        welcomeViewController.modalPresentationStyle = .popover
        self.present(welcomeViewController, animated: true)
    }
    
    @objc func nickNameButtonTapped() {
        presentToNickNameBottomSheetViewController()
    }
    
    @objc func presentToNickNameBottomSheetViewController(){
        let nickNameBottomSheetViewController = NickNameBottomSheetViewController()
        nickNameBottomSheetViewController.modalPresentationStyle = .pageSheet
        nickNameBottomSheetViewController.delegate = self
        if let sheet = nickNameBottomSheetViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        self.present(nickNameBottomSheetViewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let utf8Char = string.cString(using: .utf8)
            let isBackSpace = strcmp(utf8Char, "\\b")
            if string.isContainNumberAndAlphabet() || isBackSpace == -92{
                return true
            }
            return false
        }
}

extension LoginViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

extension LoginViewController: DataBindNickName {
    func dataBindNickName(text: String) {
        self.nickName = text
        print(nickName!)
    }
}
