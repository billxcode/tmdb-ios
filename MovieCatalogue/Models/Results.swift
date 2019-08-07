//
//  Results.swift
//  MovieCatalogue
//
//  Created by Bill Tanthowi Jauhari on 06/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let vote_count: Int
    let title: String
    let vote_average: Double
    let release_date: String
    let overview: String
}
