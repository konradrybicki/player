//
//  TrackViewModel.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation

struct TrackViewModel {
    private let model: Track

    init(model: Track) {
        self.model = model
    }

    var id: Int {
        model.id
    }

    var title: String {
        model.name
    }

    var subtitle: String {
        model.artist + album
    }

    private var album: String {
        !model.album.isEmpty ? ", " + model.album : .empty()
    }

    var audioUrl: URL? {
        .forAudio(resource: model.audioResource)
    }

    var imageUrl: URL? {
        .forImage(resource: model.imageResource)
    }
}
