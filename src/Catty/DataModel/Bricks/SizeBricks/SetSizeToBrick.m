/**
 *  Copyright (C) 2010-2014 The Catrobat Team
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


#import "SetSizeToBrick.h"
#import "Formula.h"
#import "GDataXMLNode.h"

@implementation SetSizeToBrick

- (NSString*)brickTitle
{
    return kLocalizedSetSizeTo;
}

- (SKAction*)action
{
    return [SKAction runBlock:[self actionBlock]];
}

-(dispatch_block_t)actionBlock
{
    return ^{
        NSDebug(@"Performing: %@", self.description);
        double sizeInPercent = [self.size interpretDoubleForSprite:self.object];
        [self.object setXScale:(CGFloat)(sizeInPercent/100.0f)];
        [self.object setYScale:(CGFloat)(sizeInPercent/100.0f)];
        //for touch issue
        CGImageRef image = [self.object.currentUIImageLook CGImage];
        self.object.currentUIImageLook = [UIImage imageWithCGImage:image scale:(CGFloat)(1.0f/(sizeInPercent/100.0f)) orientation:UIImageOrientationUp];
    };
    
}

#pragma mark - Description
- (NSString*)description
{
    return [NSString stringWithFormat:@"SetSizeTo (%f%%)", [self.size interpretDoubleForSprite:self.object]];
}

- (GDataXMLElement*)toXMLforObject:(SpriteObject*)spriteObject
{
    GDataXMLElement *brickXMLElement = [super toXMLforObject:spriteObject];
    if (self.size) {
        GDataXMLElement *sizeXMLElement = [GDataXMLNode elementWithName:@"size"];
        [sizeXMLElement addChild:[self.size toXMLforObject:spriteObject]];
        [brickXMLElement addChild:sizeXMLElement];
    } else {
        // remove object reference
        [brickXMLElement removeChild:[[brickXMLElement children] firstObject]];
    }
    return brickXMLElement;
}

@end