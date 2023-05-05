//
//  Poster.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/05.
//

import UIKit

struct Poster {
    let image : UIImage
}

extension Poster {
    static func posterDummy() -> [Poster] {
        var poster: [Poster] = []
        for number in 1...6 {
            poster.append(Poster(image: UIImage(named: "poster\(number)")!))
        }
        return poster
    }
}
