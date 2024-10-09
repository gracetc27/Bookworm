//
//  Book.swift
//  Bookworm
//
//  Created by Grace couch on 01/10/2024.
//

import SwiftData
import SwiftUI


@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date

    var bookIsValid: Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty || rating.isMultiple(of: 1) == false {
            return false
        } else {
            return true
        }
    }

    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }

    convenience init() {
        self.init(title: "", author: "", genre: "Thriller", review: "", rating: 0, date: Date.now)
    }
}
