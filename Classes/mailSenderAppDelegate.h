//
//  mailSenderAppDelegate.h
//  mailSender
//
//  Created by maliy on 7/13/10.
//  Copyright interMobile 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mailSenderAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

