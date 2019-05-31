//
//  Ghibli.swift
//  Ghibli
//
//  Created by Bryan van Lierop on 31/05/2019.
//  Copyright © 2019 Ylja van Son. All rights reserved.
//

import Foundation

struct Ghibli : Codable {
    var title: String
    var description: String
    var rating: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case rating = "rt_score"
    }
}
