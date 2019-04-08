//
//  DIOAd.h
//  DIOSDK
//
//  Created by Ariel Malka on 2/25/19.
//  Copyright © 2019 Display.io. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DIOAdEvent) {
    DIOAdEventOnShown,
    DIOAdEventOnFailedToShow,
    DIOAdEventOnClicked,
    DIOAdEventOnClosed,
    DIOAdEventOnAdCompleted
};

@interface DIOAd : NSObject

@property (nonatomic, strong) NSString *placementId;
@property (nonatomic, strong) NSString *requestId;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) id data;
@property (nonatomic, strong) id offering;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic) BOOL loaded;
@property (nonatomic) BOOL impressed;
@property (nonatomic) BOOL isInterstitial;

/**
 Shows an ad.
 
 @param controller The current view controller.
 @param eventHandler A block object to be executed when an event occur. This block takes one argument: the event type.
 @see DIOAdEvent enum
 */
- (void)showAdFromViewController:(UIViewController*)controller eventHandler:(void (^)(DIOAdEvent event))eventHandler;

- (void)preloadWithLoadedHandler:(void (^)(void))loadedHandler errorHandler:(void (^)(NSString *message))errorHandler noFillHandler:(void (^)(void))noFillHandler;
- (void)finish;

@end

NS_ASSUME_NONNULL_END
