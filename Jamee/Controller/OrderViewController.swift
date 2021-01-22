//
//  OrderViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit

var addressPicker : String = "55 Nguyễn Tri Phương, Q5"
var time: String = "9h00 - 10h00"
var ItemPicked = [Item]()
class OrderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
   
    @IBOutlet weak var itemImage: UIImageView!
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
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var timeEmptyLabel: UILabel!
    
    @IBOutlet weak var sugar100Button: UIButton!
    @IBOutlet weak var sugar30Button: UIButton!
    @IBOutlet weak var sugar50Button: UIButton!
    @IBOutlet weak var sugar70Button: UIButton!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addressTextField: UITextField!
    
    var number = 1
    var item : Item? = nil
    var name: String = ""
    var price: String = ""
    var image: String = ""
    
    let addresses = ["55 Nguyễn Tri Phương, Q5","312/2 Sư vạn hạnh, Q10","312 Nguyễn Văn Cừ, Q10", "12 Nguyễn Thị Minh Khai, Q1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        createPickerAddress()
        dismissPickerView()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.pinkBackground()
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    func setView(){
        addressTextField.attributedPlaceholder = NSAttributedString(string: addressPicker,
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        addressTextField.setRightView(image: UIImage(systemName:"arrowtriangle.down.fill")!,color: UIColor.gray)
        
        numberLabel.text = "\(number)"
        sizeMButton.isSelected = true
        sugar100Button.isSelected = true
        time1Button.isSelected = true
        noteTextView.layer.borderWidth = 1
        headerView.backgroundColor = UIColor.grayCustom()
        addButton.backgroundColor = UIColor.pinkBackground()
        addButton.tintColor = UIColor.white
        addButton.layer.cornerRadius = 7
        nameLabel.text = name
        priceLabel.text = price
        itemImage.image = UIImage(named: item!.image)
        timeEmptyLabel.alpha = 0
        timeTextField.alpha = 0
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
            let priceItem = Double(item!.price)! - 6.000
            item?.price = "\(priceItem)"
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
            let priceItem = Double(item!.price)! + 6.000
            item?.price = "\(priceItem)"
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
            time = "9h00 - 10h00"
            time1Button.isSelected = true
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = false
            timeTextField.alpha = 0
        }
        else
        {
            time = "9h00 - 10h00"
            time1Button.isSelected = true
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = false
            timeTextField.alpha = 0
        }
     }
    
    @IBAction func Time2(_ sender: Any) {
        if time2Button.isSelected
        {
            time = "10h00 - 11h00"
            time1Button.isSelected = false
            time2Button.isSelected = true
            time3Button.isSelected = false
            time4Button.isSelected = false
            timeTextField.alpha = 0
        }
        else
        {
            time = "10h00 - 11h00"
            time1Button.isSelected = false
            time2Button.isSelected = true
            time3Button.isSelected = false
            time4Button.isSelected = false
            timeTextField.alpha = 0
        }
    }
    @IBAction func Time3(_ sender: Any) {
        if time3Button.isSelected
        {
            time = "11h00 - 12h00"
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = true
            time4Button.isSelected = false
            timeTextField.alpha = 0
        }
        else
        {
            time = "11h00 - 12h00"
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = true
            time4Button.isSelected = false
            timeTextField.alpha = 0
        }
    }
    @IBAction func Time4(_ sender: Any) {
        if time4Button.isSelected
        {
            timeTextField.alpha = 1
            timeTextField.styleTextField(color: UIColor.pinkBackground())
            time = timeTextField.text!
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = true
        }
        else {
            timeTextField.alpha = 1
            time = timeTextField.text!
            timeTextField.styleTextField(color: UIColor.pinkBackground())
            time1Button.isSelected = false
            time2Button.isSelected = false
            time3Button.isSelected = false
            time4Button.isSelected = true
        }
    }
   

    @IBAction func addTapped(_ sender: Any) {
        picked = true
        let number = NumberFormatter().number(from: numberLabel.text!)
        if (time4Button.isSelected && timeTextField.text?.isEmpty == true){
                timeEmptyLabel.alpha = 1
                timeEmptyLabel.text = "Hãy nhập khung giờ bạn muốn"
                timeEmptyLabel.textColor = UIColor.pinkBackground()
            }
        else {
            if (timeTextField.text?.isEmpty == false) {
                time = timeTextField.text!
            }
            for _ in 0..<number!.intValue {
                ItemPicked.append(item!)
                print(item?.price as Any)
                let priceItem = Double(item!.price)
                totalPrice += priceItem!
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    func createPickerAddress(){
        let picker = UIPickerView()
        picker.delegate = self
        addressTextField.inputView = picker
        
    }
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        addressTextField.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addresses.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return addresses[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    addressPicker = addresses[row]
    addressTextField.text = addressPicker
    }
}
