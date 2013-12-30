#import "Manager.h"

@implementation Manager
- (int)insertClass2:(Class2 *)class2{
	[self.class2Array addObject:class2];
    return ((int)[self.class2Array indexOfObject:class2]);
}
- (void)updateClass2:(Class2 *)class2{
	 for (int i = 0; i < self.class2Array.count; i++) {
        if (class2.class2ID == [[self.class2Array objectAtIndex:i]class2ID]) {
            [self.class2Array replaceObjectAtIndex:i withObject:class2];
        }
    }
}
- (void)deleteClass2:(Class2 *)class2{
	 for (int i = 0; i < self.class2Array.count; i++) {
        if (class2.class2ID == [[self.class2Array objectAtIndex:i]class2ID]) {
            [self.class2Array removeObjectAtIndex:i];
        }
    }
}
- (void)deleteAllClass2s{
	[self.class2Array removeAllObjects];
}
- (NSMutableArray*)getAllClass2s{
	return self.class2Array;
}
- (Class2*)getClass2ById: (int)identifier{

}

@end
