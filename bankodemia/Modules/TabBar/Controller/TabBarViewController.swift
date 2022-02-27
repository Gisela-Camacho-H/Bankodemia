//
//  TabBarViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class TabBarViewController: UIViewController, UITabBarControllerDelegate {

    var tabBarCnt: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarController()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createTabBarController(){
        tabBarCnt = UITabBarController()
        tabBarCnt.delegate = self
        tabBarCnt.tabBar.backgroundColor = UIColor.bankodemiaBlack
        tabBarCnt.tabBar.tintColor = UIColor.bankodemiaCyan
        tabBarCnt.tabBar.unselectedItemTintColor = UIColor.white
        
        let firstViewController = InicioViewController()
        firstViewController.title = "INICIO"
        firstViewController.tabBarItem.image = UIImage(named: "kodemia")?.withRenderingMode(.alwaysOriginal)
        
        let secondViewController = TarjetaViewController()
        secondViewController.title = "TARJETA"
        secondViewController.tabBarItem.image = UIImage(named: "cards")?.withRenderingMode(.alwaysOriginal)
        
        let thirdViewController = ServiciosViewController()
        thirdViewController.title = "SERVICIOS"
        thirdViewController.tabBarItem.image = UIImage(named: "list")?.withRenderingMode(.alwaysOriginal)
        
        tabBarCnt.viewControllers = [firstViewController, secondViewController, thirdViewController]

        self.view.addSubview(tabBarCnt.view)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBar controller \(tabBarController.selectedIndex)")
    }
    

}

