//
//  ViewController.m
//  iOSSample
//
//  Created by Ariel Malka on 4/8/19.
//  Copyright © 2019 Display.io. All rights reserved.
//

#import "ViewController.h"
#import "PlacementType.h"
#import "PlacementViewController.h"

#import <DIOSDK/DIOController.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *appId = @"7522";
    
    id data = @[@{@"id": @"4788", @"type": [NSNumber numberWithInt:PlacementTypeInterstitial]}, // Video
                @{@"id": @"5426", @"type": [NSNumber numberWithInt:PlacementTypeBannerInFeed]}, // Video
                @{@"id": @"5426", @"type": [NSNumber numberWithInt:PlacementTypeBannerStatic]}, // Video
                @{@"id": @"5427", @"type": [NSNumber numberWithInt:PlacementTypeInterstitial]}, // Html
                @{@"id": @"5362", @"type": [NSNumber numberWithInt:PlacementTypeBannerInFeed]}, // Html
                @{@"id": @"5362", @"type": [NSNumber numberWithInt:PlacementTypeBannerStatic]}]; // Html

    [[DIOController sharedInstance] initializeWithAppId:appId completionHandler:^{
        NSLog(@"CONTROLLER INITIALIZED");
        
        PlacementViewController *placementViewController = [PlacementViewController new];
        placementViewController.data = data;
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:placementViewController];
        navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:navigationController animated:NO completion:nil];
    } errorHandler:^(NSString *error) {
        NSLog(@"ON INIT WITH ERROR: %@", error);
    }];
}

@end
