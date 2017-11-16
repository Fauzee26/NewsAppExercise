//
//  BeritaKategoriTableViewController.swift
//  Aplikasi Berita
//
//  Created by Muhammad Hilmy Fauzi on 14/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
//import AlamofireImage
import Alamofire
import SwiftyJSON

class BeritaKategoriTableViewController: UITableViewController {
    var judulSelected:String?
    var isiSelected:String?
    //deklarasi variabel untuk menampung id yang dikirim
    var nampungId : String? = nil
    var arrayberita = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("id +" + nampungId!)
        
        let params = ["id_kategori" : nampungId!]
        let url = "http://localhost/ServerBerita/index.php/api/getBeritaByIdKategori"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            //check response
            if response.result.isSuccess {
                let json = JSON(response.result.value as Any)
                print(json)
                self.arrayberita = json["List Berita"].arrayObject as! [[String : String]]
                
                if(self.arrayberita.count > 0){
                    self.tableView.reloadData()
                }
            }else{
                print("Error Server")
            }
        })
        
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
        return arrayberita.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeritaKategori", for: indexPath) as! BeritaKategoriTableViewCell
        
        var serverid = arrayberita[indexPath.row]
        
        var id = serverid["id_berita"]
        let judul = serverid["judul"]
        let nama_kategori = serverid["nama_kategori"]
        let isiBerita = serverid["isi_berita"]

        //pindahkan ke cell
        cell.labelJudul.text = judul
        cell.labelIsi.text = isiBerita
        cell.labelKategori.text = nama_kategori
        
        return cell
    }

override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    //mengecek data yang dikirim
    print("Row \(indexPath.row)selected")
    
    let task = arrayberita[indexPath.row]
    
    //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
    judulSelected = task["judul"] as? String
    isiSelected = task["isi_berita"] as? String

    performSegue(withIdentifier: "segue", sender: self)
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //mengecek apakah segue nya ada atau  tidak`
    if segue.identifier == "segue"{
        //kondisi ketika segue nya ada
        //mengirimkan data ke detailViewController
        //        let kirimData = segue.destination as! KontakViewController
        //mengirimkan data ke masing2 variable
        //mengirimkan nama wisata
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! DetailKategoriViewController
            let value = arrayberita[indexPath.row]
            controller.passJudull = value["judul"] as? String
            controller.passIsii = value["isi_berita"] as? String
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

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
