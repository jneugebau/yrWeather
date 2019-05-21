//
//  FavViewController.swift
//  yrWeather
//
//  Created by Joerg Neugebauer on 21.05.19.
//  Copyright © 2019 Joerg Neugebauer. All rights reserved.
//

import UIKit

class FavViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cities:[String] = ["Munich", "New York", "Los Angeles", "Sydney", "Hongkong"]
    

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tblViewFavorites: UITableView!
    
    let clRed:CGColor = UIColor(red: 238.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let clBlue:CGColor = UIColor(red: 0/255.0, green: 153.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let clOrange:CGColor = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor
    
    
    /*
     * close favorites view
     */
    @IBAction func buttonCloseClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     * add new location to favorites list
     */
    @IBAction func buttonAddClicked(_ sender: Any) {
        
    }
    
    /*
     *
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    /*
     * delete row from table view
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            cities.remove(at: indexPath.row)
            tblViewFavorites.reloadData()
        }
    }
    
    /*
     *
     */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8.0
    }
    
    /*
     * return number of rows
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    /*
     * fill rows
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cities[indexPath.row]
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1
        cell.layer.borderColor = clBlue
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnClose.layer.cornerRadius = 10
        btnClose.layer.backgroundColor = clBlue



        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
