    //
//  mainViewController.m
//  mailSender
//
//  Created by maliy on 7/13/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import "mainViewController.h"


@implementation mainViewController

#pragma mark lifeCycle

- (id) init
{
	if (self = [super init])
	{
		self.navigationItem.title = NSLocalizedString(@"Send mail test", @"");
	}
	return self;
}

- (void) dealloc
{
	
	[super dealloc];
}


#pragma mark -

- (void) sendMailBtn:(id) sender
{
	if (![MFMailComposeViewController canSendMail])
	{
		UIAlertView *tmp = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Warning", @"")
													  message:NSLocalizedString(@"Your e-mail application not configured", @"")
													 delegate:nil
											cancelButtonTitle:NSLocalizedString(@"OK", @"")
											otherButtonTitles:nil];
		[tmp show];
		[tmp release];
		return ;
	}
	
	
	MFMailComposeViewController *mcvc = [[MFMailComposeViewController alloc] init];
	mcvc.mailComposeDelegate = self;
	[mcvc setToRecipients:[NSArray arrayWithObject:@"2derand+mailSender@gmail.com"]];
	[mcvc setSubject:NSLocalizedString(@"Testing mail", @"")];
	[mcvc setMessageBody:NSLocalizedString(@"This is body of mail", @"") isHTML:NO];
	[mcvc addAttachmentData:[@"Text on attach" dataUsingEncoding: NSUTF8StringEncoding]
				   mimeType:@"text/plain"
				   fileName:@"test.txt"];
	[self presentModalViewController:mcvc animated:YES];
}

#pragma mark MFMailComposeViewControllerDelegate
- (void) mailComposeController:(MFMailComposeViewController*) controller
		   didFinishWithResult:(MFMailComposeResult) result error:(NSError*) error
{
	[controller dismissModalViewControllerAnimated:YES];
}


#pragma mark -

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	[super loadView];
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	
	UIView *contentView = [[UIView alloc] initWithFrame:screenRect];
	contentView.autoresizesSubviews = YES;
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	contentView.backgroundColor = [UIColor whiteColor];
	
	self.view = contentView;
	[contentView release];
	
	UIBarButtonItem *mailBtn = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Send mail", @"")
																  style:UIBarButtonItemStylePlain
																 target:self action:@selector(sendMailBtn:)];
	self.navigationItem.rightBarButtonItem = mailBtn;
	[mailBtn release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
