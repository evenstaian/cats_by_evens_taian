//
//  APISettings.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import Foundation

struct Constants {
    static let baseURL = URL(string: "https://api.imgur.com/3/gallery/search/?q=cats&q_type=jpg")!
    static let authenticationHeaders = ["authorization"]
}

