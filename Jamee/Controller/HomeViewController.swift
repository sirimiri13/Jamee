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
 
   
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerSlider: ImageSlideshow!
    @IBOutlet weak var menuSlider: UICollectionView!
    @IBOutlet weak var seeAllButton: UIButton!
   
    
    
    var screenWidth: CGFloat!
    var screenSize: CGRect!
    var listBannerImage = [BundleImageSource(imageString: "slider1"), BundleImageSource(imageString: "slider2"), BundleImageSource(imageString: "slider3"), BundleImageSource(imageString: "slider4")]
    var menu = ["Cơm","Bánh","Trà sữa","Cà phê","Gà rán", "Pizza"]
    let listDealSuggest = listDeal()
    @IBOutlet weak var DealTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("item: \(listDealSuggest.count)")
        setElement()
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

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 6
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! categoryCell
        cell.iconImage.image = UIImage(systemName: "app.gift")
        cell.iconImage.sizeToFit()
     // cell.iconImage.image = UIImage(named: "rice")
    //    cell.iconImage.image.
        cell.titleLabel.text = menu[indexPath.row]
        return cell
    }
    
    
}
