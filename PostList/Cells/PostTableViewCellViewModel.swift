//
//  PostTableViewCellViewModel.swift
//  PostList
//
//  Created by Sajan Kumar on 28/05/24.
//

import UIKit
import Foundation

class PostTableViewCellViewModel {
    var id: String?
    var title: String?
    var body: String?
    
    init(_ post: Post) {
        id = "\(post.id ?? 0)"
        title = post.title
        body = post.body
    }
}
