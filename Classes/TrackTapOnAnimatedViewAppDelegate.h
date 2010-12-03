//
//  TrackTapOnAnimatedViewAppDelegate.h
//  TrackTapOnAnimatedView
//
//  Created by georgkitz on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrackTapOnAnimatedViewViewController;

@interface TrackTapOnAnimatedViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TrackTapOnAnimatedViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TrackTapOnAnimatedViewViewController *viewController;

@end

