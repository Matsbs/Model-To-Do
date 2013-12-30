#import <Foundation/Foundation.h>
#import "Class2.h"
@interface Manager : NSObject

@property (nonatomic, strong) NSMutableArray *class2Array;
+ (id)sharedManager;
- (id)init;
- (int)insertClass2:(Class2 *)class2;
- (void)updateClass2:(Class2 *)class2;
- (void)deleteClass2:(Class2 *)class2;
- (void)deleteAllClass2s;
- (NSMutableArray*)getAllClass2s;
- (Class2*)getClass2ById: (int)identifier;
@end

