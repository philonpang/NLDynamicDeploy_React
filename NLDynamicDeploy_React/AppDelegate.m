//
//  AppDelegate.m
//  NLDynamicDeploy_React
//
//  Created by 庞辉 on 4/2/15.
//  Copyright (c) 2015 庞辉. All rights reserved.
//

#import "AppDelegate.h"
#import <RCTRootView.h>

@interface MainViewController : UIViewController{
    
}

@end

@implementation MainViewController

-(void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"主界面";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 200.0f)/2.0f, (self.view.frame.size.height-100.0f)/2.0f, 200.0f, 100.0f);
    btn.layer.cornerRadius = 5.0f;
    btn.layer.masksToBounds = YES;
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btn.titleLabel setNumberOfLines:2];
    [btn setTitle:@"click\n打开一个JS组件" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openJSDemoBundle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)openJSDemoBundle {
    NSURL *jsCodeLocation;
    // Loading JavaScript code - uncomment the one you want.
    
    // OPTION 1
    // Load from development server. Start the server from the repository root:
    //
    // $ npm start
    //
    // To run on device, change `localhost` to the IP address of your computer, and make sure your computer and
    // iOS device are on the same Wi-Fi network.
    
    // OPTION 2
    // Load from pre-bundled file on disk. To re-generate the static bundle, run
    //
    // $ curl http://localhost:8081/ReactProject/NumLottery_React/NumLotteryDynamicApp.bundle?dev=true -o main.jsbundle
    //
    // and uncomment the next following line
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    
    //jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/ReactProject/NumLottery_React/NumLotteryDynamicApp.bundle?dev=true"];
    
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"NumLotteryDynamicApp" launchOptions:nil];
    UIViewController *jsBundleViewController = [[UIViewController alloc] init];
    jsBundleViewController.view = rootView;
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController pushViewController:jsBundleViewController animated:YES];
}


@end


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.autoresizesSubviews = YES;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
