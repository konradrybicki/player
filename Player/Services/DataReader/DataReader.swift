//
//  DataReader.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation
import OSLog

// MARK: Public

final class DataReader: DataReaderProtocol {
    func readJsonData<T>(fromUrl url: URL?, dataType: T.Type) throws(DataReaderError) -> T where T: Decodable {
        let safeUrl = try unwrap(url: url)
        let data = try data(fromUrl: safeUrl)
        let result = try decode(dataType: dataType.self, fromData: data)
        return result
    }
}

// MARK: Private

private extension DataReader {
    func unwrap(url: URL?) throws(DataReaderError) -> URL {
        if let safeUrl = url {
            return safeUrl
        } else {
            Logger().error("DataReader URL error")
            throw .url
        }
    }

    func data(fromUrl url: URL) throws(DataReaderError) -> Data {
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            Logger().error("DataReader data error: \(error.localizedDescription)")
            throw .data
        }
    }

    func decode<T>(dataType: T.Type, fromData data: Data) throws(DataReaderError) -> T where T: Decodable {
        do {
            let result = try JSONDecoder().decode(dataType.self, from: data)
            return result
        } catch {
            Logger().error("DataReader decoding error: \(error.localizedDescription)")
            throw .decoding
        }
    }
}
