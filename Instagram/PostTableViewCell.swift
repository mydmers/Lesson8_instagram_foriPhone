//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by yosi on 2018/02/25.
//  Copyright © 2018年 mydmers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var CommentMaker: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var poster: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        
//------------------------------------------------------------------------------
        var commentText = ""
        var posterText = ""
        var combinedText = ""
        for i in postData.comments! {
            posterText = "\(String(describing: postData.posters?[index(ofAccessibilityElement: poster)]))"
            commentText = "\(postData.comments!)"
            combinedText += "\(posterText) : \(commentText)\n"
            self.comment.text = combinedText + "\n"
            combinedText = ""
        }
//        self.comment.text = combinedText
        
        /*        if let poster = postData.posters {
            self.poster.text = "\(poster)"
        } */
        
/*        let name = Auth.auth().currentUser?.displayName
        self.poster.text = name
        
        if let comment = postData.comments {
            self.comment.text = "\(comment)"
        }*/
        
/*        var posterText = ""
        for poster in postData.posters! {
            posterText += "\(poster)\n"
        }
        self.poster.text = posterText
        
        if let comment = postData.comments {
            self.comment.text = "\(comment)"
        }
        
        if let poster = postData.posters {
            self.poster.text = "\(poster)"
        }*/

//*-------------------------------------------------------------------------
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyMMdd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
    }
}
