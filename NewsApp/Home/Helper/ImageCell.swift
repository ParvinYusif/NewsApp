//
//  ImageCell.swift
//  NewsApp
//
//  Created by pervın on 10.06.23.
//

import UIKit


protocol ImageCellProtocol {
    var titleText: String { get }
    var descriptionText: String { get }
    var imageUrl: String { get }
}

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: ImageCellProtocol) {
        newsTitleLabel.text = data.titleText
        subtitleLabel.text = data.descriptionText
        newsImageView.loadUrl(urlStr: data.imageUrl)
    }
}
