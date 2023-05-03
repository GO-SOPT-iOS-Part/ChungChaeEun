//
//  HomeViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private let homeView = UIView()
    
    
    
    private let poster1 = UIImageView().then {
        $0.image = UIImage(named: "poster1")
    }
    private let poster2 = UIImageView().then {
        $0.image = UIImage(named: "poster2")
    }
    private let poster3 = UIImageView().then {
        $0.image = UIImage(named: "poster3")
    }
    private let poster4 = UIImageView().then {
        $0.image = UIImage(named: "poster4")
    }
    private let poster5 = UIImageView().then {
        $0.image = UIImage(named: "poster5")
    }
    //    private let poster6 = UIImageView().then {
    //        $0.image = UIImage(named: "poster6")
    //    }
    //    private let poster7 = UIImageView().then {
    //        $0.image = UIImage(named: "poster7")
    //    }
    //    private let poster8 = UIImageView().then {
    //        $0.image = UIImage(named: "poster8")
    //    }
    //
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    
    
}
