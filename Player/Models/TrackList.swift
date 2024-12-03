//
//  TrackList.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

typealias TrackList = Array<Track>

struct Track: Decodable {
    let id: Int
    let name: String
    let artist: String
    let album: String
    let audioResource: String
    let imageResource: String

    private enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case name = "trackName"
        case artist = "artistName"
        case album = "albumName"
        case audioResource = "audioResourceName"
        case imageResource = "imageResourceName"
    }
}
