#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Task.h"
#import "Note.h"
#import "House.h"
#import "Category.h"

@interface DBManager : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *DATABASE; 

- (void)initDatabase;
- (void)setDbPath;
- (int)insertTask:(Task *)task;
- (void)updateTask:(Task *)task;
- (void)deleteTask:(Task *)task;
- (void)deleteAllTasks;
- (NSMutableArray*)getAllTasks;
- (Task*)getTaskById: (int)identifier;
- (int)insertNote:(Note *)note;
- (void)updateNote:(Note *)note;
- (void)deleteNote:(Note *)note;
- (void)deleteAllNotes;
- (NSMutableArray*)getAllNotes;
- (Note*)getNoteById: (int)identifier;
- (int)insertHouse:(House *)house;
- (void)updateHouse:(House *)house;
- (void)deleteHouse:(House *)house;
- (void)deleteAllHouses;
- (NSMutableArray*)getAllHouses;
- (House*)getHouseById: (int)identifier;
- (int)insertCategory:(Category *)category;
- (void)updateCategory:(Category *)category;
- (void)deleteCategory:(Category *)category;
- (void)deleteAllCategorys;
- (NSMutableArray*)getAllCategorys;
- (Category*)getCategoryById: (int)identifier;

@end
