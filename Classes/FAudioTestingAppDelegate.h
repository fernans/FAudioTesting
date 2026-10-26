//
//  FAudioTestingAppDelegate.h
//  FAudioTesting
//
//  Created by Fernans on 03/06/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FAudioTestingViewController;

@interface FAudioTestingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FAudioTestingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FAudioTestingViewController *viewController;

@end

