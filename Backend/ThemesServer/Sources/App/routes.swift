import Vapor

func routes(_ app: Application) throws {
    
    app.get("themes", ":tag") { req -> String in
        guard let tag = req.parameters.get("tag", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return try getThemeJSON(with: tag, wordOfTheDay: "Akshay", clueForWordOfTheDay: "name")
    }
}

func getThemeJSON(with tag: Int, wordOfTheDay word: String, clueForWordOfTheDay clue: String) throws -> String  {
    let theme = Theme(wordOfTheDay: word, clue: clue)
    let jsonEncoder = JSONEncoder()
    let jsonData = try jsonEncoder.encode(theme)
    guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else {return "{}"}
    return "\(json) + \(tag)"
}
