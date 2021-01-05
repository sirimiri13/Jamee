//
//  Menu.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import Foundation
struct Item {
    var name  = ""
    var price = ""
    var image = ""
}


func listMenu() -> [Item]{
    var listMenu = [Item]()
    listMenu.append(Item(name: "Bạc sỉu", price: "29.000", image: "bacsiu"))
    listMenu.append(Item(name: "Cà phê sữa", price: "29.000", image: "bacsiu"))
    listMenu.append(Item(name: "Trà đào", price: "29.000", image: "tradao"))
    listMenu.append(Item(name: "Trà vải", price: "29.000", image: "travai"))
    listMenu.append(Item(name: "Sinh tố xoài", price: "29.000", image: "sinhtoxoai"))
    listMenu.append(Item(name: "Cacao sữa", price: "29.000", image: "cacao"))
    return listMenu
    
}
