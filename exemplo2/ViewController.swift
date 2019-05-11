//
//  ViewController.swift
//  exemplo2
//
//  Created by Aluno on 11/05/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var array = ["Lisboa", "Porto", "Viana do Castelo", "Braga"]
    var arrayB = [false, false, false, false]
    
    //MARK: properties
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: actions
    @IBAction func butActionValidar(_ sender: Any) {
        verifyChosen()
    }
    
    //MARK: ciclovida
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK UITABLEVIEWDATASOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = array[indexPath.row]
        cell.detailTextLabel?.text = "info adicional"
        
        /*if arrayB[indexPath.row]{
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }*/
        
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        
        return cell
    }
    
    //MARK: UITABLEVIEWDELEGATE
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editar = UITableViewRowAction(style: .default, title: "Editar"){action,index in
            print("editar: " + String(index.row) + " " + self.array[index.row])
        }
        editar.backgroundColor = UIColor.green
        
        let apagar = UITableViewRowAction(style: .default, title: "Apagar"){action,index in
            print("apagar: " + String(index.row))
        }
        apagar.backgroundColor = UIColor.red
        
        return [editar, apagar]
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: "Informaçao", message: array[indexPath.row], preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        print(indexPath.row)
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if arrayB[indexPath.row]{
            tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
            arrayB[indexPath.row] = false
        } else{
            tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
            arrayB[indexPath.row] = true
        }
    }*/
    
    func verifyChosen(){
        print("-----")
        for index in 0...arrayB.count-1{
            if arrayB[index]{
                print(array[index])
            }
        }
    }


}

