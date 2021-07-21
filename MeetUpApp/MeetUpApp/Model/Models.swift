//
//  Models.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 18/07/2021.
//

import Foundation

struct Result: Codable {
    let newsData: [ResultItem]
    var eventsData: [ResultItem]
}

struct ResultItem: Codable {
    var image: String
    var time: String
    var title: String
    var description: String
    var status: Int = 0
}
