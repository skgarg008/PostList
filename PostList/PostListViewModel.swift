//
//  PostTableViewCellViewModel.swift
//  PostList
//
//  Created by Sajan Kumar on 28/05/24.
//

import UIKit
import Foundation

class PostListViewModel {
    var arrayPost: [PostTableViewCellViewModel] = []
    var apiRequest = ApiHelper("https://jsonplaceholder.typicode.com/posts")
    var page = 0
    var blockUpdate: ((_ list: [PostTableViewCellViewModel], _ error: String) -> ())?
    
    func loadPage(paging: Bool = false) {
        let newPage = paging ? page+1 : 1
        apiRequest.fetchList(page: newPage) {
            [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let list):
                if list.isEmpty {
                    
                    return
                }
                page = newPage
                var newlist: [PostTableViewCellViewModel] = []
                if newPage > 1 {
                    newlist = self.arrayPost
                }
                newlist += list.map({ PostTableViewCellViewModel($0) })
                self.arrayPost = newlist
                blockUpdate?(self.arrayPost, "")
                
            case .failure(let error):
                if newPage == 1 {
                    blockUpdate?([], error.localizedDescription)
                }
            }
        }
    }
}
