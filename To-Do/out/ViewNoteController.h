#import <UIKit/UIKit.h>
#import "Task.h"

@class ViewNoteController;

//Protocol for communication with mainView
@protocol ViewNoteControllerDelegate <NSObject>
- (void)removeItemViewController:(ViewNoteController *)controller didFinishEnteringItem:(Task *)item;
- (void)addItemViewController:(ViewNoteController *)controller didFinishEnteringItem:(Task *)item;
@end

@interface ViewNoteController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *dateField;
@property (nonatomic, retain) IBOutlet UITextField *descriptionField;
@property (nonatomic, retain) IBOutlet UITextField *categoryField;
@property (nonatomic, weak) id <ViewNoteControllerDelegate> delegate;
@property (nonatomic, retain) Task *task;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, assign) BOOL isEditing;

@end