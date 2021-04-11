@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testThemesEndpoint() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        for i in 0...5 {
            try app.test(.GET, "themes/\(i)", afterResponse: { res in
                XCTAssertEqual(res.status, .ok)
                XCTAssertNotEqual(res.body.string, "{}")
            })
        }
    }
    
    func testThemesEndpointBadRequest() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        try app.test(.GET, "themes/%", afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        })
    }
    
    func testThemesInvalidReturnJSON() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        try app.test(.GET, "themes/6", afterResponse: { res in
            XCTAssertEqual(res.body.string, "{}")
        })
    }
}
