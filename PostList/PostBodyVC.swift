//
//  PostBodyVC.swift
//  PostList
//
//  Created by Sajan Kumar on 28/05/24.
//

import UIKit

class PostBodyVC: UIViewController {
    
    //MARK:- ====== Outlet ======
    @IBOutlet weak var txtView: UITextView!
    
    //MARK:- ====== Variables ======
    var objVModel: PostTableViewCellViewModel?
    
    //MARK:- ====== Life Cycle ======
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.text = objVModel?.body
    }
    
    //MARK:- ====== Functions ======

}
