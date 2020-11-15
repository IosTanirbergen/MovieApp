//
//  MovieFetchData.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import Foundation
import Alamofire

class Networking: NSObject {
    var mv : [Movie] = [Movie]()
    static let refreshController = UIRefreshControl()
    static let shareInstance = Networking()
    static let path = Bundle.main.path(forResource: "config", ofType: "plist")
    static let config = NSDictionary(contentsOfFile: path!)
    private let url = config!["ServerURL"] as! String
    
    func getMovieData(completion: @escaping([Results]?, Error?) -> ()){
        AF.request(url,method: .get,parameters: nil).response {
            response in
            switch response.result {
                case .success(let data):
                    do {
                        var arrMovieData = [Results]()
                        let result = try JSONDecoder().decode(Movie.self, from: data!)
                        arrMovieData.append(contentsOf: result.results!)
                        completion(arrMovieData,nil)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}
