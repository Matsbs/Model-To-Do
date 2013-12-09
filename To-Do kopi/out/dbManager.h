#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Category1.h"
#import "Note.h"
#import "Task.h"

@interface DBManager : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *TASKDB; 

- (void)initDatabase;
- (void)setDbPath;
- (int)insertCategory1:(Category1 *)category1;
- (void)updateCategory1:(Category1 *)category1;
- (void)deleteCategory1:(Category1 *)category1;
- (void)deleteAllCategory1s;
- (NSMutableArray*)getAllCategory1s;
- (Category1*)getCategory1ById: (int)identifier;
- (int)insertNote:(Note *)note;
- (void)updateNote:(Note *)note;
- (void)deleteNote:(Note *)note;
- (void)deleteAllNotes;
- (NSMutableArray*)getAllNotes;
- (Note*)getNoteById: (int)identifier;
- (int)insertTask:(Task *)task;
- (void)updateTask:(Task *)task;
- (void)deleteTask:(Task *)task;
- (void)deleteAllTasks;
- (NSMutableArray*)getAllTasks;
- (Task*)getTaskById: (int)identifier;

@end
