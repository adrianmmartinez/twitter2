//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Adrian Martinez on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//
protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)

}


import UIKit
import RSKPlaceholderTextView


class ComposeViewController: UIViewController, UITextViewDelegate {
    
    weak var delegate: ComposeViewControllerDelegate?
    
    @IBOutlet weak var characterCountLabel: UILabel!
    var textView = RSKPlaceholderTextView()
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.textView = RSKPlaceholderTextView(frame: CGRect(x: 100, y: 100, width: self.view.frame.width - 105, height: 100))
        self.textView.placeholder = "What's Happening?"
//        self.textView.placeholderColor = UIColor.black
        self.mainView.addSubview(textView)
        self.textView.delegate = self
        
    }

    @IBAction func didPressSend(_ sender: Any) {
        
        if let tweetText = self.textView.text {
            APIManager.shared.composeTweet(with: tweetText) { (tweet, error) in
                if let error = error {
                    print("Error composing Tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    self.delegate?.did(post: tweet)
                    print("Compose Tweet Success!")
                    self.dismiss(animated: true)
                }
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        characterCountLabel.text = "\(characterLimit - textView.text.count-1)"
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
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
