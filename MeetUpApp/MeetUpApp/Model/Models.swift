//
//  Models.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 18/07/2021.
//

import Foundation

struct Result: Codable {
    let newsData: [ResultItem]
    let eventsData: [ResultItem]
}

struct ResultItem: Codable {
    let image: String
    let time: String
    let title: String
    let description: String
}
