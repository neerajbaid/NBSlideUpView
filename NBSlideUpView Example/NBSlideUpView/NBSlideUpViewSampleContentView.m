#import "NBSlideUpViewSampleContentView.h"
#import "NBSlideUpView.h"

@implementation NBSlideUpViewSampleContentView

- (instancetype)initWithDelegate:(id<NBSlideUpViewSampleContentViewDelegate>)delegate {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                          owner:self
                                        options:nil] firstObject];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (IBAction)sampleButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(slideUpViewSampleContentViewDidRequestAnimateOut:)]) {
        [self.delegate slideUpViewSampleContentViewDidRequestAnimateOut:self];
    }
}

@end
