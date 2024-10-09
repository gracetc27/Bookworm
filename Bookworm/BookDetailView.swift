//
//  BookDetailView.swift
//  Bookworm
//
//  Created by Grace couch on 02/10/2024.
//
import SwiftData
import SwiftUI

struct BookDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false

    let book: Book

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()

                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            Text(book.date.formatted(.dateTime.day().month().year()))
                .padding()
                .font(.headline)
            RatingComponent(rating: .constant(book.rating))
                .font(.largeTitle)
                .padding()
            Text(book.review)
                .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "hi", author: "grace", genre: "Horror", review: "great book", rating: 4, date: Date.now)
        return BookDetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("error loading preview \(error.localizedDescription)")
    }
}

