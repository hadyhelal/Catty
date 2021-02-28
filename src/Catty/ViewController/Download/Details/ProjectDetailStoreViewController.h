/**
 *  Copyright (C) 2010-2021 The Catrobat Team
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

#import <UIKit/UIKit.h>
#import "ProjectStoreDelegate.h"
#import "CBFileManager.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import "BaseTableViewController.h"
#import "EVCircularProgressView.h"
#import "ButtonTags.h"
#import "RoundBorderedButton.h"

@class CatrobatProject;
@class StoreProjectDownloader;

@interface ProjectDetailStoreViewController : UIViewController<ProjectStoreDelegate, UIScrollViewDelegate, TTTAttributedLabelDelegate, NSURLConnectionDataDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) CatrobatProject *project;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollViewOutlet;
@property (nonatomic, strong) StoreProjectDownloader *storeProjectDownloader;
@property (nonatomic, strong) UIView *projectView;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
