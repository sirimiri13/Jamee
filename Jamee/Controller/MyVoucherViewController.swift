//
//  MyVoucherViewController.swift
//  Jamee
//
//  Created by Hoàng Võ Minh on 26/12/2020.
//
import Foundation
import UIKit



var isHiden: Bool = false

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
    var listData = listVoucher()
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
       
        isHiden = true;
        for idx in 0..<listData.count - 1{
            print(listData[idx].date.toDate())
            print(listData[idx+1].date.toDate())
            if (listData[idx].date.toDate() > listData[idx+1].date.toDate()){
                listData.swapAt(idx, idx+1)
            }
        }
        listVoucherTableView.reloadData()
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.nameLabel.text = listData[indexPath.row].voucherName;
        cell.nameLabel.numberOfLines = 0
        cell.dateLabel.text = "HSD: \(listData[indexPath.row].date)";
        if (isHiden == true){
            cell.CollectButton.isHidden = true
        }
        else {
            cell.CollectButton.isHidden = false
            cell.CollectButton.setTitle("Collect", for: .normal)
        }
        
        cell.CollectButton.tintColor = UIColor.pinkBackground()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count;
    }
    
}

