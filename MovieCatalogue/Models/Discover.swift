//
//  Discover.swift
//  MovieCatalogue
//
//  Created by Bill Tanthowi Jauhari on 06/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import Foundation

struct Discover: Decodable{
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Results]
}
