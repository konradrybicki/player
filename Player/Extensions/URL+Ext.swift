//
//  URL+Ext.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation

// MARK: Data

extension URL {
    static func forTrackList() -> Self? {
        Bundle.main.url(forResource: "trackList", withExtension: "json")
    }
}

// MARK: Resources

extension URL {
    static func forAudio(resource: String) -> Self? {
        Bundle.main.url(forResource: resource, withExtension: "mp3")
    }

    static func forImage(resource: String) -> Self? {
        Bundle.main.url(forResource: resource, withExtension: "jpg")
    }
}
