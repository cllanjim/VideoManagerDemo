//
//  KNViewController.m
//  VideoManagerDemo
//
//  Created by Choi Yeong Hyeon on 12. 10. 1..
//  Copyright (c) 2012년 Choi Yeong Hyeon. All rights reserved.
//

#import "KNViewController.h"


@interface KNViewController ()

@end

@implementation KNViewController
@synthesize viewPreview     = _viewPreview;
@synthesize videoMgr        = _videoMgr;
@synthesize viewImg         = _viewImg;
@synthesize images          = _images;
@synthesize viewDbgImg      = _viewDbgImg;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.images = [[NSMutableArray alloc] initWithCapacity:5];
    self.videoMgr = [[KNVideoCapture alloc] init];
    [_videoMgr setAutoTorchMode:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)captureStart:(id)sender {
    
    [_videoMgr startVideoWithPreview:_viewPreview
                           frameRate:5
                          resolution:kKNCaptureMedium
               withCaptureCompletion:^(UIImage *img)
    {

        NSLog(@"%d %d", (int)img.size.width, (int)img.size.height);
        _viewImg.image = img;
    }];
    
}

- (IBAction)captureStop:(id)sender {
    [_videoMgr stopVideo];
}

- (IBAction)previeGravity:(id)sender {
    
    UISegmentedControl* seg = (UISegmentedControl *)sender;
    
    kKNPreviewGravity g = kKNGravityResizeToFit;
    switch (seg.selectedSegmentIndex) {
        case 0:
            g = kKNGravityResizeToFit;
            break;

        case 1:
            g = kKNGravityAspectFit;
            break;

        case 2:
            g = kKNGravityAspectFill;
            break;
    }
    [_videoMgr previewVideoGravity:g];
}

- (IBAction)cameraOrientation:(id)sender {

    UISegmentedControl* seg = (UISegmentedControl *)sender;
    
    kKNCameraPosition pos = kKNCameraOff;
    switch (seg.selectedSegmentIndex) {
        case 0:
            pos = kKNCameraFront;
            break;
            
        case 1:
            pos = kKNCameraBack;
            break;

        case 2:
            pos = kKNCameraOff;
            break;

    }
    [_videoMgr changeCameraPosition:pos];
}

- (IBAction)frameRate:(id)sender {
    [_videoMgr changeCaptureFrameRate:1];
}

- (IBAction)resolution:(id)sender {
    
    UISegmentedControl* seg = (UISegmentedControl *)sender;
    
    kKNCaptureResolution rs = kKNCaptureHigh;
    switch (seg.selectedSegmentIndex) {
        case 0:
            rs = kKNCaptureHigh;
            break;
            
        case 1:
            rs = kKNCaptureMedium;
            break;

        case 2:
            rs = kKNCaptureLow;
            break;

        case 3:
            rs = kKNCapture480;
            break;

        case 4:
            rs = kKNCapture720;
            break;
    }
    [_videoMgr changeCaptureResolution:rs];
}


- (IBAction)torch:(id)sender {
    [_videoMgr totchToggle];

}


@end
