//
//  ServiciosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class ServiciosViewController: UIViewController {
    
    // UILabels
    var servicesLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    
    // UIImageView
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var profileIcon: UIImageView = UIImageView()
    lazy var helpIcon: UIImageView = UIImageView()
    lazy var serviciosImage: UIImageView = UIImageView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI() {
        view.backgroundColor = .white
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "bigLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalToConstant: 70),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: 42.5),
        ])
        
        self.view.addSubview(helpIcon)
        helpIcon.translatesAutoresizingMaskIntoConstraints = false
        helpIcon.image = UIImage(named: "helpIcon")
        NSLayoutConstraint.activate([helpIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height/11), helpIcon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        helpIcon.translatesAutoresizingMaskIntoConstraints = false
        helpIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        helpIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.view.addSubview(profileIcon)
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.image = UIImage(named: "profileIcon")
        NSLayoutConstraint.activate([profileIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height/11), profileIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        profileIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        self.view.addSubview(servicesLabel)
        servicesLabel.backgroundColor = .clear
        servicesLabel.text = "SERVICIOS"
        NSLayoutConstraint.activate([servicesLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        servicesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding)
        ])
        
        view.addSubview(serviciosImage)
        serviciosImage.translatesAutoresizingMaskIntoConstraints = false
        serviciosImage.image = UIImage(named: "Servicios")
        NSLayoutConstraint.activate([serviciosImage.topAnchor.constraint(equalTo:
                servicesLabel.bottomAnchor, constant: 20),
        serviciosImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        serviciosImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        serviciosImage.heightAnchor.constraint(equalToConstant: Constants.height - 300 ),
                ])
       
    }

}
