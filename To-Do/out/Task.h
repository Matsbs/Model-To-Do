#import "Note.h"
#import "Category1.h"
#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, retain) NSString *name;		
@property (nonatomic, retain) NSString *date;		
@property (nonatomic, retain) NSString *description;		
@property (nonatomic, retain) NSMutableArray *notes;
@property (nonatomic, retain) Category1 *category;
@property (nonatomic, retain) Note *note;

@end
