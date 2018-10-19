//
//  ViewController.swift
//  Todoey
//
//  Created by Hongbo Niu on 2018-10-19.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Tableview Datasource Methods (Show the data)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - Tableview Delegate (Interact with user input)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //flip the checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //deselct the line
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items (Alert)
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField  //here is the reference, not just pass the value.
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

