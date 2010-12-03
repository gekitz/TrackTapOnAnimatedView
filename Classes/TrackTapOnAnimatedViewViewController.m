//
//  TrackTapOnAnimatedViewViewController.m
//  TrackTapOnAnimatedView
//
//  Created by georgkitz on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TrackTapOnAnimatedViewViewController.h"
#import "ParentView.h"

@implementation TrackTapOnAnimatedViewViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show) name:@"show" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hide) name:@"hide" object:nil];
	
	ParentView *p = [[ParentView alloc] init];
	[self.view addSubview:p];
	
	UIButton *start = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[start setTitle:@"Start" forState:UIControlStateNormal];
	[start addTarget:p action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
	[start setFrame:CGRectMake(10, 280, 300, 32)];
	[self.view addSubview:start];
	
	mLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 22)];
	mLabel.text = @"No Hit";
	mLabel.textAlignment = UITextAlignmentCenter;
	mLabel.backgroundColor = [UIColor redColor];
	[self.view addSubview:mLabel];
	
	[p release];
}

- (void)show{
	mLabel.text = @"HIT";
	mLabel.backgroundColor = [UIColor greenColor];
}

- (void)hide{
	mLabel.text = @"No Hit";
	mLabel.backgroundColor = [UIColor redColor];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mLabel release];
    [super dealloc];
}

@end
