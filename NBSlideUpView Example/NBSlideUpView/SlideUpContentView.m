#import "SlideUpContentView.h"
#import "NBSlideUpView.h"

@implementation SlideUpContentView

- (IBAction)sampleButton:(id)sender
{
    [((NBSlideUpView *)self.superview.superview) animateOut];
}

@end
