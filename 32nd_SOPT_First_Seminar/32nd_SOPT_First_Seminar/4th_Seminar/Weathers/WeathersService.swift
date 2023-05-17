//
//  WeathersService.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/07.
//

import Foundation

import Alamofire

final class WeathersService {
    
    static let shared = WeathersService()
    
    private init() {}
    
    func weathers(cityName: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURLWeathers
        + "q=\(cityName)&appid=" + Config.APIKeyWeathers
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
//        let city: String = "\(cityName)"
        
//        let body : Parameters = [
//            "q": city,
//            "appid": Config.APIKeyWeathers]
        
        let dataRequest = AF.request(url,
                                     method: .get,
//                                     parameters: body,
                                     headers: header)

        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200, 201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Weathers.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
