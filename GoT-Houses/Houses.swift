//
//  Houses.swift
//  GoT-Houses
//
//  Created by Lindsay Penkrat on 4/16/21.
//

import Foundation

class Houses{
    
    private struct Returned: Codable {
        var name: String
        var region: String
        var coatOfArms: String
        var words: String
        
    }
    
    var houseArray: [HouseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    
    
    func getData (completed: @escaping ()-> ()) {
        
        let urlString = url
        
        //creates a url
        
        guard let url = URL (string: urlString) else {
            print (" ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        //creates a session
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print ("Error: \(error.localizedDescription)")
            }
            
            do {
                let returned = try JSONDecoder().decode([Returned].self, from: data!)
                print ("hi")
                print ("*** this is what we getData:  \(returned)")
            } catch {
                
            }
            completed()
        }
        task.resume()
    }
}
