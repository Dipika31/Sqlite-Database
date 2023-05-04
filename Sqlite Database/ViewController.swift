//
//  ViewController.swift
//  Sqlite Database
//
//  Created by Choudhary Dipika on 31/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Sqlite.createFile()
        
    }
    
    @IBAction func saveDataButton(_ sender: Any) {
        if let x = idTextField.text , let y = Int(x)
        {
            Sqlite.addData(id: y, name: nameTextField.text!)
        }
    }
    
    @IBAction func deleteDataButton(_ sender: UIButton) {
        if let x = idTextField.text , let y = Int(x)
        {
            Sqlite.deleteData(id: y, name: nameTextField.text!)
        }
    }
    
    @IBAction func getDataButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigate, animated: true)
    }
}
