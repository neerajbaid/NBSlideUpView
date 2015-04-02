#import <UIKit/UIKit.h>

@protocol NBSlideUpViewDelegate <NSObject>

@optional

- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView;

@end

@interface NBSlideUpView : UIView <UIAlertViewDelegate>

- (id)initWithSuperview:(UIView *)superview viewableHeight:(CGFloat)viewablePixels;
- (void)animateOut;
- (void)animateIn;

@property (nonatomic) CGFloat arrowAlpha;

@property (nonatomic) CGFloat viewablePixels;
@property (nonatomic) CGFloat dragMultiplier;

@property (nonatomic) CGFloat springDamping;
@property (nonatomic) CGFloat initialSpringVelocity;
@property (nonatomic) CGFloat animateInOutTime;

@property (nonatomic) BOOL shouldDarkenSuperview;
@property (nonatomic) BOOL shouldTapSuperviewToAnimateOut;
@property (nonatomic) BOOL shouldBlockSuperviewTouchesWhileUp;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) id<NBSlideUpViewDelegate> delegate;

@end
