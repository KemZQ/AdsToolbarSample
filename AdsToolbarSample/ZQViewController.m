//
//  ZQViewController.m
//  AdsToolbarSample
//
//  Created by Jitkem on 7/2/2557 BE.
//  Copyright (c) 2557 ZQ Studio. All rights reserved.
//

#import "ZQViewController.h"

@interface ZQViewController ()

@end

@implementation ZQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    portraitBannerImage = [UIImage imageNamed:@"banner320x50"];
    landscapeBannerImage = [UIImage imageNamed:@"banner568x32"];
	
    UIDeviceOrientation currentOrientation = [[UIDevice currentDevice] orientation];
    
    if (currentOrientation == UIDeviceOrientationLandscapeRight ||
        currentOrientation == UIDeviceOrientationLandscapeLeft) {
        bannerView = [[UIImageView alloc] initWithImage:landscapeBannerImage];
    } else {
        bannerView = [[UIImageView alloc] initWithImage:portraitBannerImage];
    }
    
    // Make image fit the view
    [bannerView setContentMode:UIViewContentModeScaleAspectFit];
    
    // Add it to toolbar view
    [self.navigationController.toolbar addSubview:bannerView];
    
    
    
}

- (void)loadView
{
    [super loadView];
    
    // Width constraint, equal to parent view width
    [bannerView addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationController.toolbar
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:bannerView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1
                                                            constant:0]];
    
    // Height constraint, equal to parent view height
    [bannerView addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationController.toolbar
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:bannerView
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:1
                                                            constant:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        // Will rotate to Landscape
        [bannerView setImage:landscapeBannerImage];
    } else {
        // Will rotate to Portrait
        [bannerView setImage:portraitBannerImage];
    }
    
    CGRect newFrame = bannerView.frame;
    newFrame.size = self.navigationController.toolbar.frame.size;
    bannerView.frame = newFrame;
}


@end
