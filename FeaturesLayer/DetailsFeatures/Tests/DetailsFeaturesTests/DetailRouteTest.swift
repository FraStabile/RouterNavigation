//
//  DetailRouteTest.swift
//  
//
//  Created by Francesco Stabile on 23/04/24.
//

import XCTest
import DetailsFeatures
import CoreLayer
final class DetailRouteTest: XCTestCase {
    var router = DetailMockRouter()
    override func setUpWithError() throws {
        DIContainer.current.container.register(String.self, name: "AppName") { _ in
            "AppName"
        }
    }

    func test_detail_route() {
        let anchor = AnchorResolver.createURL(host: "detail", path: "stepOne", props: 1)
        let route = router.resolve(url: anchor)
        XCTAssertNotNil(route)
        XCTAssertNotNil(route?.basePath, "detail")
        let props = Int(String(data: anchor.getProps()!, encoding: .utf8) ?? "")
        XCTAssertEqual(props, 1)
    }
}
