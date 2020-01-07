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

final class SetBackgroundBrickTests: AbstractBrickTest {

    func testSetBackgroundBrick() {
        let object = SpriteObject()
        let project = Project.defaultProject(withName: "a", projectID: "1")
        let spriteNode = CBSpriteNode(spriteObject: object)
        object.spriteNode = spriteNode
        object.project = project

        let backgroundObject = project.objectList.firstObject as! SpriteObject
        XCTAssertNotNil(backgroundObject)

        let bgSpriteNode = CBSpriteNode(spriteObject: object)
        backgroundObject.spriteNode = bgSpriteNode

        let bundle = Bundle(for: type(of: self))
        let filePath = bundle.path(forResource: "test.png", ofType: nil)
        let imageData = UIImage(contentsOfFile: filePath!)!.pngData()

        var look: Look!
        var look1: Look!
        do {
            look = Look(name: "test", andPath: "test.png")
            try imageData?.write(to: URL(fileURLWithPath: object.projectPath() + "images/test.png"))
            look1 = Look(name: "test2", andPath: "test2.png")
            try imageData?.write(to: URL(fileURLWithPath: object.projectPath() + "images/test2.png"))
        } catch {
            XCTFail("Error when writing image data")
        }

        let script = WhenScript()
        script.object = object
        let brick = SetBackgroundBrick()
        brick.script = script
        brick.look = look1

        object.lookList.add(look!)
        object.lookList.add(look1!)

        let action = brick.actionBlock()
        action()

        XCTAssertEqual(backgroundObject.spriteNode.currentLook, look1, "SetBackgroundBrick not correct")
        Project.removeProjectFromDisk(withProjectName: project.header.programName, projectID: project.header.programID)
    }
}
