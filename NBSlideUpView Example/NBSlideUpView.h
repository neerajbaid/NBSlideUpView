//
//  CardView.h
//  gftbk
//
//  Created by Neeraj Baid on 3/21/14.
//  Copyright (c) 2014 Neeraj Baid. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NBSlideUpViewDelegate <NSObject>

- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView;

@end

@interface NBSlideUpView : UIView <UIAlertViewDelegate>

- (id)initWithSuperview:(UIView *)superview viewableHeight:(CGFloat)viewablePixels;
- (void)animateOut;
- (void)animateIn;

@property (nonatomic) CGPoint previousTouch;

@property (nonatomic) CGFloat viewablePixels;
@property (nonatomic) CGFloat dragMultiplier;
@property (nonatomic) CGFloat springDamping;
@property (nonatomic) CGFloat initialSpringVelocity;
@property (nonatomic) CGFloat arrowAlpha;
@property (nonatomic) CGFloat animateInOutTime;
@property (nonatomic) BOOL superviewIsScrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) id<NBSlideUpViewDelegate> delegate;

@end
