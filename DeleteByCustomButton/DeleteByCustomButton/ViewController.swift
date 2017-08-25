//
//  ViewController.swift
//  DeleteByCustomButton
//
//  Created by Appinventiv Technologies on 25/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//=============== variable's ==============
    var rowArray = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
//============= TableView ==================
    @IBOutlet weak var tablView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tablView.dataSource = self
        tablView.delegate = self
        
    }

    @IBAction func deleteButtonTap(_ sender: UIButton) {
        guard   let tableCell = getCell(sender) as? CellData else{fatalError()}
        guard let indexPath = self.tablView.indexPath(for: tableCell) else {fatalError()}
        rowArray.remove(at: indexPath.row)
        tablView.reloadData()
        print(rowArray)

    }
    
}
//=========== Class extension ================
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    //------------- For number of rows-------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    //============ methode for TableView ----------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as? CellData else{
            fatalError()
        }
        cell.cellDataLabel.text = rowArray[indexPath.row]
        return cell
    }
    //================ method's ==================
    func getCell(_ button: UIButton) -> UITableViewCell{
        var cell : UIView = button
        while !(cell is CellData) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? CellData else {fatalError()}
        return tableCell
    }

}

//================ TableView Method's ===========
class CellData: UITableViewCell {
    @IBOutlet weak var cellDataLabel: UILabel!
    
}

