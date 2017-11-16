//
//  HomeTableViewController.swift
//  Aplikasi Berita
//
//  Created by Muhammad Hilmy Fauzi on 14/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeTableViewController: UITableViewController {
    
    var judulSelected:String?
    var isiSelected:String?
    //  var gambarSelcetd:String?
    
    var arrRes = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //memanggil data json menggunakan alamofire
        Alamofire.request("http://localhost/ServerBerita/index.php/api/getBerita").responseJSON { (response) in
            
            //check response
            if response.result.isSuccess {
                //kalau respon sukses kita ambil json
                let json = JSON(response.result.value as Any)
                //get jsonArray dari json Diatas
                self.arrRes = json["List Berita"].arrayObject as! [[String : AnyObject]]
                //check di log
                //print(self.arrayBerita)
                
                //check jumlah array
                if(self.arrRes.count > 0){
                    //refresh table view
                    self.tableView.reloadData()
                }
            }else{
                print("Error Server")
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrRes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        var dict = arrRes[indexPath.row]
        let dictJudul = dict["judul"]
        cell.lblJudul.text = dictJudul as? String
        //    cell.labelgambar.image = dict["gambar"] as! String
        
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arrRes[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        judulSelected = task["judul"] as? String
        isiSelected = task["isi_berita"] as? String
        
        
        
        
        
        
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "PassData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "PassData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! FirstViewController
                let value = arrRes[indexPath.row]
                controller.passJudul = value["judul"] as? String
                controller.passIsi = value["isi_berita"] as? String
                // controller.passgambar = value["gambar"] as? UIImage
            }
        }
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
}
