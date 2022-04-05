//
//  TarjetaViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class TarjetaViewController: UIViewController {
    
    // UILabels
    var tarjetaLabel: UILabel = UILabel()
    var noTarjetaLabel: UILabel = UILabel()
    var noCuentaLabel: UILabel = UILabel()
    var vigenciaLabel: UILabel = UILabel()
    var fechaLabel: UILabel = UILabel()
    var cvvLabel: UILabel = UILabel()
    var cvvNumeroLabel: UILabel = UILabel()
    
    // UIImage
    lazy var tarjetaImage: UIImageView = UIImageView()
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var profileIcon: UIImageView = UIImageView()
    lazy var helpIcon: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI() {
        view.backgroundColor = .white
        
     //MARK: Banner
        
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

        // MARK: Tarjeta Label
        view.addSubview(tarjetaLabel)
        tarjetaLabel.frame = CGRect(x: 0, y: 0, width: 64, height: 21)
        tarjetaLabel.backgroundColor = .white
        tarjetaLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        tarjetaLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        tarjetaLabel.textAlignment = .center
        tarjetaLabel.attributedText = NSMutableAttributedString(string: "TARJETA", attributes: [NSAttributedString.Key.kern: 0.7])
        
    
        view.addSubview(tarjetaLabel)
        tarjetaLabel.textAlignment = .center
        tarjetaLabel.attributedText = NSMutableAttributedString(string: "TARJETA", attributes: [NSAttributedString.Key.kern: 0.7])

        tarjetaLabel.translatesAutoresizingMaskIntoConstraints = false
        tarjetaLabel.widthAnchor.constraint(equalToConstant: 64).isActive = true
        tarjetaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        tarjetaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        tarjetaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        
        
        // MARK: Componentes de tarjeta
        
        
        view.addSubview(tarjetaImage)
        tarjetaImage.translatesAutoresizingMaskIntoConstraints = false
        tarjetaImage.image = UIImage(named: "tarjeta")
        view.addSubview(tarjetaImage)
        tarjetaImage.translatesAutoresizingMaskIntoConstraints = false
        tarjetaImage.widthAnchor.constraint(equalToConstant: 144).isActive = true
        tarjetaImage.heightAnchor.constraint(equalToConstant: 244).isActive = true
        tarjetaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 117).isActive = true
        tarjetaImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 176).isActive = true
                
        
        
 
        // MARK: Numero de tarjeta info
        
        

        noTarjetaLabel.frame = CGRect(x: 0, y: 0, width: 98, height: 21)
        noTarjetaLabel.backgroundColor = .white
        noTarjetaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        noTarjetaLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        noTarjetaLabel.text = "No. de Tarjeta"


        view.addSubview(noTarjetaLabel)
        noTarjetaLabel.translatesAutoresizingMaskIntoConstraints = false
        noTarjetaLabel.widthAnchor.constraint(equalToConstant: 98).isActive = true
        noTarjetaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        noTarjetaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        noTarjetaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 465).isActive = true

    
        noCuentaLabel.frame = CGRect(x: 0, y: 0, width: 149, height: 21)
        noCuentaLabel.backgroundColor = .white
        noCuentaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        noCuentaLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        noCuentaLabel.text = "5439 2464 7664 2003"


        view.addSubview(noCuentaLabel)
        noCuentaLabel.translatesAutoresizingMaskIntoConstraints = false
        noCuentaLabel.widthAnchor.constraint(equalToConstant: 149).isActive = true
        noCuentaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        noCuentaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        noCuentaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 486).isActive = true
        
        
        
        // MARK: Vigencia info
        
    
        vigenciaLabel.frame = CGRect(x: 0, y: 0, width: 63, height: 21)
        vigenciaLabel.backgroundColor = .white
        vigenciaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        vigenciaLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        vigenciaLabel.text = "Vigencia"


        view.addSubview(vigenciaLabel)
        vigenciaLabel.translatesAutoresizingMaskIntoConstraints = false
        vigenciaLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        vigenciaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        vigenciaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        vigenciaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 514).isActive = true
        
        
        

        fechaLabel.frame = CGRect(x: 0, y: 0, width: 33, height: 21)
        fechaLabel.backgroundColor = .white
        fechaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        fechaLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        fechaLabel.text = "11/26"

        
        view.addSubview(fechaLabel)
        fechaLabel.translatesAutoresizingMaskIntoConstraints = false
        fechaLabel.widthAnchor.constraint(equalToConstant: 33).isActive = true
        fechaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        fechaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        fechaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 534).isActive = true
        
        //MARK: Datos del CVV
        
        
        cvvLabel.frame = CGRect(x: 0, y: 0, width: 31, height: 21)
        cvvLabel.backgroundColor = .white
        cvvLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        cvvLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        cvvLabel.text = "CVV"


        view.addSubview(cvvLabel)
        cvvLabel.translatesAutoresizingMaskIntoConstraints = false
        cvvLabel.widthAnchor.constraint(equalToConstant: 31).isActive = true
        cvvLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        cvvLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 227).isActive = true
        cvvLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 514).isActive = true
        
        
        
        cvvNumeroLabel.frame = CGRect(x: 0, y: 0, width: 22, height: 21)
        cvvNumeroLabel.backgroundColor = .white
        cvvNumeroLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        cvvNumeroLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        cvvNumeroLabel.text = "125"


        

        view.addSubview(cvvNumeroLabel)
        cvvNumeroLabel.translatesAutoresizingMaskIntoConstraints = false
        cvvNumeroLabel.widthAnchor.constraint(equalToConstant: 22).isActive = true
        cvvNumeroLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        cvvNumeroLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 229).isActive = true
        cvvNumeroLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 534).isActive = true
        
        
    }
    
    
    

}
