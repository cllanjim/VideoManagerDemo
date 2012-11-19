//
//  KNViewController.h
//  VideoManagerDemo
//
//  Created by Choi Yeong Hyeon on 12. 10. 1..
//  Copyright (c) 2012년 Choi Yeong Hyeon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KNVideoCapture.h"

@interface KNViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView* viewPreview;
@property (strong, nonatomic) IBOutlet UIImageView* viewImg;
@property (strong, nonatomic) IBOutlet UIImageView* viewDbgImg;
@property (strong, nonatomic) KNVideoCapture* videoMgr;
@property (strong, nonatomic) NSMutableArray* images;

- (IBAction)captureStart:(id)sender;
- (IBAction)captureStop:(id)sender;
- (IBAction)previeGravity:(id)sender;
- (IBAction)cameraOrientation:(id)sender;
- (IBAction)frameRate:(id)sender;
- (IBAction)resolution:(id)sender;
- (IBAction)torch:(id)sender;

@end
