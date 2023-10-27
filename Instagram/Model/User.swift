//
//  User.swift
//  Instagram
//
//  Created by Y K on 20.10.2023.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "batman", fullname: "Bruce Wayne", bio: "Gotham Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Venom", profileImageUrl: "venom1", fullname: "Jordan Bucks", bio: "Make Some Bucks", email: "venom1@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Brandon", profileImageUrl: "venom2", fullname: "Michael Popius", bio: "Pop it , Pop it on", email: "venom2@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Brandy", profileImageUrl: "venom3", fullname: "Wayne Wilky", bio: "Fine Art and Whisky", email: "venom3@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Iron", profileImageUrl: "ironman", fullname: "Ian Bremann", bio: "Iron your life", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Spider", profileImageUrl: "spiderman", fullname: nil, bio: "Hue, Contrast and Light", email: "spiderman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Beardman", profileImageUrl: "batman2", fullname: "Mickey Berns", bio: "Mickey Mouse and Tom", email: "batman2@gmail.com")
    ]
}
