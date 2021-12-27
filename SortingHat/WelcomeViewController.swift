//
//  WelcomeViewController.swift
//  SortingHat
//
//  Created by MAVİ on 27.12.2021.
//

import UIKit

// MARK: Used 3 method for communication
       //First one is delegate that has a string value for custom label nameLabel
       //Second one is closure that has a UIImage variable for change welcomeImage
       //And the Last one is notification center that has a string value for surnameLabel

class WelcomeViewController: UIViewController {

   @IBOutlet weak var houseImage: UIImageView!
   @IBOutlet weak var welcomeLabel: UILabel!
   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var surnameLabel: UILabel!
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       // NotificationCenter for take surname
       NotificationCenter.default.addObserver(
               self,
               selector:#selector(didSendInfo(_:)),
               name: NSNotification.Name(rawValue: "Surname"),
               object: nil
       )
   
   }
   deinit {
       NotificationCenter.default.removeObserver(self)
   }
   
   @IBAction func showSortingVCTapped(_ sender: UIButton) {
       
       //delegate for take the name
       let sortingVC = storyboard?.instantiateViewController(withIdentifier: "sortingVC") as! SortingViewController
       sortingVC.delegate = self
       
       //closure for take the UIImage
       sortingVC.completion = { [weak self] image in
           self?.houseImage.image = image
           if image == UIImage(named:"slytherin"){
            self?.slytherin()
           } else if image == UIImage(named:"gryffindor") {
            self?.gryffinfor()
           } else if image == UIImage(named:"raverclaw") {
            self?.raverclaw()
           } else if image == UIImage(named:"hufflepuff") {
            self?.hufflepuff()
           }
       }
       present(sortingVC, animated: true, completion: nil)
   }
   
   
   
   @objc func didSendInfo(_ notification: Notification){
       guard let surname = notification.userInfo?["surname"] as? String else { return }
       surnameLabel.text = " \(surname)"
   }

    func slytherin(){
        welcomeLabel.textColor = .systemGreen
        welcomeLabel.text = "Welcome to Slytherin"
        nameLabel.textColor = .systemGreen
        nameLabel.font = .systemFont(ofSize: 27.0)
        surnameLabel.textColor = .systemGreen
        surnameLabel.font = .systemFont(ofSize: 27.0)
    }
    func gryffinfor(){
        welcomeLabel.textColor = .orange
        welcomeLabel.text = "Welcome to Gryffindor"
        nameLabel.textColor = .orange
        nameLabel.font = .systemFont(ofSize: 27.0)
        surnameLabel.textColor = .orange
        surnameLabel.font = .systemFont(ofSize: 27.0)
    }
    func raverclaw(){
        welcomeLabel.textColor = .blue
        welcomeLabel.text = "Welcome to Raverclaw"
        nameLabel.textColor = .blue
        nameLabel.font = .systemFont(ofSize: 27.0)
        surnameLabel.textColor = .blue
        surnameLabel.font = .systemFont(ofSize: 27.0)
    }
    func hufflepuff(){
        welcomeLabel.textColor = .systemYellow
        welcomeLabel.text = "Welcome to Hufflepuff"
        nameLabel.textColor = .systemYellow
        nameLabel.font = .systemFont(ofSize: 27.0)
        surnameLabel.textColor = .systemYellow
        surnameLabel.font = .systemFont(ofSize: 27.0)
    }
   
}

extension WelcomeViewController: SortingViewDelegate {
   func didFillNameField(name: String) {
       nameLabel.text = "\(name) "
   }
}

