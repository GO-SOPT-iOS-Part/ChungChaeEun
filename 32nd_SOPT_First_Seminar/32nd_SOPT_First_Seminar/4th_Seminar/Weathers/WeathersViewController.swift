//
//  WeathersViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/07.
//
import UIKit

import SnapKit
import Then

final class WeathersViewController: UIViewController {
    
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weathers()
        setStyle()
        setLayout()
    }
}

extension WeathersViewController {
    
    private func weathers() {
        WeathersService.shared.weathers(cityName: "seoul" ) { response in
            switch response {
            case .success(let data):
                guard let data = data as? Weathers else { return }
                dump(data)
            default:
                return
            }
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
    }

}

