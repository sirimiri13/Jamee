//
//  StoreTableViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit


var itemPicked = [Item]()
var picked : Bool = false
var numOfItem : Int = 0
var totalPrice : Double = 0.000
class StoreCell: UITableViewCell{
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButoon: UIButton!
}

class StoreTableViewController: UITableViewController {
//    var listMenu = [Menu]()
    var index = Int()
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
            contentLabel.text = "Giỏ hàng: \t\t \(numOfItem) món hàng \t\t \(String(format:" %.3f", totalPrice)) đồng"
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
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }

    @IBAction func addTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrderViewController") as! OrderViewController
        print("index")
        vc.item = list[index]
        vc.name = list[index].name
        vc.price = list[index].price
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func confirmOrder(_ sender: UITapGestureRecognizer){
        print("tap")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConfirmOrderViewController") as! ConfirmOrderViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
