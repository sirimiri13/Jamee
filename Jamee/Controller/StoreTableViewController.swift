//
//  StoreTableViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit

class StoreCell: UITableViewCell{
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButoon: UIButton!
}

class StoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath)

        
        return cell
    }
    

    @IBAction func addTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrderViewController") as! OrderViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
