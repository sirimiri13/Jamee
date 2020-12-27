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
        listDeal.append(Deal(logo: "tocotoco", title: "toocha", subtitle: "Giảm 30%", address: "Nguyễn Tri Phương"))
        listDeal.append(Deal(logo: "tocotoco", title: "gongcha", subtitle: "Giảm 30%", address: "Nguyễn Tri Phương"))

      
        return listDeal
    }


