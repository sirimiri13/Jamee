//
//  OrderViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButoon: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var sizeMButton: UIButton!
    @IBOutlet weak var sizeLButton: UIButton!
    
    @IBOutlet weak var time1Button: UIButton!
    @IBOutlet weak var time2Button: UIButton!
    @IBOutlet weak var time3Button: UIButton!
    @IBOutlet weak var time4Button: UIButton!
    
    @IBOutlet weak var sugar100Button: UIButton!
    @IBOutlet weak var sugar30Button: UIButton!
    @IBOutlet weak var sugar50Button: UIButton!
    @IBOutlet weak var sugar70Button: UIButton!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var addButton: UIButton!
    
    var number = 1
    var item : Item? = nil
    var name: String = ""
    var price: String = ""
    var image: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.pinkBackground()
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    func setView(){
        numberLabel.text = "\(number)"
        sizeMButton.isSelected = true
        sugar100Button.isSelected = true
        time1Button.isSelected = true
        noteTextView.layer.borderWidth = 1
        headerView.backgroundColor = UIColor.grayCustom()
        addButton.backgroundColor = UIColor.pinkBackground()
        addButton.tintColor = UIColor.white
        nameLabel.text = name
        priceLabel.text = price
    }
    @IBAction func minusTapped(_ sender: Any) {
        if number > 1 {
        number = number - 1
        numberLabel.text = "\(number)"
        }
    }
    @IBAction func plusTapped(_ sender: Any) {
        number = number + 1
        numberLabel.text = "\(number)"
    }
    @IBAction func sizeMtTapped(_ sender: Any) {
        if sizeMButton.isSelected
        {
            sizeMButton.isSelected = false
            sizeLButton.isSelected = true
        }
        else {
            sizeMButton.isSelected = true
            sizeLButton.isSelected = false
        }
    }
    @IBAction func sizeLTapped(_ sender: Any) {
        if sizeLButton.isSelected
        {
            sizeLButton.isSelected = false
            sizeMButton.isSelected = true
        }
        else {
            sizeLButton.isSelected = true
            sizeMButton.isSelected = false
        }

    }
    @IBAction func sugar100Tapped(_ sender: Any) {
        if sugar100Button.isSelected
        {
            sugar100Button.isSelected = true
            sugar70Button.isSelected = false
            sugar50Button.isSelected = false
            sugar30Button.isSelected = false
        }
        else
        {
            sugar100Button.isSelected = true
            sugar70Button.isSelected = false
            sugar50Button.isSelected = false
            sugar30Button.isSelected = false
        }
    }
    @IBAction func sugar70Tapped(_ sender: Any) {
        if sugar70Button.isSelected
        {
            sugar100Button.isSelected = false
            sugar70Button.isSelected = true
            sugar50Button.isSelected = false
            sugar30Button.isSelected = false
        }
        else
        {
            sugar100Button.isSelected = false
            sugar70Button.isSelected = true
            sugar50Button.isSelected = false
            sugar30Button.isSelected = false
        }
    }
    @IBAction func sugar50Tapped(_ sender: Any) {
        if sugar50Button.isSelected
        {
            sugar100Button.isSelected = false
            sugar70Button.isSelected = false
            sugar50Button.isSelected = true
            sugar30Button.isSelected = false
        }
        else
        {
            sugar100Button.isSelected = false
            sugar70Button.isSelected = false
            sugar50Button.isSelected = true
            sugar30Button.isSelected = false
        }
    }
    @IBAction func sugar30Tapped(_ sender: Any) {
        if sugar30Button.isSelected
        {
            sugar100Button.isSelected = false
            sugar70Button.isSelected = false
            sugar50Button.isSelected = false
            sugar30Button.isSelected = true
        }
        else
        {
            sugar100Button.isSelected = false
            sugar70Button.isSelected = false
            sugar50Button.isSelected = false
            sugar30Button.isSelected = true
        }
    }
    
     @IBAction func Time1(_ sender: Any) {
        if time1Button.isSelected
        {
            time1Button.isSelected = true
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = false
        }
        else
        {
            time1Button.isSelected = true
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = false
        }
     }
    
    @IBAction func Time2(_ sender: Any) {
        if time2Button.isSelected
        {
            time1Button.isSelected = false
            time2Button.isSelected = true
            time3Button.isSelected = false
            time4Button.isSelected = false
        }
        else
        {
            time1Button.isSelected = false
            time2Button.isSelected = true
            time3Button.isSelected = false
            time4Button.isSelected = false
        }
    }
    @IBAction func Time3(_ sender: Any) {
        if time3Button.isSelected
        {
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = true
            time4Button.isSelected = false
        }
        else
        {
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = true
            time4Button.isSelected = false
        }
    }
    @IBAction func Time4(_ sender: Any) {
        if time4Button.isSelected
        {
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = true
        }
        else
        {
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = true
        }
    }
   

    @IBAction func addTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "StoreTableViewController") as! StoreTableViewController
        vc.numOfItem = number
        navigationController?.popViewController(animated: true)
        
    }
    
}
