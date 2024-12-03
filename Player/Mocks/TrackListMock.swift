//
//  TrackListMock.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

struct TrackListMock {
    static let tracklist: Array<TrackViewModel> = [
        Track(id: 1, name: "Maza Jaja", artist: "INNA", album: "Heartbreaker", audioResource: "Maza Jaja", imageResource: "Heartbreaker"),
        Track(id: 2, name: "Maza Jaja", artist: "INNA", album: "Heartbreaker", audioResource: "Maza Jaja", imageResource: "Heartbreaker"),
        Track(id: 3, name: "Maza Jaja", artist: "INNA", album: "Heartbreaker", audioResource: "Maza Jaja", imageResource: "Heartbreaker"),
        Track(id: 4, name: "Maza Jaja", artist: "INNA", album: "Heartbreaker", audioResource: "Maza Jaja", imageResource: "Heartbreaker")
    ].viewModel()

    static let noImageTrack = TrackViewModel(model: Track(id: 1, name: "Maza Jaja", artist: "INNA", album: "Heartbreaker", audioResource: "Maza Jaja", imageResource: "image"))
}
