//
//  SortingViewController.swift
//  SortingHat
//
//  Created by MAVİ on 27.12.2021.
//

import UIKit

protocol SortingViewDelegate : AnyObject {
    func didFillNameField(name: String)
}

class SortingViewController: UIViewController {
    
    var randomImage = [UIImage(named: "slytherin"),
                       UIImage(named: "gryffindor"),
                       UIImage(named: "raverclaw"),
                       UIImage(named: "hufflepuff")]
    
    weak var delegate : SortingViewDelegate?
    
    var completion: ((_ image: UIImage) -> Void)?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showResult(_ sender: Any) {
        //delegate for the name
        let name = nameText.text!
        delegate?.didFillNameField(name: name)
        
        //closure for the image
        let random = Int.random(in: 0...3)
        guard let image = randomImage[random], let completion = completion else { return }
        completion(image)
        
        //notificaitoncenter for the surname
        let surname = surnameText.text!
        NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: "Surname"),
                    object: nil,
                    userInfo: ["surname" : surname]
                )
        
        dismiss(animated: true)
    }
    
}

