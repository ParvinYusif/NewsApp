//
//  SearchController.swift
//  NewsApp
//
//  Created by pervın on 08.06.23.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var data = [String]()
    var filteredData = [String]()
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
//        tableView.delegate = self
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel.successCallback = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func textFieldTyping(_ sender: Any) {
        if let text = textfield.text, !text.isEmpty {
            viewModel.searchText(text: text)
        } else {
            viewModel.items.removeAll()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
