//
//  SplashScreenController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-03-18.
//

import UIKit
import AVFoundation

class SplashScreenController: UIViewController {
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playVideo()
        getstartButton.addTarget(self, action: #selector(gotnextPage), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func gotnextPage() {
        let lc = LoginController()

        navigationController?.pushViewController(lc, animated: true)
    }
    
    let logoImage : UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        logo.layer.shadowOpacity = 1.0
        logo.layer.shadowRadius = 1.0
        logo.setRoundedImage()
        
        return logo
    }()
    
//    let logonameImage : UIImageView = {
//        let name = UIImageView()
//        name.translatesAutoresizingMaskIntoConstraints = false
//        name.image = UIImage(named: "nameImage")
//        name.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        name.layer.shadowOpacity = 1.0
//        name.layer.shadowRadius = 1.0
//
//        return name
//    }()
    
    let getstartButton : UIButton = {
        
                let button = UIButton()
               
                 button.setTitle("Get Started now", for: .normal)
                button.titleLabel?.font = UIFont(name: "SF Compact", size: 20)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.backgroundColor = .systemBlue
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.systemBlue.cgColor
                button.layer.cornerRadius = 10
                button.layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
                button.layer.shadowOpacity = 0.4
                button.layer.shadowRadius = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
                
        
//        button.configure(with: IconButtonViewModel(primaryText: "Get Started now",
//                                                   icon: UIImage(named: "rightArrow"),
//                                                   backgroundColor: .white,
//                                                   iconSpace: 160))
    
        return button
    }()
    
    func playVideo(){
        let path = Bundle.main.path(forResource: "gymVideo", ofType: "mp4")
       
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
  
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            self.splashScreenLogo()
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
//            self.splashScreenNameLogo()
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            self.splashScreenButton()
        }
        
        
    }
    
    func splashScreenLogo(){
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        self.view.addSubview(logoImage)
        logoImage.layer.add(animation, forKey: nil)
        
        setupSplashScreeLogoConstraints()
    }
//    func splashScreenNameLogo(){
//        let animation = CABasicAnimation(keyPath: "opacity")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.duration = 1.5
//        animation.fillMode = .forwards
//        animation.isRemovedOnCompletion = false
//        animation.beginTime = CACurrentMediaTime()
//        self.view.addSubview(nameImage)
//        nameImage.layer.add(animation, forKey: nil)
//
//        setupSplashScreenNameConstraints()
//    }
    
    func splashScreenButton(){
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        self.view.addSubview(getstartButton)
        getstartButton.layer.add(animation, forKey: nil)
        
        setupSplashScreenButtonConstraints()
    }
    
    @objc func playerItemDidReachEnd(){
        player!.seek(to: CMTime.zero)
    }
   
    func setupSplashScreeLogoConstraints() {
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650 ).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130).isActive = true
        

    }
    
    
//    func setupSplashScreenNameConstraints(){
//        nameImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 240).isActive = true
//        nameImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -630 ).isActive = true
////        nameImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
////        nameImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 ).isActive = true
//        nameImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65).isActive = true
//        nameImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
//    }
//
    
    func setupSplashScreenButtonConstraints(){
        
        getstartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        getstartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130 ).isActive = true
        getstartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        getstartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
}
extension UIImageView{
    func setRoundedImage(){
        let radius = CGRectGetWidth(self.frame) / 2
        layer.cornerRadius = radius
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
