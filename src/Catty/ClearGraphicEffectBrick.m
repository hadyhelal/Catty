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

#import "ClearGraphicEffectBrick.h"
#import "Look.h"
#import "Formula.h"

@implementation ClearGraphicEffectBrick

- (NSString*)brickTitle
{
    return kBrickCellLookTitleClearGraphicEffect;
}

- (SKAction*)action
{
    return [SKAction runBlock:[self actionBlock]];
}

- (dispatch_block_t)actionBlock
{
    return ^{
        NSLog(@"performing");
        NSDebug(@"Performing: %@", self.description);
        Look* look = [self.object currentLook];
        UIImage* image = [UIImage imageWithContentsOfFile:[self pathForLook:look]];
        SKTexture* texture = [SKTexture textureWithImage:image];
        self.object.currentUIImageLook = image;
        self.object.currentLookBrightness = 0;
        self.object.alpha = 1.0f;
        double xScale = self.object.xScale;
        double yScale = self.object.yScale;
        self.object.xScale = 1.0;
        self.object.yScale = 1.0;
        self.object.size = texture.size;
        self.object.texture = texture;
        self.object.currentLook = look;
        if(xScale != 1.0) {
            self.object.xScale = (CGFloat)xScale;
        }
        if(yScale != 1.0) {
            self.object.yScale = (CGFloat)yScale;
        }
        
    };
}
-(NSString*)pathForLook:(Look*)look
{
    return [NSString stringWithFormat:@"%@images/%@", [self.object projectPath], look.fileName];
}

#pragma mark - Description
- (NSString*)description
{
    return [NSString stringWithFormat:@"ClearGraphicEffect"];
}

@end
