//
//  MyVoucherViewController.swift
//  Jamee
//
//  Created by Hoàng Võ Minh on 26/12/2020.
//
import Foundation
import UIKit
class Voucher {
    init(name:String,date:String) {
        self.name = name;
        self.date = date;
    };
    let name:String;
    let date:String;
}
class tableCell: UITableViewCell{
    @IBOutlet weak var VoucherImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var CollectButton: UIButton!
}

class MyVoucherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.nameLabel.text = listData[indexPath.row].name;
        cell.dateLabel.text = listData[indexPath.row].date;
        if (MyVoucherButton.isTouchInside){
            cell.CollectButton.setTitle("Copy", for: .normal)
        }
        else{
            cell.CollectButton.setTitle("Collect", for: .normal)
        }
        cell.CollectButton.setTitleColor(color, for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count;
    }
    
    //--- Variable
    let color = UIColor.pinkBackground()
    var botBorder = UIView();
    var listData:Array<Voucher> = [
        Voucher(name:"Giam 30% cho hoa don 300k",date:"27/12/2020"),
        Voucher(name:"Giam 30% cho hoa don 400k",date:"28/12/2020"),
        Voucher(name:"Giam 15% cho hoa don 500k",date:"25/12/2020"),
    ]
    //--- Outlet
    @IBOutlet weak var ListVoucherButton: UIButton!
    @IBOutlet weak var MyVoucherButton: UIButton!
    @IBOutlet weak var listVoucherTableView: UITableView!
    
    @IBAction func CollectAction(_ sender: Any) {
        let noti = UIAlertController(title: "Noti", message: "This voucher is collected", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        noti.addAction(okButton)
        self.present(noti,animated:true,completion:nil)
    }
    
    @IBAction func ListVoucherAction(_ sender: Any) {
        botBorder.isHidden = true
        botBorder = UIView(frame: CGRect(x: ListVoucherButton.frame.minX, y: ListVoucherButton.frame.maxY-3, width: ListVoucherButton.frame.width, height: 5));
        botBorder.backgroundColor = color
        ListVoucherButton.setTitleColor(color, for: .normal)
        MyVoucherButton.setTitleColor(.black, for: .normal)
        self.view.addSubview(botBorder)
        listVoucherTableView.reloadData()
    }
    @IBAction func MyVoucherAction(_ sender: Any) {
        botBorder.isHidden = true
        botBorder = UIView(frame: CGRect(x: MyVoucherButton.frame.minX, y: MyVoucherButton.frame.maxY-3, width: MyVoucherButton.frame.width, height: 5));
        botBorder.backgroundColor = color
        ListVoucherButton.setTitleColor(.black, for: .normal)
        MyVoucherButton.setTitleColor(color, for: .normal)
        self.view.addSubview(botBorder)
        listVoucherTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //--- List Voucher Button
        ListVoucherButton.layer.borderWidth = 1
        ListVoucherButton.titleLabel?.textColor = color
        botBorder = UIView(frame: CGRect(x: ListVoucherButton.frame.minX, y: ListVoucherButton.frame.maxY-3, width: ListVoucherButton.frame.width, height: 5));
        botBorder.backgroundColor = color
        self.view.addSubview(botBorder)
        //--- My Voucher Button
        MyVoucherButton.layer.borderWidth = 1
        
        
        //--- TableView
        listVoucherTableView.delegate = self;
        listVoucherTableView.dataSource = self;
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
