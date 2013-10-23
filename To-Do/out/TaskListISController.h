
#import <UIKit/UIKit.h>
#import "CreateNewTaskISController.h"
#import "ViewTaskISController.h"
#import "Task.h"

@interface TaskListISController : UIViewController <NewTaskViewControllerDelegate, ViewNoteControllerDelegate,  UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *taskArray;
@property (nonatomic, retain) Task *task;
@end
