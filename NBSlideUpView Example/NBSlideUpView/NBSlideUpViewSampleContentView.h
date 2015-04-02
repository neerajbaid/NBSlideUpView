#import <UIKit/UIKit.h>

@class NBSlideUpViewSampleContentView;
@protocol NBSlideUpViewSampleContentViewDelegate <NSObject>

@optional

- (void)slideUpViewSampleContentViewDidRequestAnimateOut:(NBSlideUpViewSampleContentView *)slideUpViewSampleContentView;

@end

@interface NBSlideUpViewSampleContentView : UIView

@property (nonatomic, weak) id<NBSlideUpViewSampleContentViewDelegate> delegate;

@end
