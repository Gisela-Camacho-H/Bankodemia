//
//  Response.swift
//  bankodemia
//
//  Created by GiselaCamacho on 31/03/22.
//

import Foundation

enum Response {
    case success(Data)
    case fail(NetworkError?,Error?)
}
