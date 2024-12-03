//
//  LoadingState.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

enum LoadingState {
    case initial
    case loading
    case success
    case failure
}

protocol Loadable {
    var loadingState: LoadingState { get }
}
