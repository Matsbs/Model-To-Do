#import <UIKit/UIKit.h>

#import "ViewTaskController.h"
#import "NewTaskViewController.h"

@interface Class1ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate, NewTaskViewControllerDelegate>

@property (nonatomic, retain) UISearchBar *listSearchBar;
@property (nonatomic, retain) UITableView *listTableView;

@property (nonatomic, retain) UILabel *labelLabel;

//TODO Domain binding
@property (nonatomic, retain) NSMutableArray *tasks;
@property (nonatomic, retain) Task *task;


@end		
