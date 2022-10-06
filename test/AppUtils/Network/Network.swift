//
//  Network.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import Foundation

struct Network {
    
    static func request() {
        
        let url = URL(string: "https://api.adviceslip.com/advice")
        
        guard let url = url else {return}
        URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            
            if let response = response {print(response)}
            if let data = data {print(data)}
            if let error = error {print(error)}
        }
    }
}
