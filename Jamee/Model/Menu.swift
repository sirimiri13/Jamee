//
//  Menu.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import Foundation
struct Menu {
    var name  = ""
    var price = ""
    var image = ""
}


func listMenu() -> [Menu]{
    var listMenu = [Menu]()
    listMenu.append(Menu(name: "Bạc sỉu", price: "29.000", image: ""))
    listMenu.append(Menu(name: "Cà phê sữa", price: "29.000", image: ""))
    listMenu.append(Menu(name: "Trà đào", price: "29.000", image: ""))
    listMenu.append(Menu(name: "Trà vải", price: "29.000", image: ""))
    listMenu.append(Menu(name: "Sinh tố xoài", price: "29.000", image: ""))
    listMenu.append(Menu(name: "Cacao sữa", price: "29.000", image: ""))
    return listMenu
    
}
