#import <Foundation/Foundation.h>
#import "Note.h"
#import "Category.h"

@interface Task : NSObject

@property int taskId;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) UIImageView *Image;		

@end
