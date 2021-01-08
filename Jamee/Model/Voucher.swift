//
//  Voucher.swift
//  Jamee
//
//  Created by Huong Lam on 01/04/2021.
//

import Foundation

struct Voucher {
    let voucherName:String;
    let date:String;
}
func listVoucher() -> [Voucher]{
    var listVoucher = [Voucher]()
    listVoucher.append(Voucher(voucherName: "Giảm giá 30% cho các đơn hàng trên 100.000 đồng", date: "10/02/2021"))
    listVoucher.append(Voucher(voucherName: "Combo Gà rán + Pepsi chỉ với 50.000 đồng", date: "01/02/2021"))
    listVoucher.append(Voucher(voucherName: "Giảm giá 50% cho các đơn hàng trên 100.000 đồng", date: "02/02/2021"))
    listVoucher.append(Voucher(voucherName: "Giảm giá 30% cho các đơn hàng trên 100.000 đồng", date: "03/03/2021"))
    listVoucher.append(Voucher(voucherName: "Combo Gà rán + Pepsi chỉ với 50.000 đồng", date: "04/02/2021"))
    listVoucher.append(Voucher(voucherName: "Giảm giá 50% cho các đơn hàng trên 100.000 đồng", date: "03/02/2021"))
   return listVoucher
}
