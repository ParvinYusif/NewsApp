//
//  Image.swift
//  NewsApp
//
//  Created by pervın on 10.06.23.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(urlStr: String) {
        if let url =  URL(string: urlStr) {
            self.sd_setImage(with: url)
        }
    }
            func loadImage(from imageUrl: String) {
                if let url = URL(string: imageUrl) {
                    self.sd_setImage(with: url)
                }
            }
        }
    let imageUrl =  ""

