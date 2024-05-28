//
//  PostTableViewCell.swift
//  PostList
//
//  Created by Sajan Kumar on 28/05/24. 
//

import UIKit

class PostTableViewCell: UITableViewCell {

    //MARK:- ====== Variables ======
    var objVModel: PostTableViewCellViewModel? {
        didSet {
            loadData()
        }
    }
    
    //MARK:- ====== Life Cycle ======
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK:- ====== Functions ======
    func loadData() {
        textLabel?.text = objVModel?.id
        detailTextLabel?.text = objVModel?.title
    }
}
