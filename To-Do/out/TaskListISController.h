
#import <UIKit/UIKit.h>
#import "ViewTaskISController.h"
#import "CreateNewTaskISController.h"
#import "Task.h"


@interface TaskListISController : UIViewController <ViewTaskISControllerDelegate,CreateNewTaskISControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *taskArray;
@property (nonatomic, retain) Task *task;
@end
