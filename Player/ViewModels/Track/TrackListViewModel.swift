//
//  TrackListViewModel.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import Combine
import Foundation

final class TrackListViewModel: ObservableObject, Loadable {
    @Published var trackList = Array<TrackViewModel>()
    @Published var loadingState: LoadingState = .initial

    private let dataReader = DataReader()

    func readTrackList() {
        loadingState = .loading
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard Bool.random() else {
                DispatchQueue.main.async {
                    self?.loadingState = .failure
                }
                return
            }
            guard let trackList = try? self?.readTrackListData() else {
                DispatchQueue.main.async {
                    self?.loadingState = .failure
                }
                return
            }
            DispatchQueue.main.async {
                self?.trackList = trackList.viewModel()
                self?.loadingState = .success
            }
        }
    }

    private func readTrackListData() throws(DataReaderError) -> TrackList {
        try dataReader.readJsonData(fromUrl: .forTrackList(), dataType: TrackList.self)
    }
}
