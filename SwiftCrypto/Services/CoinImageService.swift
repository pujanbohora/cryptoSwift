//
//  CoinImageService.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/12/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image:UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinDatum
    private let filemanager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName :String
    
    
    init(coin: CoinDatum) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        
        if let savedImage = filemanager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            downloadCoinImage(url: coin.image)
            print("Downloading image now")
        }
    }
    
    private func downloadCoinImage(url: String) {
        
        guard let url = URL(string: url) else { return }
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else {return }
                self.image = downloadedImage
                ///Cancels the request
                 self.imageSubscription?.cancel()
                self.filemanager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
                }
            )
    }
}
