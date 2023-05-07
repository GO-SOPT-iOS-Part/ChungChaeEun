//
//  MyPageModel.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/26.
//

import UIKit

struct MyPage {
    let title: String
    let image: UIImage
}

extension MyPage {
    static func dummy1() -> [MyPage] {
        return [MyPage(title: "이용권", image: .icn_right),
                MyPage(title: "1:1 문의내역", image: .icn_right),
                MyPage(title: "예약알림", image: .icn_right),
                MyPage(title: "회원정보 수정", image: .icn_right),
                MyPage(title: "프로모션 정보 수신 동의", image: .icn_right)]
    }
    static func dummy2() -> [MyPage] {
                [MyPage(title: "공지사항", image: .icn_right),
                MyPage(title: "이벤트", image: .icn_right),
                MyPage(title: "고객센터", image: .icn_right),
                MyPage(title: "티빙 알이보기", image: .icn_right)]
    }
}
