//
//  GridViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/08.
//

import UIKit

import Then
import SnapKit

final class GridViewController: UIViewController {
    
    private let firstView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    private let secondView = UIView().then {
        $0.backgroundColor = .green
    }
    
    private let thirdView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let fourthView = UIView().then {
        $0.backgroundColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}

extension GridViewController {
    private func layout() {
        view.addSubviews(firstView, secondView, thirdView, fourthView)
        firstView.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        secondView.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.top.equalTo(firstView.snp.bottom)
            $0.trailing.equalToSuperview()
        }
        thirdView.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.equalToSuperview()
        }
        fourthView.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.top.equalTo(thirdView.snp.bottom)
            $0.trailing.equalToSuperview()
        }
    }
}
