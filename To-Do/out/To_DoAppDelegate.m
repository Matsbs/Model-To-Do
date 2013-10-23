
#import "To_DoAppDelegate.h"

@implementation To_DoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    TaskListISController *taskListISController = [[TaskListISController alloc] init];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:taskListISController];
    [self.window setRootViewController:self.navigationController];
   [self.window makeKeyAndVisible];
    return YES;
}
@end
