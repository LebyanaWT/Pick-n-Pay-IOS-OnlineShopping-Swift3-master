//  Created by 2018 William Thabang Lebyana
//  Copyright © 2018 William Thabang Lebyana All rights reserved.

import UIKit

class TableViewController: UITableViewController {

    var imageArray = ["SOFTDRINKS","freshfood","jameson","Botes","images(1)"];
    var textArray = ["Re-freshments","freshfood","Beverages","Clothing","Occassion"];
    
    override func viewDidLoad() {
        title = "Home"
        
        
        UIBarButtonItem.appearance().setTitlePositionAdjustment(UIOffset(horizontal: 100, vertical: 30), for: UIBarMetrics.default)
      
        let attributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 21)!
            
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        
        // Cart Button
        let cartButton = UIBarButtonItem(image: UIImage(named: "cart30"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(TableViewController.cartScreen));
        
        self.navigationItem.leftBarButtonItem = cartButton;
        
        // Hide Back Button - to prevent showing two buttons with the same purpose
        self.navigationItem.hidesBackButton = true;
        
    }
    
    // Move to shopping cart screen
    func cartScreen(){
        let shoppingCartScreen = storyboard?.instantiateViewController(withIdentifier: "shopping cart view") as! ShoppingCartViewController;
        
        navigationController?.show(shoppingCartScreen, sender: self);
    }
    
    // MARK: - TableView display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!;
        
        let imageView = cell?.viewWithTag(1) as! UIImageView;
        imageView.image = UIImage(named: imageArray[indexPath.row]);
        
        let textLabel = cell?.viewWithTag(2) as! UILabel;
        
        textLabel.text = textArray[indexPath.row];        
        return cell!;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count;
    }
    
    func moveToProductsView(_ ctgName:String){
        let productsViewScreen = storyboard?.instantiateViewController(withIdentifier: "products view") as! ProductsViewController;
        productsViewScreen.categoryName = ctgName;
        navigationController?.show(productsViewScreen, sender: self);
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToProductsView(textArray[indexPath.row]);
        
    }

    @IBAction func logOutButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "LoginPageViewController") as! LoginPageViewController;
        self.present(secondViewController, animated: true, completion: nil)
    }
}

