//
//  ZQAdsToolbar.m
//  AdsToolbarSample
//
//  Created by Jitkem on 7/2/2557 BE.
//  Copyright (c) 2557 ZQ Studio. All rights reserved.
//

#import "ZQAdsToolbar.h"

@implementation ZQAdsToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize result = [super sizeThatFits:size];
    
    UIDeviceOrientation currentOrientation = [[UIDevice currentDevice] orientation];
    
    if (currentOrientation == UIDeviceOrientationLandscapeRight ||
        currentOrientation == UIDeviceOrientationLandscapeLeft) {
        result.height = 32;
    } else {
        result.height = 50;
    }
    
    return result;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
