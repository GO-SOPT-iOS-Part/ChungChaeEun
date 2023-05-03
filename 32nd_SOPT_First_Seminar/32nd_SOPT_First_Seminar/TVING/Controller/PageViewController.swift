//
//  PageViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/03.
//

import UIKit

import Then
import SnapKit

class PageViewController: UIViewController {
    
    let homeView = UIView()
    
    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "tvingTitle")
    }
    
    private let topGradationImage = UIImageView().then {
        $0.image = UIImage(named: "gradation")
    }
    
    private lazy var profileButton = UIButton().then {
        $0.setImage(UIImage(named:"profile"), for: .normal)
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
    let homeViewController = HomeViewController()
    let liveViewController = LiveViewController()
    let tvProgramViewController = TVProgramViewController()
    let movieViewController = MovieViewController()
    let paramountViewController = ParamountViewController()
    
    lazy var dataViewControllers: [UIViewController] = {
        return [homeViewController, liveViewController, tvProgramViewController, movieViewController, paramountViewController ]
    }()
    
    lazy var pageViewController: UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setStyle()
        setLayout()
    }
}

extension PageViewController {
    private func attribute() {
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    private func setStyle() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(136)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
//            $0.height.equalTo(498)
        }
        pageViewController.didMove(toParent: self)
        
        homeView.addSubviews(topGradationImage, titleImage, profileButton)
        
        topGradationImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(94)
        }
        
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalToSuperview().offset(11)
        }
        
        profileButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.height.equalTo(33)
        }
    }
}

extension PageViewController {
    
    @objc
    private func profileButtonTapped() {
        pushToProfileViewController()
    }
    
    private func pushToProfileViewController() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}


extension PageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
            let nextIndex = index + 1
            if nextIndex == dataViewControllers.count {
                return nil
            }
            return dataViewControllers[nextIndex]
        }
}
