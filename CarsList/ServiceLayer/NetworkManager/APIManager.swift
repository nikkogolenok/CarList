//
//  APIManager.swift
//  CarsList
//
//  Created by Никита Коголенок on 15.06.23.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() { }

    let urlString = "https://xenr-r2up-tben.n7c.xano.io/api:6mbbF8N6/car"

    func downloadJson(completion: @escaping ([CarDatum]) -> ()) {
        guard let downloadURL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, response, error in
            guard let data = data, error == nil, response != nil else { print("something is wrong"); return }
            print("downloaded")
        
            do {
                let decoder = JSONDecoder()
                let downloadCars = try decoder.decode([CarDatum].self, from: data)
                completion(downloadCars)
            }
            catch {
                print("something wrong after downloaded")
            }
            
        }.resume()
    }
}
