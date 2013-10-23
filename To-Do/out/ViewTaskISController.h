		
#import <UIKit/UIKit.h>
#import "Task.h"

@class ViewTaskISController;

//Protocol for communication with mainView
@protocol ViewTaskISControllerDelegate <NSObject>
- (void)addItemViewController:(ViewTaskISController *)controller didFinishEnteringItem:(Task *)item;
@end
		
@interface ViewTaskISController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
		
@property (nonatomic, weak) id <ViewTaskISControllerDelegate> delegate;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *dateField;
@property (nonatomic, retain) IBOutlet UITextField *noteField;
@property (nonatomic, retain) Task *task;
@end
