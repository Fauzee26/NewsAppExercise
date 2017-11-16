//
//  BeritaKategoriTableViewCell.swift
//  Aplikasi Berita
//
//  Created by Muhammad Hilmy Fauzi on 14/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class BeritaKategoriTableViewCell: UITableViewCell {
    @IBOutlet weak var labelJudul: UILabel!
    @IBOutlet weak var labelIsi: UILabel!
    @IBOutlet weak var labelKategori: UILabel!
    @IBOutlet weak var imgBerita: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
