//
//  ItemsViewController.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// searchBar and tableView are  Variables of  UISearchBar and UITableView from items view in main.Storyboard
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    /// servises is variable of DataService class which holds all the methods to retreave data.
    var services = DataServices()
    /// data is variable of array of items
    var data = [Item]()
    /// selected item is object of item
    var selectedItem : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }
    /// used getItems method in  viewWillAppear method of UIViewController delegate to get all the items from dummyData via servises
    override func viewWillAppear(_ animated: Bool) {
        data = services.getItems()
    }
    /** numberOfRowsInSection, heightForRowAt, cellForRowAt are methods of UITableViewDataSOurce to creat a table view and
     created number of cells in table view as number of items in data array and passed them to object of ItemTableViewCell */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
        
        cell.customView.layer.cornerRadius = cell.customView.frame.height / 2
        cell.productImage.layer.cornerRadius = cell.productImage.frame.height / 2
        cell.cellItem = data[indexPath.row]
        cell.productCost.text = "$\(data[indexPath.row].cost)"
        cell.productImage.image = UIImage(named: data[indexPath.row].image)
        cell.storeImage.image = UIImage(named: ("\(data[indexPath.row].store.storeName).png"))
        cell.productName.text = data[indexPath.row].name
        return cell
    }
    
    // MARK: - Navigation
    /** used didSelectRowAt of UITableViewDelegate to pass selectedItem object
     via prepare for segue method of UIViewController when user selects an cell.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = data[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ItemsToItem", sender: nil)
    }
    
    //preparing to pass object when row is selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemsToItem" {
            if let nextViewController = segue.destination as? itemViewController {
                nextViewController.showItem = selectedItem //Or pass any values
            }
            
        }
    }
    
}

/// implementing search bar and its delegate methods of UISearchBarDelegate
extension ItemsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count != 0) {
            data = data.filter({(Item) -> Bool in
                return Item.name.contains(searchText)
            })
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
        data = services.getItems()
        tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
}
