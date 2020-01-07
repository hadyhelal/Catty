/**
 *  Copyright (C) 2010-2020 The Catrobat Team
 *  (http://developer.catrobat.org/credits)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  An additional term exception under section 7 of the GNU Affero
 *  General Public License, version 3, is available at
 *  (http://developer.catrobat.org/license_additional_term)
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 */

import XCTest

@testable import Pocket_Code

class EqualOperatorTest: XCTestCase {

    var op: EqualOperator!

    override func setUp() {
        super.setUp()
        op = EqualOperator()
    }

    override func tearDown() {
        op = nil
        super.tearDown()
    }

    func testValue() {
        XCTAssertTrue(op.value(left: 0 as AnyObject, right: 0 as AnyObject))
        XCTAssertFalse(op.value(left: "a" as AnyObject, right: "b" as AnyObject))
        XCTAssertTrue(op.value(left: "a" as AnyObject, right: "a" as AnyObject))
        XCTAssertTrue(op.value(left: "1" as AnyObject, right: "1" as AnyObject))
        XCTAssertTrue(op.value(left: "1.0" as AnyObject, right: "1" as AnyObject))
        XCTAssertFalse(op.value(left: "1" as AnyObject, right: "abc" as AnyObject))
        XCTAssertTrue(op.value(left: "1" as AnyObject, right: 1 as AnyObject))
        XCTAssertFalse(op.value(left: "0" as AnyObject, right: 1 as AnyObject))
        XCTAssertTrue(op.value(left: 2 as AnyObject, right: 2 as AnyObject))
        XCTAssertTrue(op.value(left: "abc" as AnyObject, right: "abc" as AnyObject))
        XCTAssertTrue(op.value(left: 0.001 as AnyObject, right: 0.001 as AnyObject))
        XCTAssertFalse(op.value(left: 0 as AnyObject, right: "some text" as AnyObject))
        XCTAssertFalse(op.value(left: "some text" as AnyObject, right: 0 as AnyObject))
    }

    func testPriority() {
        XCTAssertGreaterThan(type(of: op).priority, AndOperator.priority)
        XCTAssertGreaterThan(type(of: op).priority, OrOperator.priority)
        XCTAssertLessThan(type(of: op).priority, PlusOperator.priority)
    }

    func testFormulaEditorSections() {
        let sections = op.formulaEditorSections()
        XCTAssertEqual(1, sections.count)
        XCTAssertTrue(sections.contains(.logic(position: type(of: op).position)))
    }
}
