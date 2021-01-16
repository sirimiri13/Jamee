//
//  MenuFilterViewController.swift
//  Jamee
//
//  Created by Huong Lam on 01/16/2021.
//

import UIKit
class itemCell: UITableViewCell{
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectButton: UIButton!
}

class MenuFilterViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, PickCategoryProtocol {
    func pickCategory(listDeal: [Deal]) {
        self.listDeal = listDeal
    }
    
    var isCategory = false
    
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var indexCategoryLabel: UILabel!
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var FilterView: UIView!
    @IBOutlet weak var typeFilter: UILabel!
    @IBOutlet weak var titleFilter: UILabel!
    @IBOutlet weak var dealTableView: UITableView!
    
    @IBOutlet weak var footerView: UIView!
    var listDeal = [Deal]()
    var indexCategory: Int = 0
    enum typeOfFilter: Int,CaseIterable {
        case New
        case Near
        case Deep
        var title : String {
            switch self {
            case .New:
                return "Mới nhất"
            case .Near:
                return "Gần nhất"
            case .Deep:
                return "Giảm nhiều nhất"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        self.dealTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
    }
    
    func setView(){
        view.backgroundColor = UIColor.whiteCustom()
        let searchBar = UISearchBar()
        self.navigationItem.titleView = searchBar
        numberLabel.text = "\(listDeal.count) kết quả"
        numberLabel.textColor = UIColor.pinkBackground()
        numberLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        categoryView.layer.addBorder(edge: .right, color: UIColor.pinkBackground(), thickness: 1)
        footerView.backgroundColor = .white
        footerView.layer.cornerRadius = 10
        
        titleCategory.text = "Danh mục"
        titleCategory.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        indexCategoryLabel.textColor = UIColor.pinkBackground()
        indexCategoryLabel.text = "\(indexCategory + 1)"
        
        titleFilter.text = "Bộ lọc"
        titleFilter.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        typeFilter.textColor = UIColor.pinkBackground()
        typeFilter.text = typeOfFilter.New.title
        
        let categoryTap = UITapGestureRecognizer(target: self, action: #selector(categoryTapped(_:)))
        categoryView.addGestureRecognizer(categoryTap)
        let filterTap = UITapGestureRecognizer(target: self, action: #selector(filterTapped(_:)))
        FilterView.addGestureRecognizer(filterTap)
    }
    lazy var PickCategoryVC: PickCategoryViewController = {
        let pickCategoryVC = PickCategoryViewController()
        pickCategoryVC.transitioningDelegate = self
        pickCategoryVC.modalPresentationStyle = .custom
        return pickCategoryVC
    }()
    
    @objc func categoryTapped(_ sender: UITapGestureRecognizer){
        isCategory = true
        self.present(PickCategoryVC,animated: true)
    }
    
    lazy var FilterVC: FilterViewController = {
        let filterVC = FilterViewController()
        filterVC.transitioningDelegate = self
        filterVC.modalPresentationStyle = .custom
        return filterVC
    }()
    
    @objc func filterTapped(_ sender: UITapGestureRecognizer){
        print(isCategory)
        isCategory = false
        self.present(FilterVC,animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDeal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! itemCell
        cell.logoImage.image = UIImage(named: listDeal[indexPath.row].logo)
        cell.titleLabel.text = listDeal[indexPath.row].title
        cell.titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        cell.subtitleLabel.text = listDeal[indexPath.row].subtitle
        cell.subtitleLabel.numberOfLines = 0
        cell.dateLabel.text = "HSD: \(listDeal[indexPath.row].date)"
        cell.collectButton.setTitle("Collect", for: .normal)
        cell.collectButton.tintColor = UIColor.blue
        return cell
    }


}
extension MenuFilterViewController : UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        if (self.isCategory == true){
            return PickCategoryPresention(presentedViewController: presented, presenting: presenting)
        }
        else {
            return FilterPickPresention(presentedViewController: presented, presenting: presenting)
        }
      
    }
}

class PickCategoryPresention : UIPresentationController{
    override var frameOfPresentedViewInContainerView: CGRect {
        let padding: CGFloat = 0
        let width: CGFloat = 414
        var height: CGFloat = 330
        var y: CGFloat = 220
        
        if let _ = presentedViewController as? PickCategoryViewController {
            height = 342
            y = 220
        }
        
        return CGRect(x: padding, y: y, width: width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        let coverView = UIView(frame: containerView!.bounds)
        coverView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        containerView?.addSubview(coverView)
        coverView.addSubview(presentedView!)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PickCategoryPresention.handleTap(_:)))
        coverView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

class FilterPickPresention : UIPresentationController{
    override var frameOfPresentedViewInContainerView: CGRect {
        let padding: CGFloat = 20
        let width: CGFloat = 374
        var height: CGFloat = 194
        var y: CGFloat = 250
        
        if let _ = presentedViewController as? FilterViewController {
            height = 194
            y = 250
        }
        
        return CGRect(x: padding, y: y, width: width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        let coverView = UIView(frame: containerView!.bounds)
        coverView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        containerView?.addSubview(coverView)
        coverView.addSubview(presentedView!)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FilterPickPresention.handleTap(_:)))
        coverView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}