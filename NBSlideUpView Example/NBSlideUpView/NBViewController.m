#import "NBViewController.h"
#import "NBSlideUpView.h"

@interface NBViewController ()

@property (nonatomic, strong) NBSlideUpView *slideUpView;

@end

@implementation NBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NBSlideUpView *slideUpView = [[NBSlideUpView alloc] initWithSuperview:self.view viewableHeight:200];
    self.slideUpView = slideUpView;
    self.slideUpView.delegate = self;
    
    UIView *contentViewSubview = [[NSBundle mainBundle] loadNibNamed:@"SlideUpContentView" owner:self options:nil][0];
    contentViewSubview.layer.cornerRadius = 15;
    contentViewSubview.layer.masksToBounds = YES;
    [self.slideUpView.contentView addSubview:contentViewSubview];
}

- (IBAction)animateIn:(id)sender {
    [self.slideUpView animateIn];
}

- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView {
    NSLog(@"view animated in");
}

- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView {
    NSLog(@"view animated out");
}

- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView {
    NSLog(@"view did animate restore");
}

@end
