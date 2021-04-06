import Vapor

func routes(_ app: Application) throws {
    
    app.get("themes", ":tag") { req -> String in
        guard let tag = req.parameters.get("tag", as: Int.self) else {
            throw Abort(.badRequest)
        }
        let theme = Theme(wordOfTheDay: "Hello", clue: "phone", type: "dictionary")
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(theme)
        guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else {return "invalid"}
        return "\(json) + \(tag)"
    }
}
