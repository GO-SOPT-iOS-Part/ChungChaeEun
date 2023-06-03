//
//  CarrotStarViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/27.
//

import UIKit

import SnapKit
import Then

final class CarrotStarViewController: UIViewController {
    
    private lazy var tableView = UITableView().then {
        $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
        $0.rowHeight = 120
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let filterDummy : [Carrot] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension CarrotStarViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
    }
}

extension CarrotStarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier, for: indexPath) as? CarrotTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(filterDummy[indexPath.row])
        
        return cell
    }
}
