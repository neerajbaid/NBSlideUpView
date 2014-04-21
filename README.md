NBSlideUpView
=============
####By [@2neeraj](http://twitter.com/2neeraj)

This is a highly customizable modal view that slides up from the bottom of the screen. NBSlideUpView can be dragged off the screen or dismissed programatically.

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
- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView;
- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView;
```

###Customization
Change the height of the view.

```smalltalk
@property (nonatomic) CGFloat viewablePixels;
```
Change any aspect of the spring-loaded animation.

```smalltalk
@property (nonatomic) CGFloat springDamping;
@property (nonatomic) CGFloat initialSpringVelocity;
@property (nonatomic) CGFloat animateInOutTime;
```
Change the duration of the in, out, and restore animations.

```smalltalk
@property (nonatomic) CGFloat animateInOutTime;
```
