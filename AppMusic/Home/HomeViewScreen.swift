//
//  HomeViewScreen.swift
//  AppMusic
//
//  Created by Jadiê on 13/04/23.
//

import UIKit

class HomeViewScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableView)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate:UITableViewDelegate, datasource:UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
    }
    
    private func setUpConstraints() {
        self.tableView.pin(to: self)
    }
    
}
