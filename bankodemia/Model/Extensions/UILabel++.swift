
import Foundation
import UIKit

extension UILabel{
    
    // Hay 4 tamaños, para titulos, subtitulos, de 16 y de 14 (en el figma pueden revisar el tamaño de cada sección dándole click)
    
    // Para los titulos (size: 20)
    func applyTitleFont(){
        self.font = UIFont(name: "Poppins-SemiBold", size: 20)
    }
    // Para los subtitulos (size: 18)
    func applySubtitleFont(){
        self.font = UIFont(name: "Poppins-SemiBold", size: 18)
    }
    
    func apply16Font(){
        self.font = UIFont(name: "Poppins-Medium", size: 16)
    }
    
    func apply14Font(){
        self.font = UIFont(name: "Poppins-Medium", size: 14)
    }
    
}
