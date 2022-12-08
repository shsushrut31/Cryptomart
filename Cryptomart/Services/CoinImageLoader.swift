//
//  CoinImageLoader.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-12-08.
//

import Foundation
import SwiftUI
import Combine

class CoinImageLoader {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = ImageFileManager.shared
    private let imageName: String
    private let folderName = "coin_images"
    
    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        self.getCoinImage()
    }
    
    private func getCoinImage() {
        if let image = fileManager.getImage(imageName: imageName, folderName: folderName) {
            self.image = image
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(from: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handle, receiveValue: { [weak self] image in
                guard let self = self, let downloadedImage = image else { return }
                self.image = downloadedImage
                self.fileManager.save(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
                self.imageSubscription?.cancel()
            })
    }
}
