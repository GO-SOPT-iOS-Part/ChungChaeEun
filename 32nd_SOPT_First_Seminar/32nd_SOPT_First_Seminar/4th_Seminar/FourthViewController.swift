//
//  FourthViewController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/06.
//
import UIKit

final class FourthViewController: UIViewController {
    
    let array : [Array] = ["a", "b"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
        
        
        
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "cce523@google.com",
                                    nickname: "chaeeun",
                                    password: "chaen1234!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
