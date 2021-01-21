//
//  MenuEnum.swift
//  Jamee
//
//  Created by Huong Lam on 01/16/2021.
//

import Foundation
enum itemMenu: Int, CaseIterable{
    case Rice
    case Cookie
    case BubbleTea
    case Coffee
    case Chicken
    case Pizza
    
    var title: String  {
        switch self {
        case .Rice:
            return "Cơm"
        case .Cookie:
            return "Bánh"
        case .BubbleTea:
            return "Trà Sữa"
        case .Coffee:
            return "Cà phê"
        case .Chicken:
            return "Gà rán"
        case .Pizza:
            return "Pizza"
        }
    }
        
    var imageItem: String {
        switch self {
        case .Rice:
            return "rice"
        case .Cookie:
            return "cookie"
        case .BubbleTea:
            return "bubble-tea"
        case .Coffee:
            return "coffee-cup"
        case .Chicken:
            return "fried-chicken"
        case .Pizza:
            return "pizza-1"
        }
    }
    var tag: Int {
        switch self {
        case .Rice:
            return 1
        case .Cookie:
            return 2
        case .BubbleTea:
            return 3
        case .Coffee:
            return 4
        case .Chicken:
            return 5
        case .Pizza:
            return 6
        }
    }
    
    
}
