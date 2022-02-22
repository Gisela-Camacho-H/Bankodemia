

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var buttonStackView: UIStackView = UIStackView()
    private lazy var crearCuentaButton: UIButton = UIButton()
    private lazy var iniciarSesionButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    func initUI(){
        self.view.applyBlackBackgroundColor()
        let buttonArray: [UIButton] = [crearCuentaButton, iniciarSesionButton]
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = Constants.padding
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonArray.forEach {button in
            buttonStackView.addArrangedSubview(button)
        }
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.padding),
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        buttonArray.forEach {button in
            button.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
            button.layer.cornerRadius = Constants.cornerRadius
        }
        
        crearCuentaButton.setTitle("Crear Cuenta", for: .normal)
        crearCuentaButton.backgroundColor = UIColor.bankodemiaCyan
        crearCuentaButton.setTitleColor(.white, for: .normal)
        iniciarSesionButton.setTitle("Iniciar Sesión", for: .normal)
        iniciarSesionButton.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        iniciarSesionButton.layer.borderWidth = Constants.borderWidth
        iniciarSesionButton.setTitleColor(.bankodemiaCyan, for: .normal)
    }
}
