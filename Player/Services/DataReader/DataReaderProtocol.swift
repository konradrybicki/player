//
//  DataReaderProtocol.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Foundation

protocol DataReaderProtocol {
    func readJsonData<T>(fromUrl url: URL?, dataType: T.Type) throws(DataReaderError) -> T where T: Decodable
}
