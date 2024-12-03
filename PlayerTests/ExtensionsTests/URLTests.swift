//
//  URLTests.swift
//  PlayerTests
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation
import Testing

@testable import Player

// MARK: Data

@Suite struct URLTests {
    @Test func testTrackList() {
        let url: URL? = .forTrackList()
        #expect(url != nil)
    }
}

// MARK: Resources

extension URLTests {
    @Test func testAudioResourceForNil() {
        let resource = "Firestorm"
        let url: URL? = .forAudio(resource: resource)
        #expect(url == nil)
    }

    @Test func testAudioResourceForNotNil() {
        let resource = "Heartbreaker"
        let url: URL? = .forAudio(resource: resource)
        #expect(url != nil)
    }

    @Test func testImageResourceForNil() {
        let resource = "Firestorm"
        let url: URL? = .forImage(resource: resource)
        #expect(url == nil)
    }

    @Test func testImageResourceForNotNil() {
        let resource = "Heartbreaker"
        let url: URL? = .forImage(resource: resource)
        #expect(url != nil)
    }
}
