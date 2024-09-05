//
//  ApiManager.swift
//  ApiIntegration
//
//  Created by Prabh on 22/04/23.
//

import Foundation

class ApiManager{
    static let shared = ApiManager()
    let errorHandler = ErroHandler()
let network = Network()
    func postAPi(parametrs: [String: Any], complition: @escaping(_ response: PostResponseModel)-> Void){
        network.apiCall(url: postUrl, httpMethods: .POST, parameters: parametrs){response in
            switch(response){
            case .success(let data):
                do{
                    let result = try JSONDecoder().decode(PostResponseModel.self, from: data)
                    complition(result)
                    print(result)
                }
                catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                
                print(error)
            }
            
            
        }
    }
    

}
