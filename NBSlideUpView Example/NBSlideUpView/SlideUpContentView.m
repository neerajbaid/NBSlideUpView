//
//  SlideUpContentView.m
//  NBSlideUpView
//
//  Created by Neeraj Baid on 4/21/14.
//  Copyright (c) 2014 Neeraj Baid. All rights reserved.
//

#import "SlideUpContentView.h"
#import "NBSlideUpView.h"

@implementation SlideUpContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)sampleButton:(id)sender
{
    [((NBSlideUpView *)self.superview.superview) animateOut];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
