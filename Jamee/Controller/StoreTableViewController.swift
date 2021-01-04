//
//  StoreTableViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit


//var picked : Bool = true

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
    var numOfItem: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        viewWillAppear(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.topItem?.title = "MENU"
        navigationController?.navigationBar.barTintColor = UIColor.pinkBackground()
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setView(){
       
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
        vc.name = list[index].name
        vc.price = list[index].price
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
