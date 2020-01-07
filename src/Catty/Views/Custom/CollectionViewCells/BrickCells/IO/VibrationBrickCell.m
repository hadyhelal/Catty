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

#import "VibrationBrickCell.h"
#import "VibrationBrick.h"

@interface VibrationBrickCell ()
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation VibrationBrickCell

+ (CGFloat)cellHeight
{
    return kBrickHeight1h;
}

- (void)hookUpSubViews:(NSArray *)inlineViewSubViews
{
    self.textLabel = inlineViewSubViews[0];
    self.secTextField = inlineViewSubViews[1];
}

- (NSString*)brickTitleForBackground:(BOOL)isBackground andInsertionScreen:(BOOL)isInsertion
{
    NSString* durationStr = kLocalizedSeconds;
    VibrationBrick *brick = (VibrationBrick*)self.scriptOrBrick;
    
    if (brick && [brick.durationInSeconds isSingularNumber]) {
        durationStr = kLocalizedSecond;
    }
    
    return [kLocalizedVibrateFor stringByAppendingString:[@" %@ " stringByAppendingString:durationStr]];
}

- (NSArray<NSString*>*)parameters
{
    return [[NSArray alloc] initWithObjects:@"{FLOAT;range=(-inf,inf)}", nil];
}

@end
