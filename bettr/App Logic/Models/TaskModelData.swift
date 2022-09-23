//
//  TaskModelData.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import Foundation


// Create array of tasks

var initTask: Task = Task(id: 1001, title: "Your First Task", state: false, description: "This is your first task, you can add other tasks or delete this one", dateSet: Date(), dateComplete: Date())
var secondTask: Task = Task(id: 1002, title: "Your Second Task", state: false, description: "This is your Second task, you can add other tasks or delete this one", dateSet: Date(), dateComplete: Date())
var tasks: [Task] = [initTask, secondTask]



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()

        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
