//
//  BlogAPI.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/25/21.
//

import SwiftUI

struct Posts: Codable
{
    var items: [Post]
}

struct Post: Codable, Identifiable, Hashable {
    var id: String
    var url: String
    var title: String
    var content_text: String
    var image: String
    
}

class BlogAPI {


    func getItems(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://blackmothersunited.org/category/blog/feed/json") else { return }
        
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
            guard  let postlist = try? JSONDecoder().decode(Posts.self, from: data)
           
            else {
                
                print("Error: Couldn't decode data into items array")
                return
            }
          
            
            DispatchQueue.main.async {
                let posts = postlist.items
                completion(posts)
            }
            
            
        }
        .resume()
    }
}

