//
//  RecibirViewController.swift
//  bankodemia
//
//  Created by Itzel Ibanez on 02/04/22.
//

import UIKit

class DetalleViewController: UIViewController {
    
    var bankodemiaImage: UIImageView = UIImageView()
    var backButton: UIButton = UIButton()
    var detalleLabel: UILabel = UILabel()
    var cantidadLabel: UILabel = UILabel()
    var rentaIsabelLabel: UILabel = UILabel()
    var fechaHoraLabel: UILabel = UILabel()
    var fechaLabel: UILabel = UILabel()
    var eneroLabel: UILabel = UILabel()
    var idTransaccionLabel: UILabel = UILabel()
    var numTransaccionLabel: UILabel = UILabel()
    var conceptoLabel: UILabel = UILabel()
    var conceptoDescrpLabel: UILabel = UILabel()
    var cuentaEmisoraLabel: UILabel = UILabel()
    var noDeCuenta: UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initUI()
    
}



func initUI(){
    
    view.addSubview(bankodemiaImage)
    bankodemiaImage.image = UIImage(named: "smallLogo")
    bankodemiaImage.frame = CGRect(x: 0, y: 0, width: 70, height: 40)
    bankodemiaImage.backgroundColor = .white
    view.addSubview(bankodemiaImage)
    bankodemiaImage.translatesAutoresizingMaskIntoConstraints = false
    bankodemiaImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
    bankodemiaImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    bankodemiaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 145).isActive = true
    bankodemiaImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
    
    
    
    view.addSubview(detalleLabel)
    detalleLabel.frame = CGRect(x: 0, y: 0, width: 196, height: 21)
    detalleLabel.backgroundColor = .white
    detalleLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
    detalleLabel.font = UIFont(name: "Poppins-Medium", size: 14)
    view.addSubview(detalleLabel)
    detalleLabel.translatesAutoresizingMaskIntoConstraints = false
    detalleLabel.widthAnchor.constraint(equalToConstant: 196).isActive = true
    detalleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    detalleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47).isActive = true
    detalleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109).isActive = true
    
  
    view.addSubview(cantidadLabel)
    cantidadLabel.frame = CGRect(x: 0, y: 0, width: 85, height: 30)
    cantidadLabel.backgroundColor = .white
    cantidadLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
    cantidadLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
    cantidadLabel.text = "$110.00"
    view.addSubview(cantidadLabel)
    cantidadLabel.translatesAutoresizingMaskIntoConstraints = false
    cantidadLabel.widthAnchor.constraint(equalToConstant: 85).isActive = true
    cantidadLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    cantidadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147).isActive = true
    cantidadLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 162).isActive = true
    
    
    
    view.addSubview(rentaIsabelLabel)
    rentaIsabelLabel.frame = CGRect(x: 0, y: 0, width: 88, height: 21)
    rentaIsabelLabel.backgroundColor = .white
    rentaIsabelLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    rentaIsabelLabel.font = UIFont(name: "Poppins-Medium", size: 14)
    rentaIsabelLabel.text = "Renta Isabel"
    view.addSubview(rentaIsabelLabel)
    rentaIsabelLabel.translatesAutoresizingMaskIntoConstraints = false
    rentaIsabelLabel.widthAnchor.constraint(equalToConstant: 88).isActive = true
    rentaIsabelLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    rentaIsabelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140).isActive = true
    rentaIsabelLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 192).isActive = true
    
    
    
    view.addSubview(fechaHoraLabel)
    fechaHoraLabel.frame = CGRect(x: 0, y: 0, width: 109, height: 21)
    fechaHoraLabel.backgroundColor = .white
    fechaHoraLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    fechaHoraLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
    fechaHoraLabel.textAlignment = .center
    fechaHoraLabel.attributedText = NSMutableAttributedString(string: "FECHA Y HORA", attributes: [NSAttributedString.Key.kern: 0.7])
    view.addSubview(fechaHoraLabel)
    fechaHoraLabel.translatesAutoresizingMaskIntoConstraints = false
    fechaHoraLabel.widthAnchor.constraint(equalToConstant: 109).isActive = true
    fechaHoraLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    fechaHoraLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
    fechaHoraLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 272).isActive = true
    
    
    
    view.addSubview(fechaLabel)
    fechaLabel.frame = CGRect(x: 0, y: 0, width: 212, height: 21)
    fechaLabel.backgroundColor = .white
    fechaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    fechaLabel.font = UIFont(name: "Poppins-Regular", size: 14)
    fechaLabel.text = "25 de enero de 2022. 9:00 p.m."
    view.addSubview(fechaLabel)
    fechaLabel.translatesAutoresizingMaskIntoConstraints = false
    fechaLabel.widthAnchor.constraint(equalToConstant: 212).isActive = true
    fechaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    fechaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    fechaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 295).isActive = true
    
    

    view.addSubview(idTransaccionLabel)
    idTransaccionLabel.frame = CGRect(x: 0, y: 0, width: 152, height: 21)
    idTransaccionLabel.backgroundColor = .white
    idTransaccionLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    idTransaccionLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
    idTransaccionLabel.textAlignment = .center
    idTransaccionLabel.attributedText = NSMutableAttributedString(string: "ID DE TRANSACCIÓN", attributes: [NSAttributedString.Key.kern: 0.7])
    view.addSubview(idTransaccionLabel)
    idTransaccionLabel.translatesAutoresizingMaskIntoConstraints = false
    idTransaccionLabel.widthAnchor.constraint(equalToConstant: 152).isActive = true
    idTransaccionLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    idTransaccionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
    idTransaccionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 331).isActive = true
    
    


    numTransaccionLabel.frame = CGRect(x: 0, y: 0, width: 248, height: 21)
    numTransaccionLabel.backgroundColor = .white
    numTransaccionLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    numTransaccionLabel.font = UIFont(name: "Poppins-Regular", size: 14)
    numTransaccionLabel.text = "47306BANKODER26012022011820676"
    view.addSubview(numTransaccionLabel)
    numTransaccionLabel.translatesAutoresizingMaskIntoConstraints = false
    numTransaccionLabel.widthAnchor.constraint(equalToConstant: 248).isActive = true
    numTransaccionLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    numTransaccionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    numTransaccionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 354).isActive = true
    
    
    

    conceptoLabel.frame = CGRect(x: 0, y: 0, width: 83, height: 21)
    conceptoLabel.backgroundColor = .white
    conceptoLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    conceptoLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
    conceptoLabel.textAlignment = .center
    conceptoLabel.attributedText = NSMutableAttributedString(string: "CONCEPTO", attributes: [NSAttributedString.Key.kern: 0.7])
    view.addSubview(conceptoLabel)
    conceptoLabel.translatesAutoresizingMaskIntoConstraints = false
    conceptoLabel.widthAnchor.constraint(equalToConstant: 83).isActive = true
    conceptoLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    conceptoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    conceptoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 389).isActive = true
    


    view.addSubview(conceptoDescrpLabel)
    conceptoDescrpLabel.frame = CGRect(x: 0, y: 0, width: 87, height: 21)
    conceptoDescrpLabel.backgroundColor = .white
    conceptoDescrpLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    conceptoDescrpLabel.font = UIFont(name: "Poppins-Regular", size: 14)
    view.addSubview(conceptoDescrpLabel)
    conceptoDescrpLabel.translatesAutoresizingMaskIntoConstraints = false
    conceptoDescrpLabel.widthAnchor.constraint(equalToConstant: 87).isActive = true
    conceptoDescrpLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    conceptoDescrpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    conceptoDescrpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 412).isActive = true
    
    
    
    
    conceptoDescrpLabel.frame = CGRect(x: 0, y: 0, width: 87, height: 21)
    conceptoDescrpLabel.backgroundColor = .white
    conceptoDescrpLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    conceptoDescrpLabel.font = UIFont(name: "Poppins-Regular", size: 14)
    conceptoDescrpLabel.text = "Renta Isabel"
    view.addSubview(conceptoDescrpLabel)
    conceptoDescrpLabel.translatesAutoresizingMaskIntoConstraints = false
    conceptoDescrpLabel.widthAnchor.constraint(equalToConstant: 87).isActive = true
    conceptoDescrpLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    conceptoDescrpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    conceptoDescrpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 412).isActive = true
    
    
    
    
    view.addSubview(cuentaEmisoraLabel)
    cuentaEmisoraLabel.frame = CGRect(x: 0, y: 0, width: 132, height: 21)
    cuentaEmisoraLabel.backgroundColor = .white
    cuentaEmisoraLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    cuentaEmisoraLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
    cuentaEmisoraLabel.textAlignment = .center
    cuentaEmisoraLabel.attributedText = NSMutableAttributedString(string: "CUENTA EMISORA", attributes: [NSAttributedString.Key.kern: 0.7])
    view.addSubview(cuentaEmisoraLabel)
    cuentaEmisoraLabel.translatesAutoresizingMaskIntoConstraints = false
    cuentaEmisoraLabel.widthAnchor.constraint(equalToConstant: 132).isActive = true
    cuentaEmisoraLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    cuentaEmisoraLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
    cuentaEmisoraLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 442).isActive = true
    
    
    
    
    view.addSubview(noDeCuenta)
    noDeCuenta.frame = CGRect(x: 0, y: 0, width: 134, height: 42)
    noDeCuenta.backgroundColor = .white
    noDeCuenta.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    noDeCuenta.font = UIFont(name: "Poppins-Regular", size: 14)
    noDeCuenta.numberOfLines = 0
    noDeCuenta.lineBreakMode = .byWordWrapping
    noDeCuenta.text = "Número de Cuenta\n0000 2052 14"
    view.addSubview(noDeCuenta)
    noDeCuenta.translatesAutoresizingMaskIntoConstraints = false
    noDeCuenta.widthAnchor.constraint(equalToConstant: 134).isActive = true
    noDeCuenta.heightAnchor.constraint(equalToConstant: 42).isActive = true
    noDeCuenta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    noDeCuenta.topAnchor.constraint(equalTo: view.topAnchor, constant: 465).isActive = true

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

}
