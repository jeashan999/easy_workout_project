//
//  WorkoutDetailViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-20.
//
import UIKit
import WebKit

class WorkoutDetailViewController: UIViewController, WKNavigationDelegate {
    private var videoURLString: String
    private var workoutDescription: String
    private var webView: WKWebView!

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
    
    private var timer: Timer?
    private var elapsedTime: TimeInterval = 0.0
    
    init(videoURLString: String, workoutDescription: String) {
        self.videoURLString = videoURLString
        self.workoutDescription = workoutDescription
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupVideoThumbnail()
        setupDescriptionLabel()
        setupTimerLabel()
        setupCloseButton()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopTimer()
    }
    
    private func setupVideoThumbnail() {
        let thumbnailButton = UIButton(type: .custom)
        thumbnailButton.translatesAutoresizingMaskIntoConstraints = false
        thumbnailButton.contentMode = .scaleAspectFit
        thumbnailButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        view.addSubview(thumbnailButton)
        
        // Set the video thumbnail image for the button
        if let videoThumbnailURL = extractVideoThumbnailURL(from: videoURLString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: videoThumbnailURL) {
                    DispatchQueue.main.async {
                        let thumbnailImage = UIImage(data: data)
                        thumbnailButton.setImage(thumbnailImage, for: .normal)
                    }
                }
            }
        }
        
        NSLayoutConstraint.activate([
            thumbnailButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            thumbnailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            thumbnailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            thumbnailButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/16) 
        ])
        
        // Initialize the WKWebView and add it to the view hierarchy
        webView = WKWebView(frame: view.bounds)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: thumbnailButton.bottomAnchor, constant: 20),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        webView.isHidden = true // Hide the webView initially
    }
    
    private func setupDescriptionLabel() {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = workoutDescription
        descriptionLabel.textColor = .white
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupTimerLabel() {
        view.addSubview(timerLabel)
        
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
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
    
    @objc private func playVideo() {
        if let videoID = extractVideoID(from: videoURLString) {
            let embedURLString = "https://www.youtube.com/embed/\(videoID)"
            if let embedURL = URL(string: embedURLString) {
                let request = URLRequest(url: embedURL)
                webView.load(request)
                webView.isHidden = false // Show the webView when the video starts playing
            }
        }
    }
    
    private func extractVideoID(from urlString: String) -> String? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems {
            for queryItem in queryItems {
                if queryItem.name.lowercased() == "v" {
                    return queryItem.value
                }
            }
        }
        
        return nil
    }
    
    private func extractVideoThumbnailURL(from urlString: String) -> URL? {
        if let videoID = extractVideoID(from: urlString) {
            let thumbnailURLString = "https://img.youtube.com/vi/\(videoID)/0.jpg"
            return URL(string: thumbnailURLString)
        }
        
        return nil
    }
    
    private func setupCloseButton() {
        let closeButton = UIButton(type: .custom)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .white
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
    }
}
