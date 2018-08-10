import XCTest

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var number: Int
    var tenant: Person?
    init(number: Int) {
        self.number = number
    }
}

class MemoryLeaksTests: XCTestCase {
    
    func testPersonIsReleased() {
        var bob: Person? = Person(name: "Bob")
        let apartment = Apartment(number: 123)
        apartment.tenant = bob
        bob = nil
        XCTAssertNil(bob)
        XCTAssertNil(apartment.tenant)
    }
    
}
