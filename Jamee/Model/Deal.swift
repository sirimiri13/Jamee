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
    var date = ""
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

func listRice() -> [Deal]{
    var listDeal = [Deal]()
    listDeal.append(Deal(logo: "tch-logo", title: "Cơm gà Hải Nam", subtitle: "Giảm 15%", address: "55 Nguyễn Tri Phương, Q5",date: "02/02/2021"))
    listDeal.append(Deal(logo: "toocha", title: "Cơm Phúc Lộc Thọ", subtitle: "Giảm 10%", address: "31/2 Nguyễn Tri Phương, Q5",date: "03/02/2021"))
    return listDeal
}

func listCoffee() -> [Deal]{
    var listDeal = [Deal]()
    listDeal.append(Deal(logo: "tch-logo", title: "The Coffee House", subtitle: "Giảm 30%", address: "55 Nguyễn Tri Phương, Q5",date: "02/02/2021"))
    listDeal.append(Deal(logo: "toocha", title: "High Land", subtitle: "Giảm 30%", address: "31/2 Nguyễn Tri Phương, Q5",date: "03/02/2021"))
    listDeal.append(Deal(logo: "tocotoco", title: "Trung Nguyên", subtitle: "Giảm 30%", address: "121A Hồng Bàng, Q5",date: "12/02/2021"))
    listDeal.append(Deal(logo: "gongcha", title: "About Life", subtitle: "Đồng giá 29K", address: "312 Nguyễn Văn Cừ, Q1",date: "24/02/2021"))
    return listDeal
}

func listMilkTea() -> [Deal]{
    var listDeal = [Deal]()
    listDeal.append(Deal(logo: "toocha", title: "Toocha", subtitle: "Giảm 30%", address: "31/2 Nguyễn Tri Phương, Q5",date: "02/02/2021"))
    listDeal.append(Deal(logo: "tocotoco", title: "Tocotoco", subtitle: "Giảm 30%", address: "121A Hồng Bàng, Q5",date: "12/02/2021"))
    listDeal.append(Deal(logo: "gongcha", title: "GongCha", subtitle: "Đồng giá 29K", address: "312 Nguyễn Văn Cừ, Q1",date: "15/02/2021"))
    listDeal.append(Deal(logo: "theblacktea", title: "The Black Tea", subtitle: "Đồng giá 19k", address: "613 Đường 3/2, Q10",date: "01/03/2021"))
    return listDeal
}

func listCookie() -> [Deal]{
    var listDeal = [Deal]()
    listDeal.append(Deal(logo: "toocha", title: "Tous Les Jours", subtitle: "Giảm 20%", address: "31/2 Nguyễn Tri Phương, Q5",date: "02/02/2021"))
    listDeal.append(Deal(logo: "tocotoco", title: "Paris Baguette", subtitle: "Giảm 10%", address: "121A Hồng Bàng, Q5",date: "02/03/2021"))
    return listDeal
}

func listChicken() -> [Deal]{
    var listDeal = [Deal]()
    listDeal.append(Deal(logo: "toocha", title: "KFC", subtitle: "Giảm 30%", address: "31/2 Nguyễn Tri Phương, Q5",date: "02/02/2021"))
    listDeal.append(Deal(logo: "tocotoco", title: "Lotteria", subtitle: "Giảm 30%", address: "121A Hồng Bàng, Q5",date: "21/02/2021"))
    listDeal.append(Deal(logo: "gongcha", title: "MC Donald", subtitle: "Đồng giá 29K", address: "312 Nguyễn Văn Cừ, Q1",date: "02/03/2021"))
    return listDeal
}

func listPizza() -> [Deal]{
    var listDeal = [Deal]()
    listDeal.append(Deal(logo: "toocha", title: "Pizza Hut", subtitle: "Giảm 30%", address: "31/2 Nguyễn Tri Phương, Q5",date: "12/01/2021"))
    listDeal.append(Deal(logo: "tocotoco", title: "Pizza Company", subtitle: "Đồng giá 39k", address: "121A Hồng Bàng, Q5",date: "02/03/2021"))
    return listDeal
}
