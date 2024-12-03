//
//  ErrorView.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import SwiftUI

struct ErrorView: View {
    private struct Constants {
        static let errorDescription = "An error occured"
        static let errorImageSystemName = "exclamationmark.triangle.fill"
        static let refreshButtonTitle = "Try again"
        static let refreshButtonSize: CGSize = .init(width: 130, height: 35)
        static let spacing: CGFloat = 50
    }

    var errorDescription = Constants.errorDescription
    let refreshAction: Closure

    var body: some View {
        VStack(spacing: Constants.spacing) {
            errorImage
            errorDescriptionText
            refreshButton
        }
    }
}

// MARK: Subviews

private extension ErrorView {
    var errorImage: some View {
        Image(systemName: Constants.errorImageSystemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Sizes.imageSizeBig)
            .frame(height: Sizes.imageSizeBig)
    }

    var errorDescriptionText: some View {
        Text(errorDescription)
            .font(.system(size: Sizes.fontSizeMedium))
            .padding(.horizontal, Sizes.padding)
            .multilineTextAlignment(.center)
    }

    var refreshButton: some View {
        Button {
            refreshAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: Sizes.cornerRadius)
                    .frame(width: Constants.refreshButtonSize.width)
                    .frame(height: Constants.refreshButtonSize.height)
                    .foregroundStyle(.primary)
                Text(Constants.refreshButtonTitle)
                    .font(.system(size: Sizes.fontSizeMedium))
                    .foregroundStyle(.background)
                    .bold()
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ErrorView(refreshAction: { print("Try again") })
}
