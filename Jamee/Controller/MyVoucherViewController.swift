//
//  MyVoucherViewController.swift
//  Jamee
//
//  Created by Hoàng Võ Minh on 26/12/2020.
//
import Foundation
import UIKit



var isHiden: Bool = false
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
    @IBAction func CollectTapped(_ sender: Any) {
        CollectButton.isSelected = false
        CollectButton.tintColor = UIColor.gray
        CollectButton.setTitle("Collected", for: .normal)
    }
}

class MyVoucherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let color = UIColor.pinkBackground()
    var botBorder = UIView();
    var listData:Array<Voucher> = [
        Voucher(name:"Giam 30% cho hoa don 300k",date:"27/12/2020"),
        Voucher(name:"Giam 30% cho hoa don 400k",date:"28/12/2020"),
        Voucher(name:"Giam 15% cho hoa don 500k",date:"25/12/2020"),
    ]
    var listVoucherGot: Array<Voucher> = []
    
    
    //--- Variable
   
    //--- Outlet
    @IBOutlet weak var ListVoucherButton: UIButton!
    @IBOutlet weak var MyVoucherButton: UIButton!
    @IBOutlet weak var listVoucherTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //--- List Voucher Button
        ListVoucherButton.titleLabel?.textColor = color
        botBorder = UIView(frame: CGRect(x: ListVoucherButton.frame.minX, y: ListVoucherButton.frame.maxY-3, width: ListVoucherButton.frame.width, height: 5));
        botBorder.backgroundColor = color
        self.view.addSubview(botBorder)
        //--- My Voucher Button
       // MyVoucherButton.layer.borderWidth = 1
        
        
        //--- TableView
        listVoucherTableView.delegate = self;
        listVoucherTableView.dataSource = self;
        // Do any additional setup after loading the view.
    }
  
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.topItem?.title = "VOUCHER"
        navigationController?.navigationBar.barTintColor = UIColor.pinkBackground()
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    @IBAction func ListVoucherAction(_ sender: Any) {
        botBorder.isHidden = true
        botBorder = UIView(frame: CGRect(x: ListVoucherButton.frame.minX, y: ListVoucherButton.frame.maxY-3, width: ListVoucherButton.frame.width, height: 5));
        botBorder.backgroundColor = color
        ListVoucherButton.setTitleColor(color, for: .normal)
        MyVoucherButton.setTitleColor(.black, for: .normal)
        self.view.addSubview(botBorder)
        isHiden = false
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
        isHiden = true;
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.nameLabel.text = listData[indexPath.row].name;
        cell.dateLabel.text = listData[indexPath.row].date;
        if (isHiden == true){
            cell.CollectButton.isHidden = true
        }
        else {
            cell.CollectButton.isHidden = false
        }
        
        cell.CollectButton.tintColor = UIColor.pinkBackground()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count;
    }
    
}

