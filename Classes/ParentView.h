//
//  ParentView.h
//  TrackTapOnAnimatedView
//
//  Created by georgkitz on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*!
 @class       ParentView
 @abstract  
 @discussion
 */
@interface ParentView : UIView {
	UIView *mAnimationView;
	
	struct {
		unsigned int animating:1;
		unsigned int hit:1;
	}mFlags;
}

- (void)start;

@end
