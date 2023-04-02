//
//  NewSplashScreenController.swift
//  EassyWorkOut
//
//  Created by Jeashan anuja  on 2023-03-25.
//

import UIKit

class NewSplashScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add your splash screen image to a UIImageView and set it as the view's background
        let splashImageView = UIImageView(image: UIImage(named: "logoNew"))
        splashImageView.frame = CGRect(x: 80, y: 200, width: 250, height: 250)

        splashImageView.contentMode = .scaleAspectFill
        
//        splashImageView.frame = view.bounds
        
        view.addSubview(splashImageView)

        // Show the splash screen for a set amount of time
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let mainViewController = SplashScreenController()
            let navigationController = UINavigationController(rootViewController: mainViewController)
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
    }

}
extension UIImageView{
    func RoundedImage(){
        let radius = CGRectGetWidth(self.frame) / 2
        layer.cornerRadius = radius
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
