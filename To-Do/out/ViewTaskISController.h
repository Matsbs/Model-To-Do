		
#import <UIKit/UIKit.h>
#import "Task.h"

@class ViewTaskISController;

//Protocol for communication with mainView
@protocol ViewTaskISControllerDelegate <NSObject>
- (void)removeItemViewController:(ViewTaskISController *)controller didFinishEnteringItem:(Task *)item;
@end
		
@interface ViewTaskISController : UIViewController <UITableViewDataSource, UITableViewDelegate>
		
@property (nonatomic, weak) id <ViewTaskISControllerDelegate> delegate;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextView *nameView;
@property (nonatomic, retain) IBOutlet UITextView *dateView;
@property (nonatomic, retain) IBOutlet UITextView *noteView;
@property (nonatomic, retain) Task *task;
@end
