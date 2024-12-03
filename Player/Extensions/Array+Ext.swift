//
//  Array+Ext.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

extension Array where Element == Track {
    func viewModel() -> Array<TrackViewModel> {
        map { model in TrackViewModel(model: model) }
    }
}
