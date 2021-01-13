//
//  MealTableViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/12.
//

import UIKit
import RealmSwift

class MealTableViewController: UITableViewController {
    
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    
    var mealType: MealType = .All
    
    var realm: Realm!

    override func viewDidLoad() {
        super.viewDidLoad()
            
        realm = try! Realm()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "最近食べた\(mealType.rawValue)"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @IBAction func pressedBarButtonItem(_ sender: UIBarButtonItem) {
        mealType = mealType.next()
        navigationController?.navigationBar.topItem?.title = "最近食べた\(mealType.rawValue)"
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var meals = realm.objects(Meal.self)
        if mealType != .All {
            meals = meals.filter("mealType == '\(mealType.rawValue)'")
        }
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var meals = realm.objects(Meal.self)
        if mealType != .All {
            meals = meals.filter("mealType == '\(mealType.rawValue)'")
        }
        meals = meals.sorted(byKeyPath: "date", ascending: false)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let meal = meals[indexPath.row]
        let title = createTitle(meal: meal)
        
        cell.textLabel?.text = title
        
        return cell
    }
    
    func createTitle(meal: Meal) -> String {
        let f = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let date = meal.date
        var dateStr = ""
        let mealType = meal.mealType
        if let date = date {
            dateStr = f.string(from: date)
        }
        let name = meal.name
        let subMealName = meal.subMealName
        let title = "\(dateStr) [\(mealType)] \(name)、\(subMealName)"
        return title
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
