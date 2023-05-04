//
//  ViewController2.swift
//  Sqlite Database
//
//  Created by Choudhary Dipika on 03/04/23.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    var arr2 = Sqlite.getData()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.idLabel.text = arr2[indexPath.row].id.description
        cell.nameLabel.text = arr2[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
