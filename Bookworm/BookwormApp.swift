//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Grace couch on 01/10/2024.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
}
