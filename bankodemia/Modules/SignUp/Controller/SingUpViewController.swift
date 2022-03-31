
import UIKit

class SingUpViewController: UIViewController {
    
    // labels
    lazy var bottomLabel: UILabel = UILabel()
    lazy var linkLabel: UILabel = UILabel()
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLable: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var subtitlelabel: UIView.textFieldLabel = UIView.textFieldLabel()
    
    // buttons
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    
    lazy var correoTextField: UIView.mainTextField = UIView.mainTextField()
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        correoTextField.delegate = self
    }
    
    func initUI(){
        
        view.applyWhiteBackgroundColor()
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "smallLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: Constants.height / 20),
        ])
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLable)
        titleLable.text = "ESCRIBE TU CORREO"
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Aquí recibirás comprobantes de tus movimientos e información sobre tu cuenta"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(subtitlelabel)
        subtitlelabel.text = "Escribe tu correo"
        NSLayoutConstraint.activate([subtitlelabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.padding),
        subtitlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitlelabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(correoTextField)
        correoTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        correoTextField.placeholder = "mels@gmail.com"
        NSLayoutConstraint.activate([correoTextField.topAnchor.constraint(equalTo: subtitlelabel.bottomAnchor, constant: 5),
            correoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            correoTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Continuar", for: .normal)
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(linkLabel)
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.text = "Aviso de privacidad"
        linkLabel.textAlignment = .center
        linkLabel.textColor = UIColor.bankodemiaBlue
        
        NSLayoutConstraint.activate([linkLabel.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: -20),
        linkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        linkLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Al tocar continuar aceptas nuestro"
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = UIColor.bankodemiaBlack
        
        NSLayoutConstraint.activate([bottomLabel.bottomAnchor.constraint(equalTo: linkLabel.topAnchor, constant: -5),
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    }

    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = DatosViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}

extension SingUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
