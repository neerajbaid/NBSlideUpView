NBSlideUpView
=============
####By [@2neeraj](http://twitter.com/2neeraj)

This is a highly customizable, sticky modal view that slides up from the bottom of the screen. NBSlideUpView can be dragged off the screen or dismissed programatically.

![](example.gif)


#####Used in
* [giftbook](https://itunes.apple.com/us/app/giftbook-gift-cards-on-your/id707069900?mt=8)
* WWDC 2014 Scholarship Application

####Let [me](http://twitter.com/2neeraj) know where you use this library so I can add to the list here!

##Installation
###CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like NBSlideUpView in your projects.
```ruby
pod "NBSlideUpView"
```

###Alternative
Alternatively, you can just drag the <b>NBSlideUpView</b> folder into your project.

##Usage 
```smalltalk
NBSlideUpView *slideUpView = [[NBSlideUpView alloc] initWithSuperview:self.view viewableHeight:200];
slideUpView.delegate = self;
"slideUpView is automatically added as a subview of self.view"
```

### Add Content to the View
Add a subview to the NBSlideUpView's contentView.
```smalltalk
[slideUpView.contentView addSubview:aView];
```

### Delegate Methods

```smalltalk
NBSlideUpViewDelegate
- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView;
```

###Customization
Height of the view.

```smalltalk
@property (nonatomic) CGFloat viewablePixels;
```
Any aspect of the spring-loaded animation.

```smalltalk
@property (nonatomic) CGFloat springDamping; "Default to 0.8"
@property (nonatomic) CGFloat initialSpringVelocity; "Default to 1"
@property (nonatomic) CGFloat animateInOutTime; "Default to 0.5"
```

The stickiness of the view.
```smalltalk
@property (nonatomic) CGFloat dragMultiplier;
"1.0 means the view moves with the user's finger. > 1.0 means the view sticks. Defaults to 3.0"
```
Opacity of the default downward arrow.
```smalltalk
@property (nonatomic) CGFloat arrowAlpha; "Default to 0.7"
```
