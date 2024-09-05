//
//  NetworkCall.swift
//  ApiIntegration
//
//  Created by Prabh on 25/04/23.
//

import Foundation


class Network{
    func apiCall(url: String, httpMethods: ApiMethod,parameters: [String:Any]? = [:], complitionHandler: @escaping(Result<Data, Error>)-> (Void)){
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = httpMethods.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        if parameters!.count > 0{
            do{
                request.httpBody =  try JSONSerialization.data(withJSONObject: parameters )
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let data = data else{
                complitionHandler(.failure(error!))
                print(error?.localizedDescription)
                return
            }
            complitionHandler(.success(data))
            
        }.resume()
    }
}
