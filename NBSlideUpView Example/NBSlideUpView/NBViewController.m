#import "NBSlideUpView.h"
#import "NBSlideUpViewSampleContentView.h"
#import "NBViewController.h"

@interface NBViewController () <NBSlideUpViewSampleContentViewDelegate>

@property (nonatomic, strong) NBSlideUpView *slideUpView;

@end

@implementation NBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NBSlideUpView *slideUpView = [[NBSlideUpView alloc] initWithSuperview:self.view viewableHeight:200];
    self.slideUpView = slideUpView;
    self.slideUpView.delegate = self;
    
    NBSlideUpViewSampleContentView *sampleContentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NBSlideUpViewSampleContentView class])
                                                                                      owner:self options:nil] firstObject];
    sampleContentView.layer.cornerRadius = 15;
    sampleContentView.layer.masksToBounds = YES;
    sampleContentView.delegate = self;
    [self.slideUpView.contentView addSubview:sampleContentView];
}

- (IBAction)animateIn:(id)sender {
    [self.slideUpView animateIn];
}

#pragma mark - NBSlideUpViewDelegate

- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView {
    NSLog(@"NBSlideUpView animated in.");
}

- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView {
    NSLog(@"NBSlideUpView animated out.");
}

- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView {
    NSLog(@"NBSlideUpView animated restore.");
}

#pragma mark - NBSlideUpViewSampleContentViewDelegate

- (void)slideUpViewSampleContentViewDidRequestAnimateOut:(NBSlideUpViewSampleContentView *)slideUpViewSampleContentView {
    [self.slideUpView animateOut];
}

@end
