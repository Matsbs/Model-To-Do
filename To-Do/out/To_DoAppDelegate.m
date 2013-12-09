#import "To_DoAppDelegate.h"

@implementation To_DoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    MainViewController *mainView = [[MainViewController alloc] init];
    self.navController = [[UINavigationController alloc]initWithRootViewController:mainView];
    [self.window setRootViewController:self.navController];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
