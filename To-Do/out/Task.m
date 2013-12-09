
#import "Task.h"

@implementation Task

- (Category1* ) category{
    if (_category == nil) {
        _category = [[Category1 alloc] init];
    }
    return _category;
}

- (Note* ) note{
    if (_note == nil) {
        _note = [[Note alloc] init];
    }
    return _note;
}

@end

