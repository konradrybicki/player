//
//  TrackListTestMock.swift
//  PlayerTests
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation

@testable import Player

struct TrackListTestMock {
    static let dataErrorUrl: URL? = .init(string: "www.google.com")
    static let track = Track(id: 1, name: "Maza Jaja", artist: "INNA", album: "Heartbreaker", audioResource: "Maza Jaja", imageResource: "Heartbreaker")
}
