//
//  ViewController.swift
//  pickcamera
//
//  Created by 磯部馨仁 on 2021/11/02.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var cameraImage: UIImageView!
    
    var checPermission = CheckPermission()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checPermission.checkCamera()
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraButton(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
    }
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker,animated: true,completion: nil)
    }
    //撮影がキャンセルなった時
    func imageaPickControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let pickerImage = info[.originalImage] as? UIImage {
            cameraImage.image = pickerImage
            
            picker.dismiss(animated: true, completion: nil)
            
        }
    }
    
}

