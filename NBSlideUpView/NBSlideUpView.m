//
//  CardView.m
//  gftbk
//
//  Created by Neeraj Baid on 3/21/14.
//  Copyright (c) 2014 Neeraj Baid. All rights reserved.
//

#import "NBSlideUpView.h"

@implementation NBSlideUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithSuperview:(UIView *)superview viewableHeight:(CGFloat)viewablePixels
{
    self.viewablePixels = viewablePixels;
    self.dragMultiplier = 3.0;
    CGRect frame = CGRectMake(0, superview.frame.size.height, superview.frame.size.width, self.viewablePixels + superview.frame.size.height/self.dragMultiplier);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        CGRect contentViewFrame = frame;
        contentViewFrame.origin.y = 0;
        UIView *contentView = [[UIView alloc] initWithFrame:contentViewFrame];
        [self addSubview:contentView];
        self.contentView = contentView;
        self.contentView.backgroundColor = [UIColor grayColor];
        self.contentView.layer.cornerRadius = 15;
        
        self.arrowAlpha = 0.7;
        
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"close.png"]];
        arrowImageView.alpha = self.arrowAlpha;
        CGRect arrowFrame = CGRectMake((superview.frame.size.width-37)/2.0, 11, 37, 10);
        arrowImageView.frame = arrowFrame;
        [self addSubview:arrowImageView];
        
        self.initialSpringVelocity = 1;
        self.animateInOutTime = 0.5;
        self.springDamping = 0.8;
        
        if ([superview isKindOfClass:[UIScrollView class]])
            self.superviewIsScrollView = YES;
        
        [superview addSubview:self];
    }
    return self;
}

- (void)setViewablePixels:(CGFloat)viewablePixels
{
    _viewablePixels = viewablePixels;
    if (self.superview)
    {
        CGRect frame = CGRectMake(0, self.superview.frame.size.height, self.superview.frame.size.width, viewablePixels + self.superview.frame.size.height/self.dragMultiplier);
        self.frame = frame;
        frame.origin.y = 0;
        self.contentView.frame = frame;
    }
}

# pragma mark - Touches/Dragging

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.superview];
    if (self.previousTouch.y == 0)
        _previousTouch = location;
    CGFloat translation = location.y - self.previousTouch.y;
    [self setCenter:CGPointMake(self.center.x, self.center.y + translation/self.dragMultiplier)];
    _previousTouch = location;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _previousTouch = CGPointMake(0, 0);
    if (self.frame.origin.y > self.superview.frame.size.height - self.viewablePixels)
        [self animateOut];
    else
        [self animateRestore];
}

- (void)animateIn
{
    [UIView animateWithDuration:self.animateInOutTime delay:0 usingSpringWithDamping:self.springDamping initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^(void)
     {
         self.frame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height - self.viewablePixels, self.frame.size.width, self.frame.size.height);
     } completion:^(BOOL completed){
         if (completed)
             [self.delegate slideUpViewDidAnimateIn:self];
     }];
}

- (void)animateOut
{
    [UIView animateWithDuration:self.animateInOutTime delay:0 usingSpringWithDamping:self.springDamping initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^(void)
     {
         if (self.superviewIsScrollView)
             self.frame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height + ((UIScrollView *)self.superview).contentOffset.y, self.frame.size.width, self.frame.size.height);
         else
             self.frame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height, self.frame.size.width, self.frame.size.height);
         
     } completion:^(BOOL completed) {
         if (completed)
             [self.delegate slideUpViewDidAnimateOut:self];
     }];
}

- (void)animateRestore
{
    [UIView animateWithDuration:self.animateInOutTime delay:0 usingSpringWithDamping:self.springDamping initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^(void)
     {
         if (self.superviewIsScrollView)
             self.frame = CGRectMake(self.frame.origin.x, ((UIScrollView *)self.superview).contentOffset.y + 120, self.frame.size.width, self.frame.size.height);
         else
             self.frame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height - self.viewablePixels, self.frame.size.width, self.frame.size.height);
     } completion:^(BOOL completed){
         if (completed)
             [self.delegate slideUpViewDidAnimateRestore:self];
     }];
}

@end
