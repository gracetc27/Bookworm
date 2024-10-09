//
//  AddBookView.swift
//  Bookworm
//
//  Created by Grace couch on 01/10/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var book = Book()

    var genres = ["Fantasy", "Horror", "Kids", "Romance", "Mystery", "Poetry", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Book details") {
                    TextField("Book title", text: $book.title)
                    TextField("Author's name", text: $book.author)

                    Picker("Select genre", selection: $book.genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Add review") {
                    RatingComponent(rating: $book.rating)
                    TextEditor(text: $book.review)
                }
            }
            .navigationTitle("Add Book")
            .toolbar {
                Button("Save") {
                    modelContext.insert(book)
                    dismiss()
                }
                .disabled(book.bookIsValid == false)
            }
        }
    }
}


#Preview {
    AddBookView()
}
