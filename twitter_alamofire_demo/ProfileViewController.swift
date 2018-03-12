//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Adrian Martinez on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var folowingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var profileSayingLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User.current
        print(user?.followingCount)
        if let followerString = user?.followersCount{
            followerCountLabel.text = "\(followerString) followers"
        }
        if let followingString = user?.followingCount{
            folowingCountLabel.text = "\(followingString) following"

        }
        if let tweetCountString = user?.tweetsCount{
            tweetCountLabel.text = "\(tweetCountString) tweets"

        }
        profileSayingLabel.text = user?.saying
        usernameLabel.text = user?.screenName
        nameLabel.text = user?.name
        let urlString = user?.backgroundImageURL
        if let urlString2 = urlString{
            let url = URL(string: (urlString2))
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            backgroundImageView.image = UIImage(data: data!)
        }
        
        let url2 = URL(string: (user?.profileImage)!)
        let data2 = try? Data(contentsOf: url2!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        profileImageView.image = UIImage(data: data2!)
        // Do any additional setup after loading the view.
    }


}
