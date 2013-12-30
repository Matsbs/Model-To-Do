#import "ModelAppDelegate.h"

@implementation ModelAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    Class1ViewController *mainView = [[Class1ViewController alloc] init];
    self.navController = [[UINavigationController alloc]initWithRootViewController:mainView];
    [self.window setRootViewController:self.navController];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
