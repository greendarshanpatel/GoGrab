//
//  cartViewController.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class cartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    ///  outlets of tableView and cartTotal Label.
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cartTotalLbl: UILabel!
    /// variables of data from object in dummy data for current user and object of DataServices Class.
    var data = DummyData.userCart
    var services = DataServices()
    /// Function showAlert, to show alert or error to user, using UIAlertController
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    /// viewDidLoad implements values to UI for cartTotalLbl and checks if cart is emply & shows Alert.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        cartTotalLbl.text = "$\(round(100 * DummyData.userCart.cartCost)/100)"
        if DummyData.userCart.cartItems.count == 0 {
            self.showAlert(for: "Cart is Emply please fill it!")
        }else{return}
        
        
        // Do any additional setup after loading the view.
    }
    /** numberOfRowsInSection, heightForRowAt, cellForRowAt are methods of UITableViewDataSOurce to creat a table view and
     created number of cells in table view as number of items in cartItems array and passed them to object of ItemTableViewCell */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.cartItems.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
        
        cell.customView.layer.cornerRadius = cell.customView.frame.height / 2
        cell.productImage.layer.cornerRadius = cell.productImage.frame.height / 2
        cell.cellItem = data.cartItems[indexPath.row].StuffItem
        cell.productCost.text = "$\(round(100 * data.cartItems[indexPath.row].StuffItem.cost * data.cartItems[indexPath.row].Stuffquantity)/100) for \(data.cartItems[indexPath.row].Stuffquantity)"
        cell.productImage.image = UIImage(named: data.cartItems[indexPath.row].StuffItem.image)
        cell.storeImage.image = UIImage(named: ("\(data.cartItems[indexPath.row].StuffItem.store.storeName).png"))
        cell.productName.text = data.cartItems[indexPath.row].StuffItem.name
        return cell
    }
    /// Deleting selected cell and updating view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            DummyData.userCart.cartCost =  DummyData.userCart.cartCost - (data.cartItems[indexPath.row].StuffItem.cost * data.cartItems[indexPath.row].Stuffquantity)
            self.data.cartItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.cartTotalLbl.text = "\(round(100 * DummyData.userCart.cartCost)/100)"
        }
    }
    /// placeOrderPressed Action places order for current, stores order in dummydata via placeOrder method of services and clears card and cart total object.
    @IBAction func placeOrderPressed(_ sender: UIButton) {
        let tempStuff : [Cart.cartStuff] = DummyData.userCart.cartItems
        let temp : Order = Order(id: DummyData.orders.count + 1,orderTotal: DummyData.userCart.cartCost, orderStatus :Status.Pending.rawValue, user: DummyData.userCart.user, orderItems: tempStuff)
        let orderId : Int = services.placeOrder(newOrder: temp)
        DummyData.userCart.cartItems.removeAll()
        DummyData.userCart.cartCost = 0.0
        
        showAlert(for: "your OrderId is \(orderId) and confirmation sent to \(temp.user.email)")
    }
}
