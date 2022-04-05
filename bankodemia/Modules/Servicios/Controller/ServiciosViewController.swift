//
//  ServiciosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class ServiciosViewController: UIViewController {
    
    // UILabels
    var servicesLabel: UILabel = UILabel()
    var recargaLabel: UILabel = UILabel()
    var telcelLabel: UILabel = UILabel()
    var planLabel: UILabel = UILabel()
    var attLabel: UILabel = UILabel()
    var plan2Label: UILabel = UILabel()
    var att2Label: UILabel = UILabel()
    var internetLabel: UILabel = UILabel()
    var telmexLabel: UILabel = UILabel()
    var gasLabel: UILabel = UILabel()
    var naturgyLabel: UILabel = UILabel()
    var tarjetaLabel: UILabel = UILabel()
    var bbvaLabel: UILabel = UILabel()
    var tiendasLabel: UILabel = UILabel()
    var liverpoolLabel: UILabel = UILabel()
    
    // UIImageView
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var profileIcon: UIImageView = UIImageView()
    lazy var helpIcon: UIImageView = UIImageView()
    
    
    

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
        
        
        
        // SERVICIOS LABEL //
//        var view = UILabel()
        view.addSubview(servicesLabel)
        servicesLabel.frame = CGRect(x: 0, y: 0, width: 78, height: 21)
        servicesLabel.backgroundColor = .white
        servicesLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        servicesLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        servicesLabel.textAlignment = .center
        servicesLabel.attributedText = NSMutableAttributedString(string: "SERVICIOS", attributes: [NSAttributedString.Key.kern: 0.7])
//        var parent = self.view!

        
        servicesLabel.translatesAutoresizingMaskIntoConstraints = false
        servicesLabel.widthAnchor.constraint(equalToConstant: 78).isActive = true
        servicesLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
       servicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        servicesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        
        // RECARGA CELULAR //
        

        recargaLabel.frame = CGRect(x: 0, y: 0, width: 157, height: 24)
        recargaLabel.backgroundColor = .white
        recargaLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        recargaLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        recargaLabel.text = "Recarga de celular"

        view.addSubview(recargaLabel)
        recargaLabel.translatesAutoresizingMaskIntoConstraints = false
        recargaLabel.widthAnchor.constraint(equalToConstant: 157).isActive = true
        recargaLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        recargaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        recargaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 166).isActive = true
        
        

        telcelLabel.frame = CGRect(x: 0, y: 0, width: 148, height: 21)
        telcelLabel.backgroundColor = .white
        telcelLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        telcelLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        telcelLabel.text = "Telcel, AT&T, Movistar"
     
        view.addSubview(telcelLabel)
        telcelLabel.translatesAutoresizingMaskIntoConstraints = false
        telcelLabel.widthAnchor.constraint(equalToConstant: 148).isActive = true
        telcelLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        telcelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        telcelLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 191).isActive = true
        
        
        // PLAN MOVIL //
        

        planLabel.frame = CGRect(x: 0, y: 0, width: 157, height: 24)
        planLabel.backgroundColor = .white
        planLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        planLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        planLabel.text = "Plan móvil"


        view.addSubview(planLabel)
        planLabel.translatesAutoresizingMaskIntoConstraints = false
        planLabel.widthAnchor.constraint(equalToConstant: 157).isActive = true
        planLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        planLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        planLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 242).isActive = true

        attLabel.frame = CGRect(x: 0, y: 0, width: 148, height: 21)
        attLabel.backgroundColor = .white
        attLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        attLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        attLabel.text = "AT&T, Telcel, Movistar"

        view.addSubview(attLabel)
        attLabel.translatesAutoresizingMaskIntoConstraints = false
        attLabel.widthAnchor.constraint(equalToConstant: 148).isActive = true
        attLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        attLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        attLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 267).isActive = true
        
        
        // PLAN MOVIL 2 //
        
//        var view = UILabel()

        plan2Label.frame = CGRect(x: 0, y: 0, width: 157, height: 24)
        plan2Label.backgroundColor = .white
        plan2Label.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        plan2Label.font = UIFont(name: "Poppins-Medium", size: 16)
        plan2Label.text = "Plan móvil"


//        var parent = self.view!

        view.addSubview(plan2Label)
        plan2Label.translatesAutoresizingMaskIntoConstraints = false
        plan2Label.widthAnchor.constraint(equalToConstant: 157).isActive = true
        plan2Label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        plan2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        plan2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 316).isActive = true
        
        
//        var view = UILabel()

        att2Label.frame = CGRect(x: 0, y: 0, width: 148, height: 21)
        att2Label.backgroundColor = .white
        att2Label.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        att2Label.font = UIFont(name: "Poppins-Regular", size: 14)
        att2Label.text = "AT&T, Telcel, Movistar"


//        var parent = self.view!

        view.addSubview(att2Label)
        att2Label.translatesAutoresizingMaskIntoConstraints = false
        att2Label.widthAnchor.constraint(equalToConstant: 148).isActive = true
        att2Label.heightAnchor.constraint(equalToConstant: 21).isActive = true
        att2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        att2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 341).isActive = true
        
        
        // Internet/TV/Telefono //
        
        
//        var view = UILabel()

        internetLabel.frame = CGRect(x: 0, y: 0, width: 291, height: 24)
        internetLabel.backgroundColor = .white
        internetLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        internetLabel.font = UIFont(name: "Poppins-Medium", size: 16)

        internetLabel.text = "Internet/TV/Teléfono"


//        var parent = self.view!
        view.addSubview(internetLabel)
        internetLabel.translatesAutoresizingMaskIntoConstraints = false
        internetLabel.widthAnchor.constraint(equalToConstant: 291).isActive = true
        internetLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        internetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        internetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 392).isActive = true
        
        
        
//        var view = UILabel()
        telmexLabel.frame = CGRect(x: 0, y: 0, width: 146, height: 21)
        telmexLabel.backgroundColor = .white
        telmexLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        telmexLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        telmexLabel.text = "Telmex, Izzi, TotalPlay"

 
        view.addSubview(telmexLabel)
        telmexLabel.translatesAutoresizingMaskIntoConstraints = false
        telmexLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        telmexLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        telmexLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        telmexLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 417).isActive = true
        
        
        // GAS //
        
//        var view = UILabel()

        gasLabel.frame = CGRect(x: 0, y: 0, width: 291, height: 24)
        gasLabel.backgroundColor = .white
        gasLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        gasLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        gasLabel.text = "Gas"


//        var parent = self.view!
        view.addSubview(gasLabel)
        gasLabel.translatesAutoresizingMaskIntoConstraints = false
        gasLabel.widthAnchor.constraint(equalToConstant: 291).isActive = true
        gasLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        gasLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        gasLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 468).isActive = true
        
        
//        var view = UILabel()

        naturgyLabel.frame = CGRect(x: 0, y: 0, width: 218, height: 21)
        naturgyLabel.backgroundColor = .white
        naturgyLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        naturgyLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        naturgyLabel.text = "Naturgy y Compañía Mexicana"


//        var parent = self.view!

        view.addSubview(naturgyLabel)
        naturgyLabel.translatesAutoresizingMaskIntoConstraints = false
        naturgyLabel.widthAnchor.constraint(equalToConstant: 218).isActive = true
        naturgyLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        naturgyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        naturgyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 493).isActive = true
        
        
        // TARJETAS DE CREDITO //
        
//        var view = UILabel()

        tarjetaLabel.frame = CGRect(x: 0, y: 0, width: 291, height: 24)
        tarjetaLabel.backgroundColor = .white
        tarjetaLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        tarjetaLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        tarjetaLabel.text = "Tarjetas de crédito"


//        var parent = self.view!

        view.addSubview(tarjetaLabel)
        tarjetaLabel.translatesAutoresizingMaskIntoConstraints = false
        tarjetaLabel.widthAnchor.constraint(equalToConstant: 291).isActive = true
        tarjetaLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        tarjetaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        tarjetaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 548).isActive = true
        
        
//        var view = UILabel()

        bbvaLabel.frame = CGRect(x: 0, y: 0, width: 251, height: 21)
        bbvaLabel.backgroundColor = .white
        bbvaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        bbvaLabel.font = UIFont(name: "Poppins-Regular", size: 14)


//        var parent = self.view!

        view.addSubview(bbvaLabel)
        bbvaLabel.translatesAutoresizingMaskIntoConstraints = false
        bbvaLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true
        bbvaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        bbvaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        bbvaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 573).isActive = true
        
        // TIENDAS DEPARTAMENTALES //
        
//        var view = UILabel()

        tiendasLabel.frame = CGRect(x: 0, y: 0, width: 291, height: 24)
        tiendasLabel.backgroundColor = .white
        tiendasLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        tiendasLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        tiendasLabel.text = "Tiendas departamentales"


//        var parent = self.view!

        view.addSubview(tiendasLabel)
        tiendasLabel.translatesAutoresizingMaskIntoConstraints = false
        tiendasLabel.widthAnchor.constraint(equalToConstant: 291).isActive = true
        tiendasLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        tiendasLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37).isActive = true
        tiendasLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 629).isActive = true
        
        
//        var view = UILabel()

        liverpoolLabel.frame = CGRect(x: 0, y: 0, width: 233, height: 21)
        liverpoolLabel.backgroundColor = .white
        liverpoolLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        liverpoolLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        liverpoolLabel.text = "Liverpool, Sears, Palacio de Hierro"


//        var parent = self.view!

        view.addSubview(liverpoolLabel)
        liverpoolLabel.translatesAutoresizingMaskIntoConstraints = false
        liverpoolLabel.widthAnchor.constraint(equalToConstant: 233).isActive = true
        liverpoolLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        liverpoolLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38).isActive = true
        liverpoolLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
        
        
//        MARK: Rectangulos
        
        
        
    
        
        
    }

}
