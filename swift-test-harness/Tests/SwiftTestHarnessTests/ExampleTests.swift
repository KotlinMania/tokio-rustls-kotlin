#if canImport(Testing)
import Testing
import TokioRustls

@Suite("TokioRustls Swift Export Tests")
struct TokioRustlsExportTests {
    @Test("TokioRustls swift module imported cleanly")
    func testSwiftModuleLoads() throws {
        #expect(Bool(true), "TokioRustls swift module imported cleanly")
    }
}
#elseif canImport(XCTest)
import XCTest
import TokioRustls

final class TokioRustlsExportTests: XCTestCase {
    func testSwiftModuleLoads() throws {
        XCTAssertTrue(true, "TokioRustls swift module imported cleanly")
    }
}
#endif
