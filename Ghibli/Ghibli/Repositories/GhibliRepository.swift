//
//  GhibliRepository.swift
//  Ghibli
//
//  Created by Bryan van Lierop on 31/05/2019.
//  Copyright © 2019 Ylja van Son. All rights reserved.
//

import Foundation

class GhibliRepository {
    static func load(completion: @escaping ([Ghibli]) -> (), fail: @escaping (String)->()) {
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
        
        let task = URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            guard let data = data, error == nil else {
                print (error ?? "Unkown error")
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Array<Ghibli>.self, from: data)
                completion(response)
            } catch {
                fail(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}

