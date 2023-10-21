//
//  Post.swift
//  Instagram
//
//  Created by Y K on 21.10.2023.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    // Identifiable requires to use of id
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "My best part of life is here to begin with",
              likes: 123,
              imageUrl: "batman",
              timestamp: Date(),
              user: User.MOCK_USERS[0]
             ),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "You shall not pass my post ad like ASAP",
              likes: 213,
              imageUrl: "batman2",
              timestamp: Date(),
              user: User.MOCK_USERS[6]
             ),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Where is my cash? ",
              likes: 486,
              imageUrl: "ironman",
              timestamp: Date(),
              user: User.MOCK_USERS[4]
             ),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Spiders are eveyrwhere these days",
              likes: 777,
              imageUrl: "spiderman",
              timestamp: Date(),
              user: User.MOCK_USERS[5]
             ),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Panzerhuabitzer-2000",
              likes: 356,
              imageUrl: "venom1",
              timestamp: Date(),
              user: User.MOCK_USERS[1]
             ),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Raka maka foh",
              likes: 456,
              imageUrl: "venom2",
              timestamp: Date(),
              user: User.MOCK_USERS[2]
             ),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Poisonous love in the nutshell",
              likes: 999,
              imageUrl: "venom3",
              timestamp: Date(),
              user: User.MOCK_USERS[3]
             ),
    ]
}
