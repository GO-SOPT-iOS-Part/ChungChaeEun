//
//  Carrot.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/22.
//

import UIKit

import RealmSwift

class Carrot: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var image: String = ""
    @Persisted var product: String = ""
    @Persisted var place: String = ""
    @Persisted var time: String = ""
    @Persisted var tradeStatus: String = ""
    @Persisted var price: Int = 0
    @Persisted var star: Bool = false
    
    convenience init(id: Int, image: String, product: String, place: String, time: String, tradeStatus: String, price: Int, star: Bool) {
        
        self.init()
        self.id = id
        self.image = image
        self.product = product
        self.place = place
        self.time = time
        self.tradeStatus = tradeStatus
        self.price = price
        self.star = star
    }
}

@frozen
enum Trade {
    case reservation
    case completed
    case shared
    case clear
    
    var title: String {
        switch self {
        case .reservation:
            return "예약중"
        case .completed:
            return "거래완료"
        case .shared:
            return "나눔완료"
        case .clear:
            return ""
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .reservation:
            return .systemGreen
        case .completed:
            return .black
        case .shared:
            return .gray
        case .clear:
            return .white
        }
    }
}

extension Carrot {
    
    static func dummy() -> [Carrot] {
        return [Carrot(id: 1,
                       image: "hypeBoy",
                       product: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: "거래완료",
                       price: 200000,
                       star: true),
                Carrot(id: 2,
                       image: "hypeBoy",
                       product:
                        "아이폰 11 Pro",
                       place: "하계 3동",
                       time: "4월 2일",
                       tradeStatus: "예약중",
                       price: 100000,
                       star: false),
                Carrot(id: 3,
                       image: "hypeBoy",
                       product:
                        "에어팟 맥스",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: "나눔완료",
                       price: 100000,
                       star: false),
                Carrot(id: 4,
                       image: "hypeBoy",
                       product:
                        "아이패드1",
                       place: "공릉 1동",
                       time: "6시간 전",
                       tradeStatus: "거래완료",
                       price: 100000,
                       star: false),
                Carrot(id: 5,
                       image: "hypeBoy",
                       product:
                        "아이패드 2",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: "",
                       price: 100000,
                       star: false)
                ,
                Carrot(id: 6,
                       image: "hypeBoy",
                       product:
                        "안팔아요",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: "거래완료",
                       price: 0,
                       star: false)
                ,
                Carrot(id: 7,
                       image: "hypeBoy",
                       product:
                        "아이폰 14 Pro",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: "예약중",
                       price: 1000,
                       star: false)]
    }
}
