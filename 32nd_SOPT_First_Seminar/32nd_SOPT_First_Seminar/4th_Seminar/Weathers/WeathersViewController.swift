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
    
    var cityWeathers: [Weathers] = [] {
        didSet {
//             변화가 있을 떄마다 reload 해주어서 변화값을 보여줌
            self.tableView.reloadData()
        }
    }
    
    let city: [String] = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weathers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStyle()
        setLayout()
    }
}

extension WeathersViewController {
    
    private func weathers() {
        city.forEach {
            WeathersService.shared.weathers(cityName: $0 ) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? Weathers else { return }
                    print(self.cityWeathers)
                    self.cityWeathers.append(data)
                default:
                    return
                }
            }
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        tableView.do {
            $0.register(WeathersTableViewCell.self, forCellReuseIdentifier: WeathersTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
        self.navigationController?.navigationBar.topItem?.title = "날씨"
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setLayout() {
        view.addSubviews(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension WeathersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeathersTableViewCell.identifier, for: indexPath) as? WeathersTableViewCell else { return UITableViewCell() }
        
        cell.configureWeathersCell(cityWeathers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click Cell Number:" + String(indexPath.row))
        
        let weathersDetailVC = WeathersDetailViewController()

        weathersDetailVC.configureWeathersDetailCell(cityWeathers[indexPath.row])
        weathersDetailVC.weathersCollectionView.reloadData()
        
        self.navigationController?.pushViewController(weathersDetailVC, animated: true)
    }
}
