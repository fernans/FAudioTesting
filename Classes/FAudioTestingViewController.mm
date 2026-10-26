//
//  FAudioTestingViewController.m
//  FAudioTesting
//
//  Created by Fernans on 03/06/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FAudioTestingViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation FAudioTestingViewController

- (void) onBuffersSlide:(id)sender {
	b=(int)buffers.value;
	[lbuffers setText:[NSString stringWithFormat: @"%d",b]];
	faudio->echoSetAmount(b, f);
}

- (void) onFramesSlide:(id)sender {
	f=(int)frames.value;
	[lframes setText:[NSString stringWithFormat: @"%d",f]];
	faudio->echoSetAmount(b, f);
}

- (void) onQuitClick:(UIButton *)sender {
	NSLog(@"quit");
	[self viewDidUnload];
}

- (void) onClick:(UISwitch *)sender {
	if (sender.isOn) {
		int r=-1;;
		//encender todo
		if ([file text].length>0) {
			NSString * path = [[NSBundle mainBundle] pathForResource: [file text] ofType: @"xml"];
			if (path!=nil) r=faudio->load([path cStringUsingEncoding:1]);
		}
		
		if (r!=-1) {// todo ok
			faudio->start();
			faudio->recStart();
			NSLog(@"grabando: %d\n",faudio->recEnabled());
			[file setEnabled:NO];
			[info setText:[file text] ];
		} else {
			// error cargando
			sender.on=NO;
			[info setText:@"Error cargando xml"];
		}
	} else {
		//guardar en disco
		faudio->recStop();
		NSLog(@"grabando: %d\n",faudio->recEnabled());
		NSString * path = [[NSBundle mainBundle] pathForResource: @"saved" ofType: @"wav"];
		
		// buscar seccion FAudio (raiz...)
		/*
#include <string>
		std::string basePathTemp(filename);
		basePathTemp=basePathTemp.substr(0,basePathTemp.rfind("/")+1);
		
		NSString * path2 = [[NSString alloc] initWithFormat:@"%s../saved.wav",basePathTemp]
		NSLog(path2);
		//*/
		
		if (path!=nil)
			faudio->recSave([path cStringUsingEncoding:1]);
		faudio->recClear();
		
		//apagar todo
		faudio->stop();
		faudio->clear();
		[file setEnabled:YES];
	}

}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
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
	w=panel.frame.size.width;
	h=panel.frame.size.height;
	faudio = new FAudioWrapper();
	faudio->initSession();
	b=3;
	f=10;
	faudio->echoSetAmount(b, f);
	[lbuffers setText:[NSString stringWithFormat: @"%d",b]];
	[lframes setText:[NSString stringWithFormat: @"%d",f]];
	
	UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
	AudioSessionSetProperty ( 
							 kAudioSessionProperty_OverrideAudioRoute,
							 sizeof (audioRouteOverride),
							 &audioRouteOverride	);
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
	NSLog(@"viewDidUnload");
	faudio->stop();
	faudio->clear();
	faudio->endSession();
	delete faudio;
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {[self updateFAudio:touches];}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {[self updateFAudio:touches];}

// - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {}

- (void)updateFAudio:(NSSet *)touches {
	UIView* vista=[[touches anyObject] view];
	if (vista.tag==5) {
		CGPoint location=[[touches anyObject] locationInView:vista];
		x=location.x/w;
		if (x>1) x=1; else if (x<0) x=0;
		faudio->setValue("X", x);
		y=location.y/h;
		if (y>1) y=1; else if (y<0) y=0;
		faudio->setValue("Y", y);
		//[info setText: [NSString stringWithFormat:@"X: %f\t\tY: %f",x,y]];
	}
}

@end
