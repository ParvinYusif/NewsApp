//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by pervın on 03.06.23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
//static let identifier = "NewsTableViewCell"
    
    private let newsTitleLable: UILabel = {
      let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
      let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLable)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsTitleLable.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width - 170, height: 70)
        
        subtitleLabel.frame = CGRect(x: 5, y: 60, width: contentView.frame.size.width - 170, height: contentView.frame.size.height/2)
        
        newsImageView.frame = CGRect(x: contentView.frame.size.width - 160, y: 5, width: 140, height: contentView.frame.size.height - 10)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLable.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.imageUrl {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data 
                DispatchQueue.main.sync {
                    self?.newsImageView.image = UIImage(data: data)

                }
            }.resume()
        }
    }
}
