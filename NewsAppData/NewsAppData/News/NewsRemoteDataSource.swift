//
//  NewsRemoteDataSource.swift
//  NewsAppData
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import NewsAppDomain

public protocol NewsRemoteDataSourceInterface {
    init (urlString: String)
    
    func searchForNews(by filter: String?, page: Int?, handler: @escaping (Result<NewsModel, NewsAppError>) -> Void)
}

public class NewsRemoteDataSource: NewsRemoteDataSourceInterface {
    let urlString: String
    
    required public init(urlString: String ) {
        self.urlString = urlString
    }
    
    public func searchForNews(by filter: String?, page: Int?, handler: @escaping (Result<NewsModel, NewsAppError>) -> Void) {
        guard let url = URL(string: "\(urlString)q=\(filter ?? "")&page=\(page ?? 1)") else {
            handler(.failure(NewsAppError.NotFound))
            return
        }
        
        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    handler(.failure(NewsAppError.BadRequest))
                case 404:
                    handler(.failure(NewsAppError.NotFound))
                case 500:
                    handler(.failure(NewsAppError.InternalServerError))
                default:
                    handler(.failure(NewsAppError.InternalServerError))
                }
             }
            
            guard let data = data else {
              if let error = error {
                handler(.failure(NewsAppError.UnknownError(message: error.localizedDescription)))
              }
              return
            }

            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(NewsModel.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(NewsAppError.WrongData))
            }
        }
        task.resume()
    }
}
