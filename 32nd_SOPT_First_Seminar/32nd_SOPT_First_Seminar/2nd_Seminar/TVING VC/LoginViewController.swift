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
        $0.addLeftPadding()
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.isSecureTextEntry = true
        // TODO: clearButtonMode, hidden eye 설정
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        $0.isEnabled = false
        //TODO: 버튼 활성화 시 UI 변경
        $0.setTitleColor(.gray2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
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
    
    private let nickNameButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel!.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.titleLabel!.textAlignment = .center
        $0.setUnderline()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        setDelegate()
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
        
        passwordTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(7)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor.gray2.cgColor
            textField.layer.borderWidth = 1
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 키보드 업데이트 시 원하는 기능
        if emailTextField.hasText && passwordTextField.hasText {
            loginButton.layer.backgroundColor = UIColor.red1.cgColor
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.layer.borderWidth = 0
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
            loginButton.setTitleColor(.gray2, for: .normal)
            loginButton.backgroundColor = .black
            loginButton.layer.borderWidth = 1
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
    
    private func loginButtonEnable() {
        if ((emailTextField.text?.isEmpty) == nil) && ((passwordTextField.text?.isEmpty) == nil) {
            print("이거")
        }
    }
}


private extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

private extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
