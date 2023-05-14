//
//  MainTabVIewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class MainTabVIewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let vc1 = UINavigationController(rootViewController: DashBoardViewController())
        let vc2 = UINavigationController(rootViewController: ScheduleViewController())
        let vc3 = UINavigationController(rootViewController: CreateScheduleController())
        let vc4 = UINavigationController(rootViewController: ProfileController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc2.tabBarItem.image = UIImage(systemName: "chart.bar.doc.horizontal.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc3.tabBarItem.image = UIImage(systemName: "calendar.badge.plus")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc4.tabBarItem.image = UIImage(systemName: "person.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        vc1.title = "Home"
        vc2.title = "View Schedule"
        vc3.title = "Create New Schedule"
        vc4.title = "Profile"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
