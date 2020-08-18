//
//  ViewController.swift
//  tableView
//
//  Created by miyazawaryohei on 2020/08/17.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit

// フルーツを表す型を追加
struct Fruit {
    let name: String
    let isChecked: Bool
    
    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    // Fruitの配列にする
    private var fruitItems: [Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fruitItems.append(Fruit(name:"りんご", isChecked: false))
        fruitItems.append(Fruit(name:"みかん", isChecked: true))
        fruitItems.append(Fruit(name:"バナナ", isChecked: false))
        fruitItems.append(Fruit(name:"パイナップル", isChecked: true))
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.fruitItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let fruitItem = self.fruitItems[indexPath.row]
        cell.cellImage.image = nil
        
        if fruitItem.isChecked == true {
            cell.cellImage.image = UIImage(named: "checkmark")
        }
        
        cell.label.text = fruitItem.name
        
        return cell
    }
    
    
    @IBAction func exitCancell(segue:UIStoryboardSegue){
    }
    
    
    @IBAction func exitSave(segue:UIStoryboardSegue){
        let AddVC = segue.source as! AddViewController
        let addText = AddVC.addTextField.text
        
        //空の配列が入ることを防ぐ
        if addText != ""{
            fruitItems.append(Fruit(name:addText!,isChecked:false))
        }
        tableView.reloadData()
    }
    
}


