//
//  ViewController.swift
//  filRouge
//
//  Created by Joris Thiery on 06/05/2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet var bottomContainerView: UIView!
    @IBOutlet var mailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var connectionButton: UIButton!
    @IBOutlet var dialogBubble: UIView!
    @IBOutlet var textLine1: UILabel!
    @IBOutlet var textLine2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupView()
    }

    func setupView() {
        
        var emailIcon = UIImageView()
        var imageMail = UIImage(named: "icoProfilDarkblue")
        emailIcon.image = imageMail
        mailTextfield.leftView = emailIcon
        mailTextfield.leftViewMode = UITextField.ViewMode.always
        
        var passwordIcon = UIImageView()
        var imagePassword = UIImage(named: "icoPasswordDarkblue")
        passwordIcon.image = imagePassword
        passwordTextfield.leftView = passwordIcon
        passwordTextfield.leftViewMode = UITextField.ViewMode.always

        bottomContainerView.backgroundColor = UIColor.systemGray5
        bottomContainerView.clipsToBounds = true
        bottomContainerView.layer.cornerRadius = 50
        bottomContainerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        mailTextfield.placeholder = "... ton email"
        mailTextfield.keyboardType = .emailAddress
        mailTextfield.delegate = self
        mailTextfield.textColor = .black
        mailTextfield.borderStyle = .line
        mailTextfield.backgroundColor = .white
        mailTextfield.layer.cornerRadius = mailTextfield.frame.size.height/2
        mailTextfield.layer.borderWidth = 1
        mailTextfield.layer.borderColor = UIColor.white.cgColor
        mailTextfield.clipsToBounds = true
        
        passwordTextfield.placeholder = "... ton mot de passe"
        passwordTextfield.keyboardType = .emailAddress
        passwordTextfield.delegate = self
        passwordTextfield.textColor = .black
        passwordTextfield.borderStyle = .line
        passwordTextfield.backgroundColor = .white
        passwordTextfield.layer.cornerRadius = passwordTextfield.frame.size.height/2
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderColor = UIColor.white.cgColor
        passwordTextfield.clipsToBounds = true

        connectionButton.setTitle("Se connnecter", for: .normal)
        connectionButton.setTitleColor(.white, for: .normal)
        connectionButton.backgroundColor = UIColor.systemGray2
        connectionButton.layer.cornerRadius = connectionButton.frame.size.height/2
        connectionButton.layer.borderWidth = 1
        connectionButton.layer.borderColor = UIColor.systemGray2.cgColor
        connectionButton.clipsToBounds = true
        
        dialogBubble.backgroundColor = .white
        dialogBubble.clipsToBounds = true
        dialogBubble.layer.cornerRadius = 40
        
        textLine1.text = "Hey! Komen ksé ?!"
        textLine1.textColor = .red
        textLine1.textAlignment = .center
        
        textLine2.text = "Allez... Connecte toi !"
        textLine2.textColor = .black
        textLine2.textAlignment = .center
      
    }

    @IBAction func didTapConnection() {

        if let myTabbarController = storyboard?.instantiateViewController(identifier: "CustomTabBarController") as? CustomTabBarController {
            myTabbarController.modalPresentationStyle = .fullScreen
            present(myTabbarController, animated: true, completion: nil)
        }
    }
    
    func validatedMail(mail: String) -> Bool {
        let mailRegex = "^([a-zA-Z0-9_\\-\\ .]+)@([a-zA-Z0-9_\\-\\ .]+)\\ .([a-zA-Z]{2,5})$"
        let trimmedString = mail.trimmingCharacters(in: .whitespaces)
        let validateMail = NSPredicate(format: "SELF MATCHES %@", mailRegex)
        let isValidateMail = validateMail.evaluate(with: trimmedString)
        return isValidateMail
    }
    
    func validatePassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePassword = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValidatePassword = validatePassword.evaluate(with: trimmedString)
        return isValidatePassword
    }
    
    
    
    
    /*func loginVerification(textfield: UITextField){
        if mailTextfield.text?.isEmpty ?? true || passwordTextfield.text?.isEmpty ?? true{
            connectionButton.backgroundColor = UIColor.blue
        }else{
            connectionButton.backgroundColor = UIColor.red
            
        }
    }*/
        
  
    

}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }
}

/*func loginVerification(mail:String?, password:String?) -> Bool{
    
    if mail?.isEmpty ?? true || password?.isEmpty ?? true{
        return false
    }else{
        if mail?.contains("@") ?? true{
            return true
        }
        return false
    }
}*/
