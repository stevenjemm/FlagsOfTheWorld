//
//  DetailViewController.swift
//  FlagsOfTheWorld
//
//  Created by Steven Jemmott on 30/05/2019.
//  Copyright © 2019 Lagom Experiences. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    var imageSent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard imageSent != nil else {
            return
        }
        
        imageView.image = UIImage(named: imageSent!)
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleShare))
        navigationItem.rightBarButtonItem = shareButton
    }

    
    @objc func handleShare() {
        
        let avc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        avc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(avc, animated: true, completion: nil)
    }
}
