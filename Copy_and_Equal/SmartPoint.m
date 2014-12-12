#import "SmartPoint.h"
#import <math.h>

@implementation SmartPoint

{
    @package
    float _x;
    float _y;
}
@synthesize x = _x;
@synthesize y = _y;

+ (instancetype)pointWithX:(float)x y:(float)y
{
    SmartPoint *newPoint = [[self alloc] init];
    newPoint.x = x;
    newPoint.y = y;
    return newPoint;
}
- (instancetype)initWithX:(float)x y:(float)y title:(NSString*)title timestamp:(NSDate*)date{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _title = title;
        _timestamp = date;
        
    }
    return self;
}

- (instancetype)initWithX:(float)x y:(float)y title:(NSString*)title{
    return [self initWithX:x y:y title:title timestamp:[NSDate date]];
}

- (instancetype)initWithX:(float)x y:(float)y{
    return [self initWithX:x y:y title:nil timestamp:[NSDate date]];
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    return [self isEqualToPoint:other];
}

- (BOOL)isEqualToPoint:(SmartPoint*)point
{
    if (self == point)
        return YES;
    if (point == nil)
        return NO;
    if (fabs (self.x != point.x)>0.0000001)
        return NO;
    if (fabs(self.y != point.y)>0.0000001)
        return NO;
    if (![self.title isEqualToString:point.title]){
        return NO;
    }
    return YES;
}

- (id)copyWithZone:(NSZone *)zone
{
    SmartPoint *copy = (SmartPoint*) [[[self class] allocWithZone:zone] init];
    
    if (copy != nil) {
        copy.x = self.x;
        copy.y = self.y;
        copy.title = [self.title copy];
        copy.timestamp = [self.timestamp copy];
    }
    return copy;
}

- (NSUInteger)hash
{
    NSUInteger hash = [[NSNumber numberWithFloat:self.x] hash];
    hash = hash * 31u + [[NSNumber numberWithFloat:self.y] hash];
    return hash;
}


- (void)moveToX:(float)x andY:(float)y
{
    _x = x;
    _y = y;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"\t<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"\n\tself.x=%g", self.x];
    [description appendFormat:@", self.y=%g", self.y];
    [description appendFormat:@", \n\tself.title=%@", self.title];
    [description appendFormat:@", self.date=%@", self.timestamp];
    [description appendString:@">"];
    return description;
}

@end

@implementation StupidPoint
- (void)moveToX:(float)x andY:(float)y
{
    _x = x*100;
    _y = y*100;
}

@end





//- (NSString *)description
//{
//   NSString* result = [NSString stringWithFormat:@"{ pointer = %p; x=%f, y=%f", self, self.x, self.y];
//   return result;
//}

//
//- (instancetype)initWithX:(float)x y:(float)y
//{
//   self = [super init];
//   if (self) {
//      _x = x;
//      _y = y;
//   }
//
//   return self;
//}
//

