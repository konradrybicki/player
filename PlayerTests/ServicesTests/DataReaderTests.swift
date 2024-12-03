//
//  DataReaderTests.swift
//  PlayerTests
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation
import Testing

@testable import Player

@Suite struct DataReaderTests {
    private let dataReader = DataReader()

    @Test func testReadJsonDataForUrlError() throws {
        let url: URL? = nil
        let dataType = TrackList.self
        #expect(throws: DataReaderError.url) {
            let _ = try dataReader.readJsonData(fromUrl: url, dataType: dataType)
        }
    }

    @Test func testReadJsonDataForDataError() throws {
        let url: URL? = TrackListTestMock.dataErrorUrl
        let dataType = TrackList.self
        #expect(throws: DataReaderError.data) {
            let _ = try dataReader.readJsonData(fromUrl: url, dataType: dataType)
        }
    }

    @Test func testReadJsonDataForDecodingError() throws {
        let url: URL? = .forTrackList()
        let dataType = String.self
        #expect(throws: DataReaderError.decoding) {
            let _ = try dataReader.readJsonData(fromUrl: url, dataType: dataType)
        }
    }

    @Test func testReadJsonDataForSuccess() throws {
        let url: URL? = .forTrackList()
        let dataType = TrackList.self
        let result = try dataReader.readJsonData(fromUrl: url, dataType: dataType)
        #expect(!result.isEmpty)
    }
}
