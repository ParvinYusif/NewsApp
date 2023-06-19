//
//  SearchCell.swift
//  NewsApp
//
//  Created by pervın on 15.06.23.
//

import UIKit

protocol SearchProtocol {
    var labeltext: String { get }
    var timetext: String { get }
    var imageUrl: String { get }
}

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: SearchProtocol) {
        label.text = data.labeltext
        image.loadImage( from: data.imageUrl)
        timeLabel.text = data.timetext
    }
    
}
