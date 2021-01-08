//
//  QR.swift
//  Jamee
//
//  Created by Huong Lam on 01/08/2021.
//

import Foundation

struct QR {
    let nameStore: String
    let address: String
    let time: String
}

func listQR() -> [QR]{
    var listQR = [QR]()
    listQR.append(QR(nameStore:"Toocha", address: "55 Nguyễn Tri Phương, Q5", time: "9h00 - 10h00"))
    listQR.append(QR(nameStore:"Gong cha",address: "31/2 Nguyễn Tri Phương, Q5", time: "10h00 - 11h00"))
    listQR.append(QR(nameStore:"The coffee house",address: "312 Nguyễn Văn Cừ, Q1", time: "9h00 - 10h00"))
    return listQR
}
