#import "NBSlideUpView.h"

@implementation NBSlideUpView

- (id)initWithSuperview:(UIView *)superview viewableHeight:(CGFloat)viewablePixels {
    CGRect frame = CGRectMake(0,
                              superview.frame.size.height,
                              superview.frame.size.width,
                              viewablePixels + superview.frame.size.height/3.0); // 3.0 is the default dragMultiplier, as set on self below.
    self = [super initWithFrame:frame];
    if (self) {
        // Default values.
        self.backgroundColor = [UIColor clearColor];
        self.arrowAlpha = 0.7;
        self.viewablePixels = viewablePixels;
        self.dragMultiplier = 3.0;
        self.initialSpringVelocity = 1;
        self.animateInOutTime = 0.5;
        self.springDamping = 0.8;
        
        CGRect contentViewFrame = frame;
        contentViewFrame.origin.y = 0;
        UIView *contentView = [[UIView alloc] initWithFrame:contentViewFrame];
        [self addSubview:contentView];
        self.contentView = contentView;
        self.contentView.backgroundColor = [UIColor grayColor];
        self.contentView.layer.cornerRadius = 15;
        
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"close.png"]];
        arrowImageView.alpha = self.arrowAlpha;
        CGRect arrowFrame = CGRectMake((superview.frame.size.width-37)/2.0, 11, 37, 10);
        arrowImageView.frame = arrowFrame;
        [self addSubview:arrowImageView];
        
        [superview addSubview:self];
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanned:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)setViewablePixels:(CGFloat)viewablePixels {
    _viewablePixels = viewablePixels;
    if (self.superview) {
        CGRect frame = CGRectMake(0,
                                  self.superview.frame.size.height,
                                  self.superview.frame.size.width,
                                  viewablePixels + self.superview.frame.size.height/self.dragMultiplier);
        self.frame = frame;
        frame.origin.y = 0;
        self.contentView.frame = frame;
    }
}

#pragma mark - Touches/Dragging

- (void)onPanned:(UIPanGestureRecognizer*)pan {
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.frame.origin.y > self.superview.frame.size.height - self.viewablePixels) {
            [self animateOut];
        } else {
            [self animateRestore];
        }
    } else {
        CGPoint offset = [pan translationInView:self];
        CGPoint center = self.center;
        center.y += offset.y / self.dragMultiplier;
        self.center = center;
        [pan setTranslation:CGPointZero inView:self];
    }
}

- (void)animateIn {
    [UIView animateWithDuration:self.animateInOutTime
                          delay:0
         usingSpringWithDamping:self.springDamping
          initialSpringVelocity:self.initialSpringVelocity
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         self.frame = CGRectMake(self.frame.origin.x,
                                                 self.superview.frame.size.height - self.viewablePixels,
                                                 self.frame.size.width,
                                                 self.frame.size.height);
                     } completion:^(BOOL completed){
                         if ([self.delegate respondsToSelector:@selector(slideUpViewDidAnimateIn:)]) {
                             [self.delegate slideUpViewDidAnimateIn:self];
                         }
                     }];
}

- (void)animateOut {
    [UIView animateWithDuration:self.animateInOutTime
                          delay:0
         usingSpringWithDamping:self.springDamping
          initialSpringVelocity:self.initialSpringVelocity
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         self.frame = CGRectMake(self.frame.origin.x,
                                                 self.superview.frame.size.height,
                                                 self.frame.size.width,
                                                 self.frame.size.height);
                     } completion:^(BOOL completed) {
                         if ([self.delegate respondsToSelector:@selector(slideUpViewDidAnimateOut:)]) {
                             [self.delegate slideUpViewDidAnimateOut:self];
                         }
                     }];
}

- (void)animateRestore {
    [UIView animateWithDuration:self.animateInOutTime
                          delay:0
         usingSpringWithDamping:self.springDamping
          initialSpringVelocity:self.initialSpringVelocity
                        options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
                            self.frame = CGRectMake(self.frame.origin.x,
                                                    self.superview.frame.size.height - self.viewablePixels,
                                                    self.frame.size.width,
                                                    self.frame.size.height);
                        } completion:^(BOOL completed) {
                            if ([self.delegate respondsToSelector:@selector(slideUpViewDidAnimateRestore:)]) {
                                [self.delegate slideUpViewDidAnimateRestore:self];
                            }
                        }];
}

@end

