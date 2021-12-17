//
//  functions.swift
//  The Feline Order
//
//  Created by Alex Gonzalez on 12/15/21.
//

import SwiftyJSON
import Foundation
import SwiftUI


class apiCall {
    func getCharacters(completion:@escaping (JSON) -> ()) {
        guard let url = URL(string: "https://duet-public-content.s3.us-east-2.amazonaws.com/project.json") else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        var request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            // Do something...
            let json = try? JSON(data: data!)
            
            let jsondata = json!["results"]
            
            
            
            
            DispatchQueue.main.async {
                            completion(jsondata)
                        }
            
        }

        task.resume()

    }
}



func shareSheet(link: String) {
          guard let urlShare = URL(string: link) else { return }
          let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
    activityVC.isModalInPresentation = true

          UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
      }

