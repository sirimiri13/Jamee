//
//  FilterViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/16/2021.
//

import UIKit

class FilterViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var deepButton: UIButton!
    @IBOutlet weak var nearButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
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
    }

    @IBAction func newTapped(_ sender: Any) {
    }
    @IBAction func nearTapped(_ sender: Any) {
    }
    @IBAction func deepTapped(_ sender: Any) {
    }
}
