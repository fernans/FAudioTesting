//
//  FAudioTestingViewController.h
//  FAudioTesting
//
//  Created by Fernans on 03/06/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAudioWrapper.h"

@interface FAudioTestingViewController : UIViewController {
	IBOutlet UILabel* info;
	IBOutlet UITextField* file;
	IBOutlet UIView* panel;
	IBOutlet UIButton* quit;
	IBOutlet UISlider* frames;
	IBOutlet UISlider* buffers;
	IBOutlet UILabel* lframes;
	IBOutlet UILabel* lbuffers;
	IBOutlet UILabel* lInfo;
	FAudioWrapper* faudio;
	float w,h,x,y;
	int b,f;
}

- (void)onClick:(id)sender;
- (void)updateFAudio:(NSSet *)touches;
- (void)onQuitClick:(id)sender;
- (void)onBuffersSlide:(id)sender;
- (void)onFramesSlide:(id)sender;


@end

