//
//  PickCategoryViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/16/2021.
//

import UIKit

protocol PickCategoryProtocol {
    func pickCategory(listDeal: [Deal],categoryPicked: String,index: Int)
}

class PickCategoryViewController: UIViewController {
    
    var delegate : PickCategoryProtocol?
    var tag : Int = 0
    var currentCategory : String = ""
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var riceImage: UIImageView!
    @IBOutlet weak var cookieImage: UIImageView!
    @IBOutlet weak var milkTeaImage: UIImageView!
    @IBOutlet weak var coffeeImage: UIImageView!
    @IBOutlet weak var chickenImage: UIImageView!
    @IBOutlet weak var pizzaImage: UIImageView!
    
    @IBOutlet weak var riceLabel: UILabel!
    @IBOutlet weak var cookieLabel: UILabel!
    @IBOutlet weak var milkTeaLabel: UILabel!
    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    @IBOutlet weak var pizzaLabel: UILabel!
    
    @IBOutlet weak var riceView: UIView!
    @IBOutlet weak var cookieView: UIView!
    @IBOutlet weak var milkTeaView: UIView!
    @IBOutlet weak var coffeeView: UIView!
    @IBOutlet weak var chickeView: UIView!
    @IBOutlet weak var pizzaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        setView()
        print(tag)
        print(currentCategory)
    }
    
    func setView(){
        titleLabel.text = "DANH MỤC"
        riceLabel.text = itemMenu.Rice.title
        cookieLabel.text = itemMenu.Cookie.title
        milkTeaLabel.text = itemMenu.BubbleTea.title
        coffeeLabel.text = itemMenu.Coffee.title
        chickenLabel.text = itemMenu.Chicken.title
        pizzaLabel.text = itemMenu.Pizza.title
        
        riceImage.image = UIImage(named: itemMenu.Rice.imageItem)?.withTintColor(UIColor.pinkBackground())
        cookieImage.image = UIImage(named: itemMenu.Cookie.imageItem)?.withTintColor(UIColor.pinkBackground())
        milkTeaImage.image = UIImage(named: itemMenu.BubbleTea.imageItem)?.withTintColor(UIColor.pinkBackground())
        coffeeImage.image = UIImage(named: itemMenu.Coffee.imageItem)?.withTintColor(UIColor.pinkBackground())
        chickenImage.image = UIImage(named: itemMenu.Chicken.imageItem)?.withTintColor(UIColor.pinkBackground())
        pizzaImage.image = UIImage(named: itemMenu.Pizza.imageItem)?.withTintColor(UIColor.pinkBackground())
        
        switch currentCategory {
        case itemMenu.Rice.title:
            riceView.layer.borderColor = UIColor.pinkBackground().cgColor
            riceView.layer.borderWidth = 2
            cookieView.layer.borderWidth = 0
            milkTeaView.layer.borderWidth = 0
            coffeeView.layer.borderWidth = 0
            chickeView.layer.borderWidth = 0
            pizzaView.layer.borderWidth = 0
        case itemMenu.Cookie.title:
            riceView.layer.borderWidth = 0
            cookieView.layer.borderColor = UIColor.pinkBackground().cgColor
            cookieView.layer.borderWidth = 2
            milkTeaView.layer.borderWidth = 0
            coffeeView.layer.borderWidth = 0
            chickeView.layer.borderWidth = 0
            pizzaView.layer.borderWidth = 0
        case itemMenu.BubbleTea.title:
            riceView.layer.borderWidth = 0
            cookieView.layer.borderWidth = 0
            milkTeaView.layer.borderColor = UIColor.pinkBackground().cgColor
            milkTeaView.layer.borderWidth = 2
            coffeeView.layer.borderWidth = 0
            chickeView.layer.borderWidth = 0
            pizzaView.layer.borderWidth = 0
        case itemMenu.Coffee.title:
            riceView.layer.borderWidth = 0
            cookieView.layer.borderWidth = 0
            milkTeaView.layer.borderWidth = 0
            coffeeView.layer.borderColor = UIColor.pinkBackground().cgColor
            coffeeView.layer.borderWidth = 2
            chickeView.layer.borderWidth = 0
            pizzaView.layer.borderWidth = 0
        case itemMenu.Chicken.title:
            riceView.layer.borderWidth = 0
            cookieView.layer.borderWidth = 0
            milkTeaView.layer.borderWidth = 0
            coffeeView.layer.borderWidth = 0
            chickeView.layer.borderColor = UIColor.pinkBackground().cgColor
            chickeView.layer.borderWidth = 2
            pizzaView.layer.borderWidth = 0
        case itemMenu.Pizza.title:
            riceView.layer.borderWidth = 0
            cookieView.layer.borderWidth = 0
            milkTeaView.layer.borderWidth = 0
            coffeeView.layer.borderWidth = 0
            chickeView.layer.borderWidth = 0
            pizzaView.layer.borderWidth = 2
            pizzaView.layer.borderColor = UIColor.pinkBackground().cgColor
        default:
            print("no data")
        }
        
        let riceTap = UITapGestureRecognizer(target: self, action: #selector(ricePicker(_:)))
        let cookieTap = UITapGestureRecognizer(target: self, action: #selector(cookiePicker(_:)))
        let milkTeaTap = UITapGestureRecognizer(target: self, action: #selector(milkTeaPicker(_:)))
        let coffeeTap = UITapGestureRecognizer(target: self, action: #selector(coffeePicker(_:)))
        let chickenTap = UITapGestureRecognizer(target: self, action: #selector(chickenPicker(_:)))
        let pizzaTap = UITapGestureRecognizer(target: self, action: #selector(pizzaPicker(_:)))
        
        
        
        riceView.isUserInteractionEnabled = true
        cookieView.isUserInteractionEnabled = true
        milkTeaView.isUserInteractionEnabled = true
        coffeeView.isUserInteractionEnabled = true
        chickeView.isUserInteractionEnabled = true
        pizzaView.isUserInteractionEnabled = true
        
        riceView.addGestureRecognizer(riceTap)
        cookieView.addGestureRecognizer(cookieTap)
        milkTeaView.addGestureRecognizer(milkTeaTap)
        coffeeView.addGestureRecognizer(coffeeTap)
        chickeView.addGestureRecognizer(chickenTap)
        pizzaView.addGestureRecognizer(pizzaTap)

        
    }

    
    @objc func ricePicker(_ sender: UITapGestureRecognizer){
        self.delegate!.pickCategory(listDeal: listRice(),categoryPicked: itemMenu.Rice.title,index: 1 )
        self.dismiss(animated: true, completion: nil)
    }
    @objc func cookiePicker(_ sender: UITapGestureRecognizer){
        self.delegate!.pickCategory(listDeal: listCookie(),categoryPicked: itemMenu.Cookie.title,index: 2)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func milkTeaPicker(_ sender: UITapGestureRecognizer){
        self.delegate!.pickCategory(listDeal: listMilkTea(),categoryPicked: itemMenu.BubbleTea.title,index: 3)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func coffeePicker(_ sender: UITapGestureRecognizer){
        self.delegate!.pickCategory(listDeal: listCoffee(),categoryPicked: itemMenu.Coffee.title,index: 4)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func chickenPicker(_ sender: UITapGestureRecognizer){
        self.delegate!.pickCategory(listDeal: listChicken(),categoryPicked: itemMenu.Chicken.title,index: 5)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func pizzaPicker(_ sender: UITapGestureRecognizer){
        self.delegate!.pickCategory(listDeal: listPizza(),categoryPicked: itemMenu.Pizza.title,index: 6)
        self.dismiss(animated: true, completion: nil)
    }
}
