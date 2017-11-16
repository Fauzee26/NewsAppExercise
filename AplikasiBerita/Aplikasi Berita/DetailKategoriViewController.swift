//
//  DetailKategoriViewController.swift
//  Aplikasi Berita
//
//  Created by Muhammad Hilmy Fauzi on 15/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DetailKategoriViewController: UIViewController {

    @IBOutlet weak var lblJudul: UILabel!
    @IBOutlet weak var lblIsi: UILabel!
    
    var passJudull:String?
    //    var passGambar:String?
    var passIsii:String?
    override func viewDidLoad() {
        
        lblJudul.text = passJudull!
        //        labelImage.text = passGambar!
        lblIsi.text = passIsii!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
