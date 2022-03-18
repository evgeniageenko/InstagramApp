//
//  ListingControllerModell.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 3.06.21.
//

import UIKit


struct CommentModel {
    let commentOwner: String
    let commentText: String
    var attributedDescriptionComment: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: commentOwner, attributes: [.font : UIFont.boldSystemFont(ofSize:  17.0)])

        attributedString.append(NSAttributedString(string: " \(commentText)", attributes: [.font : UIFont.systemFont(ofSize:  17.0, weight: .light)]))
        
        return attributedString
    }
}


//Данные, которые добавляем в UI
class ListingModel {
    let profileTitle: String
    let profileImage: UIImage
    let listingImage: UIImage
    let description: String
    var statistics: (like: Int, views: Int)
    var isLiked: Bool
    var isExpanded: Bool
    let identifier: Int
    var isBookmarked: Bool
    var comments: [CommentModel]
    var commentsShowed: Bool = false
    var attributedDescription: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: profileTitle,
                                                         attributes: [.font : UIFont.systemFont(ofSize: 13.0, weight: .medium)])
        
        attributedString.append(NSAttributedString(string: " \(description)",
                                                   attributes: [.font : UIFont.systemFont(ofSize: 13.0)]))
        
        return attributedString
    }
    
    var numberComments: Int {
        return comments.count
    }
    
    var attributedComments: NSAttributedString {
        let string = NSMutableAttributedString(string: "")
        for comment in comments {
            let attributedString = NSMutableAttributedString(string: comment.commentOwner,
                                                             attributes: [.font: UIFont.systemFont(ofSize: 13.0, weight: .medium)])
            attributedString.append(NSAttributedString(string: " \(comment.commentText)",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 13.0, weight: .light)]))
            attributedString.append(NSAttributedString(string: "\n",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 13.0, weight: .light)]))
            
            string.append(attributedString)
        }
        return string
    }

    init(profilTitle: String, profilImage: UIImage, listingImage: UIImage, description: String, statistics: (like: Int, views: Int), isLiked: Bool, isExpanded: Bool, identifier: Int, isBookmarked: Bool, comments: [CommentModel]) {
        
        self.profileTitle = profilTitle
        self.profileImage = profilImage
        self.listingImage = listingImage
        self.description = description
        self.statistics = statistics
        self.isLiked = isLiked
        self.isExpanded = isExpanded
        self.identifier = identifier
        self.isBookmarked = isBookmarked
        self.comments = comments
        
    }
}


