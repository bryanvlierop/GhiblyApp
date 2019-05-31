//
//  GhibliTableViewController.swift
//  Ghibli
//
//  Created by Bryan van Lierop on 31/05/2019.
//  Copyright © 2019 Ylja van Son. All rights reserved.
//

import UIKit

class GhibliTableViewController: UITableViewController {

    var ghiblies: [Ghibli] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GhibliRepository.load(
            completion: {
                (result) -> () in
                self.ghiblies = result
                self.ghiblies.sort(by: {$0.title < $1.title})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        },
            fail: {
                (error) -> () in
                print(error)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ghiblies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GhibliCell") as! GhibliCell
        let ghibli = ghiblies[indexPath.row]
        cell.setGhibli(model: ghibli)
        return cell
    }
}
