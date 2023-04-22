//
//  NickNameBottomSheetViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

protocol DataBindNickName: AnyObject {
    func dataBindNickName(text: String)
}

final class NickNameBottomSheetViewController: UIViewController {
    
    private var nickNameView = NickNameView().then {
        $0.layer.cornerRadius = 20
    }
    
    weak var delegate: DataBindNickName?    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setLayout()
        
    }
    
    override func loadView() {
        super.loadView()
        setLayout()
        setAddTarget()
    }
}

extension NickNameBottomSheetViewController {
    private func setLayout() {
        view.addSubview(nickNameView)
        
        nickNameView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAddTarget(){
        nickNameView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        if nickNameView.saveButton.isEnabled {
            self.dismiss(animated: true, completion: nil)
        }
        if let text = nickNameView.nickNameTextField.text {
            delegate?.dataBindNickName(text: text)
        }
    }
}
