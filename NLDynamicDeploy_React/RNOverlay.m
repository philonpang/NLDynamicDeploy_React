#import "RNOverlay.h"
#import "RCTUIManager.h"
#import "RCTView.h"
#import "RCTTouchHandler.h"
#import "UIView+React.h"
#import "RNClickThroughWindow.h"

@implementation RNOverlay {
  RNClickThroughWindow *_overlayWindow;
  UIViewController *_overlayViewController;
  RCTView *_overlayBaseView;
  RCTTouchHandler *_touchHandler;
  BOOL _aboveStatusBar;
}

- (id)initWithBridge:(RCTBridge *)bridge
{
  if ((self = [super init])) {
    _overlayViewController = [[UIViewController alloc] init];
    _overlayBaseView = [[RCTView alloc] init];

    /* Must register handler because we are in a new UIWindow and our
     * overlayBaseView does not have a RCTRootView parent */
    _touchHandler = [[RCTTouchHandler alloc] initWithBridge:bridge];
    [_overlayBaseView addGestureRecognizer:_touchHandler];

    _overlayViewController.view = _overlayBaseView;
  }

  return self;
}

- (void)setAboveStatusBar:(BOOL)aboveStatusBar {
  _aboveStatusBar = aboveStatusBar;
  [self applyWindowLevel];
}

- (void)applyWindowLevel {
  if (_overlayWindow == nil) {
    return;
  }

  if (_aboveStatusBar) {
    _overlayWindow.windowLevel = UIWindowLevelStatusBar;
  } else {
    _overlayWindow.windowLevel = UIWindowLevelStatusBar - 1;
  }
}

/* Every component has it is initializer called twice, once to create a base view
 * with default props and another to actually create it and apply the props. We make
 * this prop that is always true in order to not create UIWindow for the default props
 * instance */
- (void)setVisible:(BOOL)visible {
  _overlayWindow = [[RNClickThroughWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self applyWindowLevel];
  _overlayWindow.backgroundColor = [UIColor clearColor];
  _overlayWindow.rootViewController = _overlayViewController;
  _overlayWindow.userInteractionEnabled = YES;
  _overlayWindow.hidden = NO;

  /* We need to watch for app reload notifications to properly remove the overlay,
   * removeFromSuperview does not properly propagate down without this */
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(removeFromSuperview)
                                               name:@"RCTReloadNotification"
                                             object:nil];
}

- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
  /* Add subviews to the overlay base view rather than self */
  [_overlayBaseView insertReactSubview:view atIndex:atIndex];
}

/* We do not need to support unmounting, so I -think- that this cleanup code
 * is safe to put here. */
- (void)removeFromSuperview
{
  [_overlayBaseView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  _touchHandler = nil;
  _overlayViewController = nil;
  _overlayBaseView = nil;
  _overlayWindow = nil;
  [super removeFromSuperview];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
