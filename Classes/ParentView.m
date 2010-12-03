//
//  ParentView.m
//  TrackTapOnAnimatedView
//
//  Created by georgkitz on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParentView.h"
#import <QuartzCore/QuartzCore.h>


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ParentView


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Setter/Getter


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Initialization

- (id)init {
	if(self = [super init]) {
		// Initialization code
		self.frame = CGRectMake(0, 120, 320, 32);
		self.backgroundColor = [UIColor greenColor];
		
		mAnimationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
		mAnimationView.backgroundColor = [UIColor yellowColor];
		[self addSubview:mAnimationView];
	}
	return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private Methods

- (BOOL)touchInBtnArea:(NSSet *)touches{
	if(mFlags.animating){
		CGPoint pos = [[mAnimationView.layer.presentationLayer valueForKeyPath:@"position"] CGPointValue];
		CGRect btnFrame = CGRectMake(pos.x - 5, pos.y - 5, 42, 42); //make the area a little bit wider, for better touch behavior
		UITouch *touch = [touches anyObject];
		CGPoint point = [touch locationInView:self];
		BOOL value = CGRectContainsPoint(btnFrame, point);
		return value;
	}else {
		UITouch *touch = [touches anyObject];
		CGPoint point = [touch locationInView:self];
		CGRect btnFrame = mAnimationView.frame;
		return CGRectContainsPoint(btnFrame, point);
	}
}

- (void)stop{
	mFlags.animating = NO;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public Methods

- (void)start{
	
	mFlags.animating = YES;
	
	mAnimationView.frame = CGRectMake(0, 0, 32, 32);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:10.0];
	[UIView setAnimationDidStopSelector:@selector(stop)];
	[UIView setAnimationDelegate:self];
	CGRect r = mAnimationView.frame;
	r.origin.x = 288;
	mAnimationView.frame = r;
	[UIView commitAnimations];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Overridden Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	[super touchesBegan:touches withEvent:event];
	
	if(mFlags.hit = [self touchInBtnArea:touches])
		[[NSNotificationCenter defaultCenter] postNotificationName:@"show" object:nil]; 
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	[super touchesMoved:touches withEvent:event];
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[super touchesEnded:touches withEvent:event];
	if(mFlags.hit){
		[[NSNotificationCenter defaultCenter] postNotificationName:@"hide" object:nil]; 
		mFlags.hit = NO;
	}
}


/*
// Only override layoutSubviews: if it is necessary
// An empty implementation adversely affects performance during animation.
- (void)layoutSubviews {
    [super layoutSubviews];
    // layout code
}
*/


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	// release your members
	[mAnimationView release];
	[super dealloc];
}

@end
