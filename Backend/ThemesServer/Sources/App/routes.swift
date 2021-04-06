import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("getTheme") { req -> String in
        let theme = Theme(wordOfTheDay: "Hello", clue: "phone", type: "dictionary")
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(theme)
        guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else {return "invalid"}
        return json
    }
}
