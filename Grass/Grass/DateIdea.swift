//
//  DateIdea.swift
//  Grass
//
//  Created by Josh Chapman on 2/7/26.
//

import Foundation

struct DateIdea: Decodable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let description: String?
    let location_name: String?
    let created_at: Date
}


