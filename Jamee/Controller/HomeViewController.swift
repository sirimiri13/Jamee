//
//  HomeViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit
import ImageSlideshow

class categoryCell: UICollectionViewCell{
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}

class ListDealCell : UITableViewCell{
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    private enum itemMenu: String, CaseIterable{
        case Rice
        case Cookie
        case BubbleTea
        case Coffee
        case Chicken
        case Pizza
        
        var title: String  {
            switch self {
            case .Rice:
                return "Cơm"
            case .Cookie:
                return "Bánh"
            case .BubbleTea:
                return "Trà Sữa"
            case .Coffee:
                return "Cà phê"
            case .Chicken:
                return "Gà rán"
            case .Pizza:
                return "Pizza"
            }
        }
            
        var imageItem: String {
            switch self {
            case .Rice:
                return "rice"
            case .Cookie:
                return "cookie"
            case .BubbleTea:
                return "bubble-tea"
            case .Coffee:
                return "coffee-cup"
            case .Chicken:
                return "fried-chicken"
            case .Pizza:
                return "pizza-1"
            }
        }
        
    }
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerSlider: ImageSlideshow!
    @IBOutlet weak var menuSlider: UICollectionView!
    @IBOutlet weak var seeAllButton: UIButton!
   
    @IBOutlet weak var menuView: UIView!
    
    
    var screenWidth: CGFloat!
    var screenSize: CGRect!
    var listBannerImage = [BundleImageSource(imageString: "pizza"), BundleImageSource(imageString: "tch"), BundleImageSource(imageString: "passio")]
    let listDealSuggest = listDeal()
    @IBOutlet weak var DealTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("item: \(listDealSuggest.count)")
        setElement()
        setCollectionView()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        menuSlider.delegate = self
        menuSlider.dataSource = self
        DealTableView.dataSource = self
        DealTableView.delegate = self
      
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func setCollectionView(){
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: menuView.frame.size.width/4, height: menuView.frame.size.height)
        menuSlider.collectionViewLayout = layout
        
    }
    
    func setElement(){
     //   contentScrollView.backgroundColor = UIColor.grayCustom()
        headerView.backgroundColor = UIColor.pinkBackground()
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.black.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        nameLabel.text = "Chào, Hương!"
        nameLabel.textColor = .white
        nameLabel.font =  UIFont.systemFont(ofSize: 18, weight: .bold)
        menuView.backgroundColor = UIColor.clear
        
        // set banner
        bannerSlider.slideshowInterval = 3.0
        bannerSlider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        bannerSlider.contentScaleMode = UIViewContentMode.scaleAspectFill

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.pinkBackground()
        pageControl.pageIndicatorTintColor = UIColor.black
        bannerSlider.pageIndicator = pageControl
        bannerSlider.activityIndicator = DefaultActivityIndicator()
        bannerSlider.setImageInputs(listBannerImage)
        seeAllButton.underline()
        DealTableView.isScrollEnabled = false
        DealTableView.reloadData()
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDealSuggest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListDealCell", for: indexPath) as! ListDealCell
        print(indexPath.row)
        let currentDeal = listDealSuggest[indexPath.row]
        cell.logoImage.image = UIImage(named: currentDeal.logo)
        cell.titleLabel.text = currentDeal.title
        cell.subtitleLabel.text = currentDeal.subtitle
        cell.addressLabel.text = currentDeal.address
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "StoreTableViewController") as! StoreTableViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
   
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! categoryCell
        
        let item = itemMenu.allCases[indexPath.row]
        cell.iconImage.image = UIImage(named: item.imageItem)?.withTintColor(UIColor.pinkBackground())
        cell.titleLabel.text = item.title
        
        return cell
    }
    
    
}
