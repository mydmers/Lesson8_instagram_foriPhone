//
//  CommentViewController.swift
//  Instagram
//
//  Created by yosi on 2018/03/04./Users/yosi/Google_Drive/TechAcademy/ウケ放題/iPhoneアプリ/Lesson8/Instagramp/Instagram.xcodeproj
//  Copyright © 2018年 mydmers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {
    @IBOutlet weak var Comment: UITextView!
    @IBOutlet weak var Poster: UITextField!
    
    var postData: PostData!

    @IBAction func OK(_ sender: Any) {
        
        // 増えたcommentとposterをFirebaseに保存する
        let postRef2 = Database.database().reference().child(Const.PostPath).child(postData.id!)

        if let commentText = Comment.text {
            let name = Auth.auth().currentUser?.displayName
            postData.comments?.append("\(name!):\(commentText)")
            postRef2.updateChildValues(["comments": postData.comments!])
        }
        
        //前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCommentData(postData: PostData) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
