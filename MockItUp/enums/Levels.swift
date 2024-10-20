//
//  Levels.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation

enum Levels: String, CaseIterable, Identifiable {
    case easy, medium, hard
    var id: Self { self }
}
