//
//  VideoAPI.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 8/9/21.
//

import SwiftUI

struct videoPosts: Codable
{
    var items: [videoPost]
}

struct videoPost: Codable, Identifiable, Hashable {
    var id: String
    var url: String
    var title: String
    var content_text: String
    
}

class VideoAPI {


    func getItems(completion: @escaping ([videoPost]) -> ()) {
        guard let url = URL(string: "https://blackmothersunited.org/category/video/feed/json") else { return }
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
     
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //Ensure there is no error for this HTTP response
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            //Ensure there is data returned from this HTTP response
            guard let data = data else {
                print("No data")
                return
            }
            
            //Faulty JSON
            guard  let video_postlist = try? JSONDecoder().decode(videoPosts.self, from: data)
           
            else {
                
                print("Error: Couldn't decode data into items array")
                return
            }
          
            
            DispatchQueue.main.async {
                let video_posts = video_postlist.items
                completion(video_posts)
            }
            
            
        }
        .resume()
    }
}

