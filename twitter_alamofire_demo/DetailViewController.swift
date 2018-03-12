//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Adrian Martinez on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var tweet: Tweet!

    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tweet = tweet {
            reloadData()
            
        }
    }

    @IBAction func onBackClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func reloadData(){
        tweetTextLabel.text = tweet.text
        let url = URL(string: tweet.user.profileImage!)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        userImageView.image = UIImage(data: data!)
//        favoriteCountLabel.text = "\(tweet.favoriteCount!)"
//        retweetCountLabel.text = String(describing: tweet.retweetCount)
        name.text = tweet.user.name
        userName.text = tweet.user.screenName
//        setFavIcon()
    }
    


}
