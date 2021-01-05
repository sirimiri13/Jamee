//
//  QRViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/05/2021.
//

import UIKit

class QRViewController: UIViewController {
   
    
    @IBOutlet weak var viewFoot: UIView!
    @IBOutlet weak var qrView: UIView!
    @IBOutlet weak var qrBGView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setView()

        // Do any additional setup after loading the view.
    }
    
    func setView(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeView(_:)))
      
        self.view.backgroundColor = UIColor.whiteCustom()
        qrView.addDashBorder()
        qrBGView.backgroundColor = UIColor.white
        viewFoot.backgroundColor = UIColor.white
        addressLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        addressLabel.text = addressPicker
        timeLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        timeLabel.text = time
       
    }

    @objc func closeView(_ sender: Any){
        navigationController?.popToRootViewController(animated: true)
    }
  
//    @IBAction func exitTapped(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
//    }
    
}
