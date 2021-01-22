//
//  ConfirmOrderViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/04/2021.
//

import UIKit

class ConfirmOrderViewController: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        self.view.backgroundColor = UIColor.whiteCustom()
        let addressView = UIView()
        addressView.backgroundColor = UIColor.white
        addressLabel.attributedText = NSMutableAttributedString().normal("Đơn bạn đặt tại ").bold(addressPicker)
        addressLabel.textColor = UIColor.black
        addressLabel.backgroundColor = .white
        addressLabel.textAlignment = .justified
        
        
        addressView.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 10),
            addressLabel.leftAnchor.constraint(equalTo: addressView.leftAnchor,constant: 20),
            addressLabel.rightAnchor.constraint(equalTo: addressView.rightAnchor,constant:  -20),
            addressLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        
        self.view.addSubview(addressView)
        addressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            addressView.leftAnchor.constraint(equalTo: view.leftAnchor),
            addressView.rightAnchor.constraint(equalTo: view.rightAnchor),
            addressView.heightAnchor.constraint(equalToConstant: 45)
        ])
        let viewItem = UIView()
        viewItem.backgroundColor = .white
        viewItem.layer.borderWidth = 1
        viewItem.layer.borderColor = UIColor.gray.cgColor
        let numberLabel = UILabel()
        numberLabel.text = "\(ItemPicked.count)"
        numberLabel.backgroundColor = UIColor.pinkBackground()
        numberLabel.layer.cornerRadius = 15
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
       
        viewItem.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 10),
            numberLabel.leftAnchor.constraint(equalTo: viewItem.leftAnchor, constant: 20),
            numberLabel.widthAnchor.constraint(equalToConstant: 20),
            numberLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        let imageItem = UIImageView()
        imageItem.image = UIImage(named: ItemPicked[0].image)
        imageItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.addSubview(imageItem)
        NSLayoutConstraint.activate([
            imageItem.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 10),
            imageItem.leftAnchor.constraint(equalTo: viewItem.leftAnchor, constant: 50),
            imageItem.widthAnchor.constraint(equalToConstant: 70),
            imageItem.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        let nameItem = UILabel()
        nameItem.textColor = .black
        nameItem.text = ItemPicked[0].name
        nameItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.addSubview(nameItem)
        NSLayoutConstraint.activate([
            nameItem.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 20),
            nameItem.leftAnchor.constraint(equalTo: imageItem.rightAnchor, constant: 20),
            nameItem.widthAnchor.constraint(equalToConstant: 150),
            nameItem.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let priceItem = UILabel()
        priceItem.textColor = .black
        let priceDouble = Double(ItemPicked[0].price)
        priceItem.text = "\(String(format:" %.3f", priceDouble!)) đồng"
        priceItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.addSubview(priceItem)
        NSLayoutConstraint.activate([
            priceItem.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 20),
            priceItem.leftAnchor.constraint(equalTo: nameItem.rightAnchor, constant: 10),
            priceItem.widthAnchor.constraint(equalToConstant: 150),
            priceItem.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.view.addSubview(viewItem)
        viewItem.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewItem.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 3),
            viewItem.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewItem.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewItem.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
        let priceView = UIView()
        priceView.backgroundColor = .white
       
        
        let titlePrice = UILabel()
        titlePrice.text = "Tổng tạm tính"
        titlePrice.textColor = .black
        
        
        priceView.addSubview(titlePrice)
        titlePrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titlePrice.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 5),
            titlePrice.leftAnchor.constraint(equalTo: priceView.leftAnchor,constant: 10),
            titlePrice.widthAnchor.constraint(equalToConstant: 200),
            titlePrice.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let price = UILabel()
        price.text = "\(String(format:" %.3f", totalPrice)) đồng"
        price.textColor = UIColor.black
        priceView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 5),
            price.rightAnchor.constraint(equalTo: priceView.rightAnchor,constant: -5),
            price.widthAnchor.constraint(equalToConstant: 120),
            price.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        self.view.addSubview(priceView)
        priceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: viewItem.bottomAnchor, constant: 3),
            priceView.leftAnchor.constraint(equalTo: view.leftAnchor),
            priceView.rightAnchor.constraint(equalTo: view.rightAnchor),
            priceView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        let voucherView = UIView()
        voucherView.backgroundColor = .white
      
      
        
        let titleVoucher = UILabel()
        titleVoucher.text = "Ưu đãi"
        titleVoucher.textColor = .black
    
        let voucherButton = UIButton()
        voucherButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        voucherButton.tintColor = UIColor.gray
        
        voucherView.addSubview(titleVoucher)
        titleVoucher.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleVoucher.topAnchor.constraint(equalTo: voucherView.topAnchor, constant: 5),
            titleVoucher.leftAnchor.constraint(equalTo: voucherView.leftAnchor,constant: 10),
            titleVoucher.widthAnchor.constraint(equalToConstant: 200),
            titleVoucher.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        voucherButton.translatesAutoresizingMaskIntoConstraints = false
        voucherView.addSubview(voucherButton)
        NSLayoutConstraint.activate([
            voucherButton.topAnchor.constraint(equalTo: voucherView.topAnchor, constant: 10),
            voucherButton.rightAnchor.constraint(equalTo: voucherView.rightAnchor,constant: -10),
            voucherButton.widthAnchor.constraint(equalToConstant: 20),
            voucherButton.heightAnchor.constraint(equalToConstant: 20)
        ])

    
        self.view.addSubview(voucherView)
        voucherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voucherView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 3),
            voucherView.leftAnchor.constraint(equalTo: view.leftAnchor),
            voucherView.rightAnchor.constraint(equalTo: view.rightAnchor),
            voucherView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let paymentView = UIView()
        paymentView.backgroundColor = UIColor.white
        
        let titlePayment = UILabel()
        titlePayment.text = "Phương thức thanh toán"
        titlePayment.textColor = .black
        
        let subtitlePayment = UILabel()
        subtitlePayment.text = "Tại quầy"
        subtitlePayment.textColor = .black
        subtitlePayment.textAlignment = .right
    
        let paymentButton = UIButton()
        paymentButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        paymentButton.tintColor = UIColor.gray
        
        paymentView.addSubview(titlePayment)
        titlePayment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titlePayment.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 5),
            titlePayment.leftAnchor.constraint(equalTo: paymentView.leftAnchor,constant: 10),
            titlePayment.widthAnchor.constraint(equalToConstant: 200),
            titlePayment.heightAnchor.constraint(equalToConstant: 30)
        ])
        paymentView.addSubview(subtitlePayment)
        subtitlePayment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitlePayment.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 5),
            subtitlePayment.rightAnchor.constraint(equalTo: paymentView.rightAnchor,constant: -40),
            subtitlePayment.widthAnchor.constraint(equalToConstant: 150),
            subtitlePayment.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        paymentButton.translatesAutoresizingMaskIntoConstraints = false
        paymentView.addSubview(paymentButton)
        NSLayoutConstraint.activate([
            paymentButton.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 10),
            paymentButton.leftAnchor.constraint(equalTo: subtitlePayment.rightAnchor,constant: 10),
            paymentButton.widthAnchor.constraint(equalToConstant: 20),
            paymentButton.heightAnchor.constraint(equalToConstant: 20)
        ])

    
        self.view.addSubview(paymentView)
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paymentView.topAnchor.constraint(equalTo: voucherView.bottomAnchor, constant: 3),
            paymentView.leftAnchor.constraint(equalTo: view.leftAnchor),
            paymentView.rightAnchor.constraint(equalTo: view.rightAnchor),
            paymentView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let totalPriceView = UIView()
        totalPriceView.backgroundColor = .white
       
        
        let titleTotalPrice = UILabel()
        titleTotalPrice.text = "Tổng cộng"
        titleTotalPrice.textColor = .black
        titleTotalPrice.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        
        totalPriceView.addSubview(titleTotalPrice)
        titleTotalPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTotalPrice.topAnchor.constraint(equalTo: totalPriceView.topAnchor, constant: 5),
            titleTotalPrice.leftAnchor.constraint(equalTo: totalPriceView.leftAnchor,constant: 10),
            titleTotalPrice.widthAnchor.constraint(equalToConstant: 200),
            titleTotalPrice.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let totalPriceLabel = UILabel()
        totalPriceLabel.text = "\(String(format:" %.3f", totalPrice)) đồng"
        totalPriceLabel.textColor = UIColor.black
        totalPriceLabel.font = UIFont.systemFont(ofSize: 17, weight:.bold)
        
        totalPriceView.addSubview(totalPriceLabel)
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: totalPriceView.topAnchor, constant: 5),
            totalPriceLabel.rightAnchor.constraint(equalTo: totalPriceView.rightAnchor,constant: -10),
            totalPriceLabel.widthAnchor.constraint(equalToConstant: 120),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        self.view.addSubview(totalPriceView)
        totalPriceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalPriceView.topAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: 3),
            totalPriceView.leftAnchor.constraint(equalTo: view.leftAnchor),
            totalPriceView.rightAnchor.constraint(equalTo: view.rightAnchor),
            totalPriceView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        let confirmButton = UIButton()
        confirmButton.backgroundColor = UIColor.pinkBackground()
        confirmButton.setTitle("Xác nhận", for: .normal)
        confirmButton.layer.cornerRadius = 7
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(confirmTapped(_:)))
        confirmButton.addGestureRecognizer(tap)
        
        self.view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            confirmButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
        ])

    }
    
    @objc func confirmTapped(_ sender: UITapGestureRecognizer){
        let vc = storyboard?.instantiateViewController(identifier: "QRViewController") as! QRViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
  

}
