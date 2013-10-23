		
#import <UIKit/UIKit.h>
#import "Task.h"

@class CreateNewTaskISController;

//Protocol for communication with mainView
@protocol CreateNewTaskISControllerDelegate <NSObject>
- (void)addItemViewController:(CreateNewTaskISController *)controller didFinishEnteringItem:(Task *)item;
@end
		
@interface CreateNewTaskISController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
		
@property (nonatomic, weak) id <CreateNewTaskISControllerDelegate> delegate;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *dateField;
@property (nonatomic, retain) IBOutlet UITextField *noteField;
@property (nonatomic, retain) Task *task;
@end
