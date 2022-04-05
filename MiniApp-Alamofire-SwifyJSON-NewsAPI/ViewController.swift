//
//  ViewController.swift
//  MiniApp-Alamofire-SwifyJSON-NewsAPI
//
//  Created by 近藤米功 on 2022/04/05.
//

import UIKit

class ViewController: UIViewController,CatchNewsDataDelegate {
    

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var indexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var urlToImageLabel: UILabel!
    var requestNewsData = RequestNewsData()
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsData.delegate = self
    }

    @IBAction func requestButton(_ sender: Any) {
        let searchWord = searchTextField.text ?? ""
        requestNewsData.request(index: indexSegmentedControl.selectedSegmentIndex, searchWord: searchWord)
    }
    func catchNewsData(title: String, url: String, urlToImage: String, publishedAt: String) {
        titleLabel.text = title
        urlLabel.text = url
        urlToImageLabel.text = urlToImage
        publishedAtLabel.text = publishedAt
    }
    
}

