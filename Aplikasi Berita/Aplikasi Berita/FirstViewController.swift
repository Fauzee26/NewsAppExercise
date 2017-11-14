//
//  FirstViewController.swift
//  Aplikasi Berita
//
//  Created by Muhammad Hilmy Fauzi on 14/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var labelJudul: UILabel!
//    @IBOutlet weak var labelImage: UIImageView!
    @IBOutlet weak var labelIsi: UILabel!
    
    var passJudul:String?
//    var passGambar:String?
    var passIsi:String?
    
    override func viewDidLoad() {
        
        labelJudul.text = passJudul!
//        labelImage.text = passGambar!
        labelIsi.text = passIsi!
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

