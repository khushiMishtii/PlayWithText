//
//  DashboardViewController.h
//  PlayWithText
//
//  Created by Khushboo Sharma on 9/26/14.
//  Copyright (c) 2014 Razorfish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DashboardViewController : UIViewController <AVSpeechSynthesizerDelegate>


@property(strong,nonatomic)AVSpeechSynthesizer *synthesizer;


@end
