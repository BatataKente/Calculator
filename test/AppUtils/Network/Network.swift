//
//  Network.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import Foundation

struct Network {
    
    static func request(escape: @escaping (Data) -> Void) {
        
        let url = URL(string: "https://api.adviceslip.com/advice")
        
        guard let url = url else {return}
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let response = response {print("RESPONSE: \n\n\(response)\n")}
            
            if let data = data,
               let advice = try? JSONDecoder().decode(Data.self, from: data) {
                
                DispatchQueue.main.async {
                    
                    escape(advice)
                }
            }
            
            if let error = error {print("ERROR: \n\n\(error)\n")}
        }.resume()
    }
}
