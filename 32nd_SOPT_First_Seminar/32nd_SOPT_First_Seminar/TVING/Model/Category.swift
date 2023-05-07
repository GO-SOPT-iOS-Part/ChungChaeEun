//
//  Category.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/05.
//

import UIKit

struct Category {
    let title: String
}

extension Category {
    static func categoryDummy() -> [Category] {
        return [Category(title: "홈"),
                Category(title: "실시간"),
                Category(title: "TV프로그램"),
                Category(title: "영화"),
                Category(title: "파라마운트+")]
    }
}
