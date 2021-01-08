//
//  Deal.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import Foundation

struct Deal {
    var logo = ""
    var title = ""
    var subtitle = ""
    var address = ""
}
    func listDeal() -> [Deal]{
        var listDeal = [Deal]()
        listDeal.append(Deal(logo: "tch-logo", title: "The Coffee House", subtitle: "Giảm 30%", address: "55 Nguyễn Tri Phương, Q5"))
        listDeal.append(Deal(logo: "toocha", title: "Toocha", subtitle: "Giảm 30%", address: "31/2 Nguyễn Tri Phương, Q5"))
        listDeal.append(Deal(logo: "tocotoco", title: "Tocotoco", subtitle: "Giảm 30%", address: "121A Hồng Bàng, Q5"))
        listDeal.append(Deal(logo: "gongcha", title: "GongCha", subtitle: "Đồng giá 29K", address: "312 Nguyễn Văn Cừ, Q1"))
        listDeal.append(Deal(logo: "theblacktea", title: "The Black Tea", subtitle: "Đồng giá 19k", address: "613 Đường 3/2, Q10"))
        return listDeal
    }
