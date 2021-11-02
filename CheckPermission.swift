//
//  checkPermission.swift
//  pickcamera
//
//  Created by 磯部馨仁 on 2021/11/02.
//

import Foundation
import Photos

class  CheckPermission{
    
    //ユーザにカメラの許可を促す。
    func checkCamera(){
        PHPhotoLibrary.requestAuthorization{(status) in
            switch(status){
            case .authorized:
                print("許可")
            case .notDetermined:
                print("未選択")
            case .restricted:
                print("restricted")
            case .denied:
                print("deied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
}
