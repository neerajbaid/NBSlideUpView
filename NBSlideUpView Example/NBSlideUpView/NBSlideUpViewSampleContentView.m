#import "NBSlideUpViewSampleContentView.h"
#import "NBSlideUpView.h"

@implementation NBSlideUpViewSampleContentView

- (IBAction)sampleButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(slideUpViewSampleContentViewDidRequestAnimateOut:)]) {
        [self.delegate slideUpViewSampleContentViewDidRequestAnimateOut:self];
    }
}

@end
