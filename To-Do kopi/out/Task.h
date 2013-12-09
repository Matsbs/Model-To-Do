#import <Foundation/Foundation.h>

@interface Task : NSObject

@property int taskId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * description;		

@end
