//
//  ResponseParser.swift
//  bankodemia
//
//  Created by GiselaCamacho on 31/03/22.
//

import Foundation

class DataParser<DataToBeParsed: Codable> {
    lazy var decoder: JSONDecoder = JSONDecoder()
    func parseData(unparsedData: Data) -> DataToBeParsed? {
        do {
            let dataDecode: DataToBeParsed = try decoder.decode(DataToBeParsed.self, from: unparsedData)
            return dataDecode
        } catch {
            print(error)
            return nil
        }
    }
}

