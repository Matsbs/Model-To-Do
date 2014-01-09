#import "MyApplicationAppDelegate.h"

@implementation MyApplicationAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    MainScreenViewController *mainView = [[MainScreenViewController alloc] init];
    self.navController = [[UINavigationController alloc]initWithRootViewController:mainView];
    [self.window setRootViewController:self.navController];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
