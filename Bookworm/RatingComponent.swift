//
//  RatingComponent.swift
//  Bookworm
//
//  Created by Grace couch on 02/10/2024.
//

import SwiftUI

struct RatingComponent: View {
    @Binding var rating: Int

    var offColor = Color.gray
    var onColor = Color.yellow

    var maxRating = 5
    var label = ""

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")


    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maxRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maxRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }

    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingComponent(rating: .constant(4))
}
