//
//  HomeViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class InicioViewController: UIViewController {
    
    var dineroLabel: UILabel = UILabel()
    var cantidadLabel: UILabel = UILabel()
    var enviarButton: UIButton = UIButton()
    var recibirButton: UIButton = UIButton()
    var fechaLabel: UILabel = UILabel()
    var backgroundLabel: UILabel = UILabel()
    var fondoLabel: UILabel = UILabel()
    var horaLabel: UILabel = UILabel()
    var movimiento1Label: UILabel = UILabel()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        view.backgroundColor = .white
        
        
        //MARK: Primera vista
        
        

        dineroLabel.frame = CGRect(x: 0, y: 0, width: 144, height: 21)
        dineroLabel.backgroundColor = .white
        dineroLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        dineroLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        
        dineroLabel.textAlignment = .center
        dineroLabel.attributedText = NSMutableAttributedString(string: "DINERO DISPONIBLE", attributes: [NSAttributedString.Key.kern: 0.7])

        

        view.addSubview(dineroLabel)
        dineroLabel.translatesAutoresizingMaskIntoConstraints = false
        dineroLabel.widthAnchor.constraint(equalToConstant: 144).isActive = true
        dineroLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        dineroLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        dineroLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109).isActive = true
        
        
        
        
        

        cantidadLabel.frame = CGRect(x: 0, y: 0, width: 85, height: 30)
        cantidadLabel.backgroundColor = .white
        cantidadLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        cantidadLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        cantidadLabel.text = "$160.00"


        

        view.addSubview(cantidadLabel)
        cantidadLabel.translatesAutoresizingMaskIntoConstraints = false
        cantidadLabel.widthAnchor.constraint(equalToConstant: 85).isActive = true
        cantidadLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cantidadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147).isActive = true
        cantidadLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 152).isActive = true
        
        
        //MARK: Botones
        
        
        
        
        
        
        
        
        
        
        
        fechaLabel.frame = CGRect(x: 0, y: 0, width: 111, height: 21)
        fechaLabel.backgroundColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1)
        fechaLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        fechaLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        fechaLabel.textAlignment = .center
        fechaLabel.attributedText = NSMutableAttributedString(string: "25 ENERO 2022", attributes: [NSAttributedString.Key.kern: 0.7])

// checa el fondo de esta label
        
        view.addSubview(fechaLabel)
        fechaLabel.translatesAutoresizingMaskIntoConstraints = false
        fechaLabel.widthAnchor.constraint(equalToConstant: 111).isActive = true
        fechaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        fechaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        fechaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 272).isActive = true
        
        
        
        
        
        
      

        fondoLabel.frame = CGRect(x: 0, y: 0, width: 135, height: 21)
        fondoLabel.backgroundColor = .white
        fondoLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        fondoLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        fondoLabel.text = "Fondeo Bienvenida"


        view.addSubview(fondoLabel)
        fondoLabel.translatesAutoresizingMaskIntoConstraints = false
        fondoLabel.widthAnchor.constraint(equalToConstant: 135).isActive = true
        fondoLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        fondoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        fondoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 310).isActive = true
        
        
        
        

        horaLabel.frame = CGRect(x: 0, y: 0, width: 58, height: 21)
        horaLabel.backgroundColor = .white
        horaLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        horaLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        horaLabel.text = "7:18 p.m."


       

        view.addSubview(horaLabel)
        horaLabel.translatesAutoresizingMaskIntoConstraints = false
        horaLabel.widthAnchor.constraint(equalToConstant: 58).isActive = true
        horaLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        horaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        horaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 326).isActive = true
        
        
        
        
        movimiento1Label.frame = CGRect(x: 0, y: 0, width: 67, height: 21)
        movimiento1Label.backgroundColor = .white
        movimiento1Label.textColor = UIColor(red: 0, green: 0.8, blue: 0.8, alpha: 1)
        movimiento1Label.font = UIFont(name: "Poppins-Medium", size: 14)
        movimiento1Label.attributedText = NSMutableAttributedString(string: "+ $50.00", attributes: [NSAttributedString.Key.kern: 0.7])



        view.addSubview(movimiento1Label)
        movimiento1Label.translatesAutoresizingMaskIntoConstraints = false
        movimiento1Label.widthAnchor.constraint(equalToConstant: 67).isActive = true
        movimiento1Label.heightAnchor.constraint(equalToConstant: 21).isActive = true
        movimiento1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 274).isActive = true
        movimiento1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 310).isActive = true
        
        
        
    }

}
