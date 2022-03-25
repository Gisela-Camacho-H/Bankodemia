
import Foundation
import UIKit

extension UIView{
    
    func applyWhiteBackgroundColor(){
        self.backgroundColor = .white
    }
    
    func applyBlackBackgroundColor(){
        self.backgroundColor = .bankodemiaBlack
    }
    
    //MARK: - Button
    class cyanButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = UIColor.bankodemiaCyan
            setTitleColor(.white, for: .normal)
            heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
            layer.cornerRadius = Constants.cornerRadius
            titleLabel?.applySubtitleFont()
        }
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
    
    class clearButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            layer.borderColor = UIColor.bankodemiaCyan.cgColor
            layer.borderWidth = Constants.borderWidth
            setTitleColor(.bankodemiaCyan, for: .normal)
            heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
            layer.cornerRadius = Constants.cornerRadius
            titleLabel?.applySubtitleFont()

        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class backArrowButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = .clear
            setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            tintColor = UIColor.labelDarkGray
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class addAccountButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = .clear
            setImage(UIImage(imageLiteralResourceName: "addUser"), for: .normal)
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    //MARK: - label
    class titleButtonLabel: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            adjustsFontSizeToFitWidth = true
            apply14Font()
            textColor = UIColor.labelDarkGray
            textAlignment = .left
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class mainTextLabel: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            adjustsFontSizeToFitWidth = true
            apply16Font()
            numberOfLines = 0
            textAlignment = .left
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class textFieldLabel: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            apply14Font()
            applyDrakGrayColor()
            textAlignment = .left
            translatesAutoresizingMaskIntoConstraints = false
            numberOfLines = 0
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
//MARK: - Text Field
    class signUpTextField: UITextField {
        override init(frame: CGRect){
            super.init(frame: frame)
            heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
            layer.cornerRadius = 7
            layer.borderWidth = 1
            backgroundColor = .clear
            textAlignment = NSTextAlignment.left
            keyboardType = UIKeyboardType.default
            autocorrectionType = UITextAutocorrectionType.no
            clearButtonMode = UITextField.ViewMode.whileEditing
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
            leftViewMode = UITextField.ViewMode.always
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
}

