//
//  ConfirmOrderViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/04/2021.
//

import UIKit

class ConfirmOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        self.view.backgroundColor = UIColor.whiteCustom()
        let addressLabel = UILabel()
      //  let addressText : String = "Đơn bạn đặt tại \(addressPicker)"
        addressLabel.attributedText = NSMutableAttributedString().normal("Đơn bạn đặt tại ").bold(addressPicker)
        addressLabel.textColor = UIColor.black
        addressLabel.layer.borderWidth = 1
        addressLabel.backgroundColor = .white
        addressLabel.textAlignment = .justified
        addressLabel.layer.borderColor = UIColor.gray.cgColor
        
        self.view.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            addressLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            addressLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            addressLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let viewItem = UIView()
        viewItem.backgroundColor = .white
        viewItem.layer.borderWidth = 1
        viewItem.layer.borderColor = UIColor.gray.cgColor
        let numberLabel = UILabel()
        numberLabel.text = "\(numOfItem)"
        numberLabel.backgroundColor = UIColor.pinkBackground()
        numberLabel.layer.cornerRadius = 10
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
        imageItem.image = UIImage(named: "tocotoco")
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
        priceItem.text = "\(ItemPicked[0].price) đồng"
        priceItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.addSubview(priceItem)
        NSLayoutConstraint.activate([
            priceItem.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 20),
            priceItem.leftAnchor.constraint(equalTo: nameItem.rightAnchor, constant: 20),
            priceItem.widthAnchor.constraint(equalToConstant: 100),
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
        priceView.layer.borderColor = UIColor.gray.cgColor
        priceView.layer.borderWidth = 1
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
            price.rightAnchor.constraint(equalTo: priceView.rightAnchor,constant: -10),
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
        
    }
    

  

}
