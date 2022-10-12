//
//  Post.swift
//  SingletonVsDI
//
//  Created by Joan Wilson Oliveira on 09/10/22.
//   let posts = try? newJSONDecoder().decode(Posts.self, from: jsonData)

// MARK: - Post
import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
