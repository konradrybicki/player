//
//  TrackView.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import SwiftUI

struct TrackView: View {
    private struct Constants {
        static let horizontalSpacing: CGFloat = 15
        static let verticalSpacing: CGFloat = 2
        static let placeholderImageSystemName = "photo.fill"
        static let playImageSystemName = "play.fill"
    }

    let viewModel: TrackViewModel
    let isPlaying: Bool

    var body: some View {
        HStack(spacing: Constants.horizontalSpacing) {
            trackImage
            VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
                if isPlaying {
                    HStack {
                        playImage
                        titleText
                    }
                } else {
                    titleText
                }
                subtitleText
            }
            Spacer()
        }
    }
}

// MARK: Subviews

private extension TrackView {
    var trackImage: some View {
        AsyncImage(url: viewModel.imageUrl, content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: Sizes.imageSizeMedium)
        }) {
            Image(systemName: Constants.placeholderImageSystemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Sizes.imageSizeMedium)
                .frame(height: Sizes.imageSizeMedium)
                .foregroundStyle(.secondary)
        }
    }

    var playImage: some View {
        Image(systemName: Constants.playImageSystemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Sizes.imageSizeSmall)
            .frame(height: Sizes.imageSizeSmall)
            .foregroundStyle(.accent)
    }

    var titleText: some View {
        Text(viewModel.title)
            .font(.system(size: Sizes.fontSizeMedium))
            .foregroundStyle(isPlaying ? .accent : .primary)
    }

    var subtitleText: some View {
        Text(viewModel.subtitle)
            .font(.system(size: Sizes.fontSizeSmall))
            .foregroundStyle(.secondary)
    }
}

#Preview {
    VStack(spacing: Sizes.padding) {
        TrackView(viewModel: TrackListMock.noImageTrack, isPlaying: false)
        TrackView(viewModel: TrackListMock.tracklist[0], isPlaying: true)
    }
    .padding(.horizontal, Sizes.padding)
}
