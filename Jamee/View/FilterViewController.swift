//
//  FilterViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/16/2021.
//

import UIKit

protocol FilterProtocol {
    func getFilter(type: String)
}

class FilterViewController: UIViewController {
    var filterSelected: String = "Mới nhất"
    var delegate : FilterProtocol?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deepButton: UIButton!
    @IBOutlet weak var nearButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }


    func setView(){
        titleLabel.text = "Bộ lọc"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = UIColor.pinkBackground()
        newButton.isSelected = true
        newButton.setTitle("\tMới nhất", for: .normal)
        nearButton.setTitle("\tGần nhất", for: .normal)
        deepButton.setTitle("\tGiảm nhiều nhất", for: .normal)
        
        newButton.tintColor = UIColor.pinkBackground()
        nearButton.tintColor = UIColor.pinkBackground()
        deepButton.tintColor = UIColor.pinkBackground()
        applyButton.setTitle("Áp dụng", for: .normal)
        applyButton.tintColor = UIColor.white
        applyButton.backgroundColor = UIColor.pinkBackground()
    }

    @IBAction func newTapped(_ sender: Any) {
        if (newButton.isSelected){
            filterSelected = "Mới nhất"
            nearButton.isSelected = false
            deepButton.isSelected = false
        }
        else {
            filterSelected = "Mới nhất"
            newButton.isSelected = true
            nearButton.isSelected = false
            deepButton.isSelected = false
        }
    }
    @IBAction func nearTapped(_ sender: Any) {
        if (nearButton.isSelected){
            filterSelected = "Gần nhất"
            newButton.isSelected = false
            deepButton.isSelected = false
        }
        else{
            filterSelected = "Gần nhất"
            nearButton.isSelected = true
            newButton.isSelected = false
            deepButton.isSelected = false
        }
    }
    @IBAction func deepTapped(_ sender: Any) {
        if (deepButton.isSelected){
            filterSelected = "Giảm nhiều nhất"
            newButton.isSelected = false
            nearButton.isSelected = false
        }
        else {
            filterSelected = "Giảm nhiều nhất"
            deepButton.isSelected = true
            newButton.isSelected = false
            nearButton.isSelected = false
        }
    }
    
    @IBAction func applyTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.getFilter(type: filterSelected)
    }
    
}
