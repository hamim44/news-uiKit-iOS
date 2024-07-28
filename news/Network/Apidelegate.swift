//
//  Apidelegate.swift
//  news
//
//  Created by Abrar Hamim on 27/7/24.
//

import Foundation


struct Apidelegate {
    func fatchData(complition: @escaping([Post]) -> Void) {

        let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                return
                
            }
            
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else {
                return
            }
            
            if let data = data {
                do{
                    let newsData = try JSONDecoder().decode(NewsModel.self, from: data)
                        complition(newsData.hits)
                    
                } catch {
                    print(error)
                }
            }
            
        }.resume()
    }
}
