#import "NBSlideUpViewSampleContentView.h"
#import "NBSlideUpView.h"

@implementation NBSlideUpViewSampleContentView

- (IBAction)sampleButton:(id)sender {
    [((NBSlideUpView *)self.superview.superview) animateOut];
}

@end
