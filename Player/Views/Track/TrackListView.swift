//
//  TrackListView.swift
//  Player
//
//  Created by Konrad Rybicki on 03/12/2024.
//

import SwiftUI

struct TrackListView: View {
    let viewModel: Array<TrackViewModel>
    let trackSelectedAction: (TrackViewModel) -> Void
    let refreshAction: Closure

    @State private var currentlySelectedTrackId = 0

    var body: some View {
        List(viewModel, id: \.id) { track in
            Button {
                currentlySelectedTrackId = track.id
                trackSelectedAction(track)
            } label: {
                TrackView(viewModel: track, isPlaying: track.id == currentlySelectedTrackId)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .refreshable {
            refreshAction()
        }
    }
}

#Preview {
    TrackListView(viewModel: TrackListMock.tracklist) { track in
        print(track.title)
    } refreshAction: {
        print("Refresh")
    }
}
