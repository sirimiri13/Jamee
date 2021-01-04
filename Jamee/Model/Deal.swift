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
        
        listDeal.append(Deal(logo: "tocotoco", title: "The Coffee House", subtitle: "Giảm 30%", address: "Nguyễn Tri Phương"))
        listDeal.append(Deal(logo: "tocotoco", title: "Toocha", subtitle: "Giảm 30%", address: "Nguyễn Tri Phương"))
        listDeal.append(Deal(logo: "tocotoco", title: "Gongcha", subtitle: "Giảm 30%", address: "Hồng Bàng"))
        listDeal.append(Deal(logo: "tocotoco", title: "Passio", subtitle: "Đồng giá 29K", address: "Nguyễn Văn Cừ"))
        listDeal.append(Deal(logo: "tocotoco", title: "Highland", subtitle: "Đồng giá 19k", address: "Đường 3/2"))

      
        return listDeal
    }


