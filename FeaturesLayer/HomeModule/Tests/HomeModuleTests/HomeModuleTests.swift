import XCTest
@testable import HomeModule
import CoreLayer
final class HomeModuleTests: XCTestCase {
    var mockRouter = HomeMockRouter()
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func test_router_dashboard() {
        DIContainer.current.container.register(String.self, name: "AppName") { _ in
            "AppName"
        }
        let anchor = AnchorResolver.createURL(host: "home", path: "dashboard", props: HomeProps(name: "Ciao"), open: false)
        let route = mockRouter.resolve(url: anchor)
        XCTAssertNotNil(route)
        XCTAssertEqual(route?.basePath, "home")
        let props = try? JSONDecoder().decode(HomeProps.self, from: anchor.getProps()!)
        XCTAssertEqual(props?.name, "Ciao")
    }
}
