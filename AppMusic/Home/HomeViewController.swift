//
//  ViewController.swift
//  AppMusic
//
//  Created by Jadiê on 13/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeViewScreen?
    
    override func loadView() {
        self.screen = HomeViewScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.configTableViewProtocols(delegate: self, datasource: self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}

