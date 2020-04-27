//
//  OrdersViewController.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// outlets of tableview , object of Dataservice and array of order class.
    @IBOutlet weak var orderTableView: UITableView!
    var myOrders = [Order]()
    let Services = DataServices()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " \(DummyData.curruntUser.name)'s Orders"
        // Do any additional setup after loading the view.
    }
    /// retreave all data from dummydata.
    override func viewWillAppear(_ animated: Bool) {
        myOrders = Services.getOrders()
    }
 
    /** numberOfRowsInSection, heightForRowAt, cellForRowAt are methods of UITableViewDataSOurce to creat a table view and
       created number of cells in table view as number of myOrders array and passed them to object of OrdersTableViewCell */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myOrders.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderTableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrdersTableViewCell
        cell.ItemCount.text = "Item Count \(String(myOrders[indexPath.row].orderItems.count))"
        cell.orderCost.text = "Total Cost $\(round(myOrders[indexPath.row].orderTotal))"
        cell.orderID.text = "OrderID \(String(myOrders[indexPath.row].id))"
        cell.OrderStatus.text = myOrders[indexPath.row].orderStatus
        return cell
    }
}
