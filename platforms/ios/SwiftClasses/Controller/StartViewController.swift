//
//  StartViewController.swift
//  CordovaApp
//
//  Created by Swetha Sreekanth on 15/8/20.
//

import Foundation
import UIKit
import Alamofire

class StartViewController: UIViewController {
    
    var file: FileManager = FileManager()
        
    init() {
        super.init(nibName: "StartViewController", bundle: Bundle.main)
    }
    
    @IBAction func buttonClic(_ sender: Any) {
        let newVC = MainViewController()
        self.navigationController?.pushViewController(newVC, animated: false)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadIndexFile()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func downloadIndexFile() {
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileURL = documentsURL.appendingPathComponent("index.html")
                print("fileURL.....\(fileURL)")
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        AF.download("https://sg-mb-kony.s3-ap-southeast-1.amazonaws.com/CETEAM/index.html", to: destination).response { response in
            debugPrint(response)

            if response.error == nil, let path = response.fileURL?.path {
                
            }
        }
    }
}
