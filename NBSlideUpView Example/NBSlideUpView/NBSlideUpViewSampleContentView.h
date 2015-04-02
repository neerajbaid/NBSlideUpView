#import <UIKit/UIKit.h>

@class NBSlideUpViewSampleContentView;
@protocol NBSlideUpViewSampleContentViewDelegate <NSObject>

@optional

- (void)slideUpViewSampleContentViewDidRequestAnimateOut:(NBSlideUpViewSampleContentView *)slideUpViewSampleContentView;

@end

@interface NBSlideUpViewSampleContentView : UIView

- (instancetype)initWithDelegate:(id<NBSlideUpViewSampleContentViewDelegate>)delegate;

@property (nonatomic, weak) id<NBSlideUpViewSampleContentViewDelegate> delegate;

@end
