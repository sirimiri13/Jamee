//
//  QRDetailViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/08/2021.
//

import UIKit

class QRDetailViewController: UIViewController {

    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var qrView: UIView!
    @IBOutlet weak var qrBGView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var address: String = ""
    var time: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.topItem?.title = "QR"
        navigationController?.navigationBar.barTintColor = UIColor.pinkBackground()
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setView(){
        self.view.backgroundColor = UIColor.whiteCustom()
        qrView.addDashBorder()
        qrBGView.backgroundColor = UIColor.white
        footerView.backgroundColor = UIColor.white
        addressLabel.text = address
        timeLabel.text = time
        addressLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        timeLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
}
