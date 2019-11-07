/**
 *  Copyright (C) 2010-2019 The Catrobat Team
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

final class ThinkForBubbleCellBrickTests: XCTestCase {

    var brick: ThinkForBubbleBrick!
    var brickCell: ThinkForBubbleBrickCell!

    override func setUp() {
        super.setUp()

        brick = ThinkForBubbleBrick()
        brickCell = ThinkForBubbleBrickCell()
        brickCell.scriptOrBrick = brick
    }

    func testTitleSingular() {
        let expectedTitle = kLocalizedThink + " %@\n" + kLocalizedFor + " %@ " + kLocalizedSecond

        brick.intFormula = Formula(double: 1)

        XCTAssertEqual(expectedTitle, brickCell.brickTitle(forBackground: true, andInsertionScreen: true))
        XCTAssertEqual(expectedTitle, brickCell.brickTitle(forBackground: false, andInsertionScreen: false))
    }

    func testTitlePlural() {
        let expectedTitle = kLocalizedThink + " %@\n" + kLocalizedFor + " %@ " + kLocalizedSeconds

        brick.intFormula = Formula(double: 2)

        XCTAssertEqual(expectedTitle, brickCell.brickTitle(forBackground: true, andInsertionScreen: true))
        XCTAssertEqual(expectedTitle, brickCell.brickTitle(forBackground: false, andInsertionScreen: false))
    }
}
