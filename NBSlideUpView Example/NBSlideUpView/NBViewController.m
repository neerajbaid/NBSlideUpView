//
//  NBViewController.m
//  NBSlideUpView
//
//  Created by Neeraj Baid on 4/21/14.
//  Copyright (c) 2014 Neeraj Baid. All rights reserved.
//

#import "NBViewController.h"
#import "NBSlideUpView.h"

@interface NBViewController ()

@property (nonatomic, strong) NBSlideUpView *slideUpView;

@end

@implementation NBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NBSlideUpView *slideUpView = [[NBSlideUpView alloc] initWithSuperview:self.view viewableHeight:200];
    self.slideUpView = slideUpView;
    self.slideUpView.delegate = self;
    
    NSLog(@"%@", [[[NSBundle mainBundle] loadNibNamed:@"SlideUpContentView" owner:self options:nil][0] class]);
    UIView *contentViewSubview = [[NSBundle mainBundle] loadNibNamed:@"SlideUpContentView" owner:self options:nil][0];
    contentViewSubview.layer.cornerRadius = 15;
    contentViewSubview.layer.masksToBounds = YES;
    [self.slideUpView.contentView addSubview:contentViewSubview];
}

- (IBAction)animateIn:(id)sender
{
    [self.slideUpView animateIn];
}

- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView
{
    NSLog(@"view animated in");
}

- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView
{
    NSLog(@"view animated out");
}

- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView
{
    NSLog(@"view did animate restore");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
