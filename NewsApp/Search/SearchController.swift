//
//  SearchController.swift
//  NewsApp
//
//  Created by pervın on 08.06.23.
//

import UIKit

class SearchController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    @IBOutlet weak var textfield: UITextField!

    @IBOutlet weak var collection: UICollectionView!
    
//    var data = [String]()
//    var filteredData = [String]()
    
    let viewModel = SearchViewModel()
    
    private let cellId = "\(SearchCell.self)"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"

//        tableView.dataSource = self
//        tableView.delegate = self
        configureViewModel()
        configreUI()
        
        viewModel.successCallback = {
                    self.collection.reloadData()
                }
    }
    
    func configreUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    func configureViewModel() {
        viewModel.successCallback = {
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        }
    }
    
    @IBAction func textFieldTyping(_ sender: Any) {
        if let text = textfield.text, !text.isEmpty {
            viewModel.searchText(text: textfield.text ?? "")
        } else {
            viewModel.search.removeAll()
            collection.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        cell.configure(data: viewModel.search[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width , height: 150)

//        .init(width: collection.frame.width, height: 250)
    }
}

