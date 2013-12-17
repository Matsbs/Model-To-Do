#import <UIKit/UIKit.h>

#import "ViewTaskController.h"
#import "NewTaskViewController.h"

@interface Class1ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate, NewTaskViewControllerDelegate>


@property (nonatomic, retain) UISearchBar *searchBarAsdasd;
@property (nonatomic, retain) UITableView *tableViewAsdasd;
UILabel *mLabelClass2

//TODO Domain binding
@property (nonatomic, retain) NSMutableArray *tasks;
@property (nonatomic, retain) Task *task;


@end		
