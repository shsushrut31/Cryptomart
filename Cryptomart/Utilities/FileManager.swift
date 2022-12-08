//
//  FileManager.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-12-08.
//

import Foundation
import UIKit

class ImageFileManager {
    static let shared = ImageFileManager()
    private init() {}
    
    func save(image: UIImage, imageName: String, folderName: String) {
        createFolder(withName: folderName)
        
        guard let imageData = image.pngData(), let url = getURLForImage(imageName: imageName, folderName: folderName) else { return }
        
        do {
            try imageData.write(to: url)
        } catch let error {
            print("Error saving coin image: \(error.localizedDescription)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName), FileManager.default.fileExists(atPath: url.path()) else { return nil }
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolder(withName name: String) {
        guard let url = getPathToFolder(name: name) else { return }
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating folder: \(name). \(error)")
            }
        }
    }
    
    private func getPathToFolder(name: String) -> URL? {
       guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(name)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getPathToFolder(name: folderName) else { return nil }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
