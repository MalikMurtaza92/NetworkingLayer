//
//  ViewController.swift
//  NetworkingLayer
//
//  Created by Murtaza Mehmood on 25/12/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Products"
        let networking: Networking = URLSessionNetworking()
        viewModel = ViewModel(networkService: networking)
        setupTable()
        fetchProducts()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    func fetchProducts() {
        viewModel.fetchProducts {[weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let product = viewModel.products[indexPath.row]
        cell.configure(image: product.thumbnail ?? "", title: product.title ?? "", description: product.description ?? "", price: product.price ?? 0.0)
        return cell
        
    }
}
