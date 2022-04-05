//
//  RequestNewsData.swift
//  MiniApp-Alamofire-SwifyJSON-NewsAPI
//
//  Created by 近藤米功 on 2022/04/05.
//

import Foundation
import Alamofire
import SwiftyJSON
protocol CatchNewsDataDelegate{
    func catchNewsData(title: String,url: String,urlToImage: String,publishedAt: String)
}
class RequestNewsData{
    var delegate: CatchNewsDataDelegate?
    var newsDataArray = [NewsData]()
    func request(index: Int,searchWord: String){
        let urlString = "https://newsapi.org/v2/top-headlines?country=jp&category=\(searchWord)&apiKey=2dadbe9531074cfe86934358180c7e24"
        //エンコード
        let encorderUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //Alamofireによるリクエストを投げて、レスポンスをもらう
        AF.request(encorderUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result{
            case .success:
                do{
                    //レスポンスデータをJSON形式として受け取る
                    let json:JSON = try JSON(data: response.data!)
                    
                    if let title = json["articles"][index]["title"].string,let url = json["articles"][index]["url"].string,let urlToImage = json["articles"][index]["urlToImage"].string,let publishedAt = json["articles"][index]["publishedAt"].string{
                        let titleData = title
                        let urlData = url
                        let urlToImageData = urlToImage
                        let publishedAtData = publishedAt
                        self.delegate?.catchNewsData(title: titleData, url: urlData, urlToImage: urlToImageData, publishedAt: publishedAtData)
                        }
                }
                catch{
                    print("取得失敗")
                }
            case .failure(_):
                print("失敗")
            }
        }// AF.requestここまで
    }
}
