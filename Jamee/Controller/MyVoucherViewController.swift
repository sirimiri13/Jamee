//
//  MyVoucherViewController.swift
//  Jamee
//
//  Created by Hoàng Võ Minh on 26/12/2020.
//
import Foundation
import UIKit





class tableCell: UITableViewCell{
    @IBOutlet weak var VoucherImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}

class MyVoucherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    enum Screen : CaseIterable{
        case Voucher
        case MyVoucher
    }
    let color = UIColor.pinkBackground()
    var botBorder = UIView();
    var listData = listVoucher()
    var listMyVoucher : [Voucher] = []
    var isHiden: Bool = false
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
        if (isHiden == false){
            cell.nameLabel.text = listData[indexPath.row].voucherName;
            cell.nameLabel.numberOfLines = 0
            cell.dateLabel.text = "HSD: \(listData[indexPath.row].date)";
            

            let collectButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
            collectButton.setTitle("Collect", for: .normal)
            collectButton.setTitleColor(UIColor.pinkBackground(), for: .normal)
            collectButton.tag = indexPath.row
            collectButton.addTarget(self, action: #selector(collectTapped(_:)), for: .touchUpInside)
            cell.accessoryView = collectButton
            cell.accessoryView!.isHidden = false
        }
       
        else {
            cell.nameLabel.text = listMyVoucher[indexPath.row].voucherName;
            cell.nameLabel.numberOfLines = 0
            cell.dateLabel.text = "HSD: \(listMyVoucher[indexPath.row].date)";
            cell.accessoryView!.isHidden = true
        }
        return cell
    }
    
    
    @objc func collectTapped(_ sender: UIButton){
        sender.setTitle("Collected", for: .normal)
        sender.setTitleColor(UIColor.gray, for: .normal)
        listMyVoucher.append(listData[sender.tag])
        if (listMyVoucher.count > 1){
                listMyVoucher = listMyVoucher.sorted {
                $0.date.toDate() < $1.date.toDate()
            }
        }
        listData.remove(at: sender.tag)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isHiden ? listMyVoucher.count : listData.count
    }
    
}

