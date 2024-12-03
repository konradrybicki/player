//
//  TrackListScreen.swift
//  Player
//
//  Created by Konrad Rybicki on 03/12/2024.
//

import SwiftUI

struct TrackListScreen: View {
    private struct Constants {
        static let title = "Player"
    }

    @ObservedObject var trackListViewModel = TrackListViewModel()
    @ObservedObject var audioPlayerViewModel = AudioPlayerViewModel()

    var body: some View {
        VStack {
            titleView
            contentView
        }
        .onAppear {
            refreshTrackList()
        }
    }
}

// MARK: Subviews

private extension TrackListScreen {
    var titleView: some View {
        HStack {
            Text(Constants.title)
                .font(.system(size: Sizes.fontSizeBig))
                .bold()
                .padding([.leading, .top], Sizes.padding)
            Spacer()
        }
    }

    var contentView: some View {
        VStack {
            Spacer()
            switch trackListViewModel.loadingState {
            case .initial, .loading:
                Loader()
            case .success:
                TrackListView(viewModel: trackListViewModel.trackList) { track in
                    play(track: track)
                } refreshAction: {
                    refreshTrackList()
                }
            case .failure:
                ErrorView {
                    refreshTrackList()
                }
            }
            Spacer()
        }
    }
}

// MARK: Actions

private extension TrackListScreen {
    func refreshTrackList() {
        audioPlayerViewModel.stop()
        trackListViewModel.readTrackList()
    }

    func play(track: TrackViewModel) {
        audioPlayerViewModel.load(track: track)
        audioPlayerViewModel.play()
    }
}

#Preview {
    TrackListScreen()
}
