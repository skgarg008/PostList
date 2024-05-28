//
//  PostListVC.swift
//  PostList
//
//  Created by Sajan Kumar on 28/05/24.
//

import UIKit

class PostListVC: UIViewController {
    
    //MARK:- ====== Outlet ======
    @IBOutlet weak var tableView: UITableView!
    //MARK:- ====== Variables ======
    var objVModel = PostListViewModel()
    var error: String = ""
    var arrayPost: [PostTableViewCellViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK:- ====== Life Cycle ======
    override func viewDidLoad() {
        super.viewDidLoad()
        objVModel.loadPage()
        objVModel.blockUpdate = {
            [weak self] list, error in
            self?.error = error
            self?.arrayPost = list
        }
        tableView.sectionHeaderTopPadding = 0
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
    }
    
    //MARK:- ====== Functions ======

}

extension PostListVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPost.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else {
            fatalError("Failed to load cell")
        }
        cell.objVModel = arrayPost[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = arrayPost[indexPath.row]
        let newView = self.storyboard?.instantiateViewController(withIdentifier: "PostBodyVC") as! PostBodyVC
        newView.objVModel = post
        navigationController?.pushViewController(newView, animated: true)

        
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if !error.isEmpty {
            return error
        }
        print("SK qwertyui")
        objVModel.loadPage(paging: true)
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if !error.isEmpty {
            return 0
        }
        return 44
    }
    
}
