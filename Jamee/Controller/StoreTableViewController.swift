//
//  StoreTableViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit


//var itemPicked = [Item]()
var picked : Bool = false
var numOfItem : Int = 0
var totalPrice : Double = 0.000
class StoreCell: UITableViewCell{
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}

class StoreTableViewController: UITableViewController {

    @IBOutlet weak var buyButton: UIButton!
    var list = listMenu()
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.topItem?.title = "MENU"
        navigationController?.navigationBar.barTintColor = UIColor.pinkBackground()
        navigationController?.navigationBar.tintColor = UIColor.white
       // tableView.sizeToFit()
        setView()
    }
    
    func setView(){
        if (picked == true){
            let footerView = UIView()
            footerView.backgroundColor = UIColor.pinkBackground()
            footerView.tintColor = .white
            footerView.layer.cornerRadius = 10
            view.addSubview(footerView)
            footerView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: view.bounds.maxY - 30),
                footerView.leftAnchor.constraint(equalTo:view.leftAnchor,constant: 10 ),
                footerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: view.bounds.maxX - 10),
                footerView.heightAnchor.constraint(equalToConstant: 50)
            ])
            
            let contentLabel = UILabel()
            contentLabel.text = "Giỏ hàng: \t\t \(ItemPicked.count) món hàng \t\t \(String(format:" %.3f", totalPrice)) đồng"
            contentLabel.textColor = UIColor.white
            footerView.addSubview(contentLabel)
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                contentLabel.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 15),
                contentLabel.leftAnchor.constraint(equalTo:footerView.leftAnchor,constant: 20 ),
                contentLabel.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: 10),
            ])
            footerView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(confirmOrder(_:)))
            footerView.addGestureRecognizer(tap)
        }
       
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.nameLabel.text = list[indexPath.row].name
        cell.priceLabel.text = list[indexPath.row].price
        cell.logoImage.image = UIImage(named: list[indexPath.row].image)
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        addButton.setImage(UIImage(systemName: "plus")?.withTintColor(UIColor.pinkBackground()), for: .normal)
        addButton.tag = indexPath.row
        cell.accessoryView = addButton
        addButton.addTarget(self, action: #selector(addTap(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func addTap(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "OrderViewController") as! OrderViewController
        let index = sender.tag
        vc.item = list[index]
        vc.name = list[index].name
        vc.price = list[index].price
        navigationController?.pushViewController(vc, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    
    @objc func confirmOrder(_ sender: UITapGestureRecognizer){
        print("tap")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConfirmOrderViewController") as! ConfirmOrderViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
