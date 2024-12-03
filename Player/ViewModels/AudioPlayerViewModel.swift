//
//  AudioPlayerViewModel.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import AVFoundation
import Combine

final class AudioPlayerViewModel: ObservableObject, Loadable {
    @Published var isPlaying = false
    @Published var loadingState: LoadingState = .initial

    private var audioPlayer = AVAudioPlayer()

    // MARK: Loading

    func load(track: TrackViewModel) {
        loadingState = .loading
        guard let url = track.audioUrl else {
            loadingState = .failure
            return
        }
        guard let player = try? AVAudioPlayer(contentsOf: url) else {
            loadingState = .failure
            return
        }
        audioPlayer = player
        audioPlayer.prepareToPlay()
        loadingState = .success
    }

    // MARK: Playback

    func play() {
        guard loadingState == .success else { return }
        audioPlayer.play()
        isPlaying = true
    }

    func pause() {
        guard loadingState == .success else { return }
        audioPlayer.pause()
        isPlaying = false
    }

    func rewindBack() {
        guard loadingState == .success else { return }
        audioPlayer.currentTime = 0
        isPlaying = audioPlayer.isPlaying
    }

    func stop() {
        guard loadingState == .success else { return }
        audioPlayer.stop()
        isPlaying = false
    }
}
