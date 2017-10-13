//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by general on 11.10.17.
//  Copyright © 2017 general. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    //MARK: Properties
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var locationImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       nameField.delegate = self
    }
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        
        nameField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        locationName.text = nameField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info   [UIImagePickerControllerOriginalImage] as?
        UIImage else {
        fatalError("Expected a dictionary containing an image but was providing the following : \(info)")
                }
        locationImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    //MARK:ACTIONS

    @IBAction func selectImageAction(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
        //UIImagePickerController lets picking image
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    @IBAction func setDefaultLocation(_ sender: UIButton) {
        locationName.text = "Default Text"
    }
    
}

