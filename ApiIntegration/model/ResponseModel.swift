//
//  ResponseModel.swift
//  ApiIntegration
//
//  Created by Prabh on 23/04/23.
//

import Foundation
struct PostResponseModel: Codable {

    let userId: Int
    let id: Int
    let title: String
    let body: String

}
