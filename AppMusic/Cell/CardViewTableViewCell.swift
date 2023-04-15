//
//  CardViewTableViewCell.swift
//  AppMusic
//
//  Created by Jadiê on 15/04/23.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    static let identifier:String = "CardViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
