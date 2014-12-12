#import <Foundation/Foundation.h>
#import "SmartCircle.h"
#import "SmartRect.h"
#import "SmartPoint.h"
#import <math.h>

@implementation SmartCircle

-(instancetype)initWithCenter:(SmartPoint*)center andRadius:(float)radius{
    return [self initWithCenter:(SmartPoint*)center andRadius:(float)radius andName:nil andDate:[NSDate date]];
}

-(instancetype)initWithCenter:(SmartPoint*)center andRadius:(float)radius andName:(NSString*)name andDate:(NSDate*)date{
    self = [super init];
    if (self){
        self.center = center;
        self.radius = radius;
        self.name = name;
        self.date = date;
    }
    return self;
}

-(float)square{
    float result = M_PI*self.radius*self.radius;
    return result;
}

-(BOOL)isPointInCircle:(SmartPoint*)point{
    BOOL result = NO;
    float distanceBetweenPoints = sqrtf(powf((point.x-self.center.x),2)+powf((point.y-self.center.y),2));
    if (distanceBetweenPoints <= self.radius)
    {
        result = YES;
    }
    return result;
}

//-(BOOL)isRectInsideCircle:(SmartRect*)rectangle{
//    BOOL result = NO;
//    
//    CGPoint topRight = CGPointMake(rectangle.origin.x+rectangle.widht,rectangle.origin.y);
//    CGPoint bottomLeft = CGPointMake(rectangle.origin.x,rectangle.origin.y+rectangle.heigth);
//    CGPoint bottomRigt = CGPointMake(rectangle.origin.x+rectangle.widht,rectangle.origin.y+rectangle.heigth);
//    
//    int pointCounter = [self isPointInCircle:rectangle.origin];
//    pointCounter = pointCounter + [self isPointInCircle:topRight];
//    pointCounter = pointCounter + [self isPointInCircle:bottomLeft];
//    pointCounter = pointCounter + [self isPointInCircle:bottomRigt];
//    
//    if(pointCounter == 4){
//        result = YES;
//    }
//    return result;
//}

- (NSString *)description{
    NSMutableString *description = [NSMutableString stringWithFormat:@" Name:%@ ", self.name];
    [description appendFormat:@"\n%@", self.center];
    [description appendFormat:@"\nradius=%g", self.radius];
    [description appendFormat:@"\nDate:%@", self.date];
    return description;
    
//    NSString* result;
//    result = [NSString stringWithFormat:@"x:%g y:%g radius:%g", self.center.x, self.center.y, self.radius];
    
    return description;
}

- (id)copyWithZone:(NSZone *)zone
{
    SmartCircle *copy = (SmartCircle*) [[[self class] allocWithZone:zone] init];
    
    if (copy != nil) {
        copy.center = self.center;
        copy.radius = self.radius;
        copy.name = [self.name copy];
        copy.date = [self.date copy];
    }
    return copy;
}

- (BOOL)isEqual:(id)otherCircle
{
    if (otherCircle == self)
        return YES;
    if (!otherCircle || ![[otherCircle class] isEqual:[self class]])
        return NO;
    return [self isEqualToCircle:otherCircle];
}

- (BOOL)isEqualToCircle:(SmartCircle*) circle
{
    if (self == circle)
        return YES;
    if (circle == nil)
        return NO;
    if (![(SmartPoint*)self.center isEqualToPoint:(SmartPoint*)circle.center])
        return NO;
    if (fabs(self.radius != circle.radius)>0.0000001)
        return NO;
    if (![self.name isEqualToString:circle.name]){
        return NO;
    }
    return YES;
}

@end