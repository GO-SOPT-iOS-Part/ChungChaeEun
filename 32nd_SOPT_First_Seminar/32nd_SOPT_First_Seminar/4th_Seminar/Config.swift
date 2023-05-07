//
//  Config.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/06.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let baseURLWeathers = "BASE_URL_Weathers"
            static let APIKeyWeathers = "API_Key_Weathers"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    static let baseURLWeathers: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURLWeathers] as? String else {
            fatalError("Base URL Weathers is not set in plist for this configuration.")
        }
        return key
    }()
    static let APIKeyWeathers: String = {
        guard let key = Config.infoDictionary[Keys.Plist.APIKeyWeathers] as? String else {
            fatalError("API Key Weathers is not set in plist for this configuration.")
        }
        return key
    }()
}
