//
//  ListQRViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/08/2021.
//

import UIKit

class ListQRViewController: UIViewController {

    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var QRTableView: UITableView!
    
    let QR = listQR()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func setView(){
        orderLabel.textColor = UIColor.pinkBackground()
        orderLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
}

extension ListQRViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QRCell")
        cell?.textLabel?.text = "\(QR[indexPath.row].nameStore) - \(QR[indexPath.row].address)"
        cell?.detailTextLabel?.text = QR[indexPath.row].time
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "QRDetailViewController") as! QRDetailViewController
        vc.time = QR[indexPath.row].time
        vc.address = QR[indexPath.row].address
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
