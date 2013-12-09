#import <UIKit/UIKit.h>
#import "Task.h"
#import "NewTaskViewController.h"

@interface NotesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *notes;
@property (nonatomic, retain) UITextField IBOutlet *noteField;

@end
