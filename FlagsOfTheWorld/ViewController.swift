//
//  ViewController.swift
//  FlagsOfTheWorld
//
//  Created by Steven Jemmott on 30/05/2019.
//  Copyright © 2019 Lagom Experiences. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    fileprivate var imageItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.rowHeight = 70
        tableView.tableFooterView = UIView()
        
        let path = Bundle.main.resourcePath!
        let fm = FileManager.default
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        imageItems = items.filter({ return $0.hasSuffix(".png") })
        
        print(imageItems)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = imageItems[indexPath.row]
        cell.imageView?.image = UIImage(named: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = imageItems[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.imageSent = item
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

