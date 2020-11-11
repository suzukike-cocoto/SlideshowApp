//
//  SelectImageViewController.swift
//  SlideshowApp
//
//  Created by 鈴木啓弥 on 2020/11/10.
//

import UIKit

class SelectImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var image :UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
    }

    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
