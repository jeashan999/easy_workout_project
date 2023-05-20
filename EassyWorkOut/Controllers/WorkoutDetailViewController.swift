//
//  WorkoutDetailViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-20.
//

import UIKit
import AVKit

class WorkoutDetailViewController: UIViewController {
    private var videoURL: URL
    
    private var player: AVPlayer?
    private var playerViewController: AVPlayerViewController?
    private var timer: Timer?
    private var elapsedTime: TimeInterval = 0.0
    
    private let videoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    init(videoURL: URL) {
        self.videoURL = videoURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupVideoPlayer()
        setupTimerLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPlayback()
        startTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopPlayback()
        stopTimer()
    }
    
    private func setupVideoPlayer() {
        player = AVPlayer(url: videoURL)
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
        playerViewController?.showsPlaybackControls = false
        
        addChild(playerViewController!)
        videoContainerView.addSubview(playerViewController!.view)
        
        playerViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        playerViewController!.view.leadingAnchor.constraint(equalTo: videoContainerView.leadingAnchor).isActive = true
        playerViewController!.view.trailingAnchor.constraint(equalTo: videoContainerView.trailingAnchor).isActive = true
        playerViewController!.view.topAnchor.constraint(equalTo: videoContainerView.topAnchor).isActive = true
        playerViewController!.view.bottomAnchor.constraint(equalTo: videoContainerView.bottomAnchor).isActive = true
        
        playerViewController!.didMove(toParent: self)
        
        view.addSubview(videoContainerView)
        
        videoContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        videoContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        videoContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        videoContainerView.heightAnchor.constraint(equalTo: videoContainerView.widthAnchor, multiplier: 9.0/16.0).isActive = true
    }
    
    private func setupTimerLabel() {
        view.addSubview(timerLabel)
        
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: videoContainerView.bottomAnchor, constant: 20.0).isActive = true
    }
    
    private func startPlayback() {
        player?.play()
    }
    
    private func stopPlayback() {
        player?.pause()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateTimer() {
        elapsedTime += 0.1
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
