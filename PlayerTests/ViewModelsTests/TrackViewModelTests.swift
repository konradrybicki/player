//
//  TrackViewModelTests.swift
//  PlayerTests
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Testing

@testable import Player

@Suite struct TrackViewModelTests {
    @Test func testViewModel() {
        let model = TrackListTestMock.track
        let viewModel = TrackViewModel(model: model)
        #expect(viewModel.id == 1)
        #expect(viewModel.title == "Maza Jaja")
        #expect(viewModel.subtitle == "INNA, Heartbreaker")
        #expect(viewModel.audioUrl != nil)
        #expect(viewModel.imageUrl != nil)
    }
}
