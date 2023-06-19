//
//  HomeController.swift
//  NewsApp
//
//  Created by pervın on 03.06.23.
//

import UIKit
import SafariServices

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collection: UICollectionView!
    
    private var articles = [Article]()
    
    var viewModel = HomeViewModel()

//    private var viewModel = [NewsTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        
        collection.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        configeViewModel()
}
    
    func configeViewModel() {
        viewModel.mostPopular()
        viewModel.succesCallBack = {
            self.collection.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.mostPopularItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.configure(data: viewModel.mostPopularItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.mostPopularItems[indexPath.row]
        guard let url = URL(string: article.url ?? "") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collection.frame.width, height: 150)
    }
}
