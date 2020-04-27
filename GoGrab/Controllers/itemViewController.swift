//
//  itemViewController.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit


class itemViewController: UIViewController {
    
    ///Making showItem Object of Item class to get value of selected cell from ItemsViewController
    var showItem : Item?
    /// PurchaseQuantity is variable to store quantity in double
    var PurchaseQuantity : Double = 1.0
    /// servises is variable of DataService class which holds all the methods to retreave data.
    let services = DataServices()
    /// thisUserCart is object of  Cart Class
    var thisUserCart : Cart!
    /// making outlets Cart Total, Item Image, Item Name, Quantity lable etc
    @IBOutlet weak var cartTotal: UILabel!
    @IBOutlet weak var showItemImage: UIImageView!
    @IBOutlet weak var showItemName: UILabel!
    @IBOutlet weak var QuantityLbl: UILabel!
    @IBOutlet weak var showProductCost: UILabel!
    @IBOutlet weak var showProductType: UILabel!
    @IBOutlet weak var showProductStoreName: UILabel!
    
    /// useing IBAction of UIStepper and retriving change in value by user and presenting it in QuantityLbl and passing it in PurchaseQuantity
    @IBAction func quantityStepper(_ sender: UIStepper) {
        QuantityLbl.text = String(sender.value)
        PurchaseQuantity = sender.value
    }
    /// Function showAlert, to show alert or error to user, using UIAlertController
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    /// addToCart IBAction to add required quantity for user in user cart by using method of servises.
    @IBAction func addToCart(_ sender: Any) {
        let total = services.addItemToCart(thisItem: showItem!, quantity: PurchaseQuantity)
        showAlert(for: "item Added to cart new cart Total is $\(round(100 * total)/100)")
        
        
    }
    
    /// viewDidLoad method implements totle, cart total, item object detail when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(showItem!.name) at \(showItem!.store.storeName)"
        // Do any additional setup after loading the view.
        cartTotal.text = "Cart Total $\(round(100 * DummyData.userCart.cartCost)/100)"
        showItemImage.image = UIImage(named: showItem!.image)
        showItemName.text = showItem!.name
        showProductCost.text = "$\(String(showItem!.cost))"
        showProductType.text = showItem?.itemType.itemType
        showProductStoreName.text = showItem?.store.storeName
    }
    
    
}
