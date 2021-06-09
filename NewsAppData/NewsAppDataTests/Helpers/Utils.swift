//
//  Utils.swift
//  NewsAppDataTests
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import Foundation
@testable import NewsAppData

public class Utils {
    
    public static func readLocalFile(forName name: String) -> Data? {
        
        let currentBundle = Bundle(for: self)
        
        do {
            if let bundlePath = currentBundle.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil

    }
    
    public static func parse(jsonData: Data) -> NewsModel? {
        do {
            let decodedData = try JSONDecoder().decode(NewsModel.self,
                                                       from: jsonData)
            return decodedData
            
        } catch {
            return nil
        }
    }
}
