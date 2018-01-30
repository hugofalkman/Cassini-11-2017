//
//  ImageViewController.swift
//  Cassini-11-2017
//
//  Created by H Hugo Falkman on 2018-01-30.
//  Copyright © 2018 H Hugo Falkman. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL{
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
}






