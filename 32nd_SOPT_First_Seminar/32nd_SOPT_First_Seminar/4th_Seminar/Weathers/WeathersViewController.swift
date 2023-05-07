//
//  WeathersViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/07.
//
import UIKit

class WeathersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        weathers()
    }
    
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

}

