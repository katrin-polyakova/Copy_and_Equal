#import <Foundation/Foundation.h>
#import "SmartRect.h"
#import "SmartCircle.h"
#import "SmartPoint.h"
#import <math.h>

@implementation SmartRect

-(instancetype)initWithOrigin:(SmartPoint*)origin andWidth:(float)width andHeight:(float)height{
    return [self initWithOrigin:(SmartPoint*)origin andWidth:(float)width andHeight:(float)height andName:nil andDate:[NSDate date]];
}

-(instancetype)initWithOrigin:(SmartPoint*)origin andWidth:(float)width andHeight:(float)height andName:(NSString*)name andDate:(NSDate*)date{
    self = [super init];
    if (self){
        self.origin = origin;
        self.widht = width;
        self.heigth = height;
        self.name = name;
        self.date = date;
    }
    return self;
}

-(float)square{
    float result = self.heigth * self.widht;
    return result;
}

-(SmartPoint*)center{
    float x = self.origin.x+self.widht/2;
    float y = self.origin.y+self.heigth/2;
    SmartPoint *result = [[SmartPoint alloc] initWithX:x y:y title:nil];
    return result;
}

-(float)diagonal{
    float result = sqrtf(powf(self.widht,2)+powf(self.heigth,2));
    return result;
}

-(BOOL)isPointInRect:(SmartPoint*)point{
    int result = NO;
    if ( (self.origin.x <= point.x) && (point.x <= (self.origin.x+self.widht)) && (self.origin.y <= point.y) && (point.y <= (self.origin.y+self.heigth)) ){
        result = YES;
    }
    return result;
}

//-(BOOL)isOtherRectInsideRect:(SmartRect*)otherRect{
//    BOOL result = NO;
//    
//    CGPoint topRight = CGPointMake(otherRect.origin.x+otherRect.widht,otherRect.origin.y);
//    CGPoint bottomLeft = CGPointMake(otherRect.origin.x,otherRect.origin.y+otherRect.heigth);
//    CGPoint bottomRight = CGPointMake(otherRect.origin.x+otherRect.widht,otherRect.origin.y+otherRect.heigth);
//    
//    int pointCounter = [self isPointInRect:otherRect.origin];
//    pointCounter = pointCounter + [self isPointInRect:topRight];
//    pointCounter = pointCounter + [self isPointInRect:bottomLeft];
//    pointCounter = pointCounter + [self isPointInRect:bottomRight];
//    if(pointCounter == 4){
//        result = YES;
//    }
//    return result;
//}

-(SmartCircle*)circleInscribedInRect{
    float radius;
    if (self.widht<=self.heigth){
        radius = self.widht/2;
    }else{
        radius = self.heigth/2;
    }
    SmartPoint *center = [[SmartPoint alloc] initWithX:self.origin.x y:self.origin.y];
    SmartCircle* inscribedCircle = [[SmartCircle alloc] initWithCenter:center andRadius:radius];
    
    return inscribedCircle;
}

-(SmartRect*)intersectionWithRect:(SmartRect*)otherRect{
    
    SmartRect* result;
    return result;
}

- (NSString *)description{
    NSMutableString *description = [NSMutableString stringWithFormat:@" Name:%@ ", self.name];
    [description appendFormat:@"\n%@", [self.origin description]];
    [description appendFormat:@"\nwidht=%g", self.widht];
    [description appendFormat:@", heigth=%g", self.heigth];
    [description appendFormat:@"\nDate:%@", self.date];
    return description;
  
    //    NSString* result;
    //    result = [NSString stringWithFormat:@"Name: %@\n%@\n\twidth:%g heith:%g\n\tDate: %@", self.name, [self.origin description], self.widht, self.heigth, self.date];
    //
    //    return result;
}

- (id)copyWithZone:(NSZone *)zone
{
    SmartRect *copy = (SmartRect*) [[[self class] allocWithZone:zone] init];
    
    if (copy != nil) {
        copy.origin = self.origin;
        copy.widht = self.widht;
        copy.heigth = self.heigth;
        copy.name = [self.name copy];
        copy.date = [self.date copy];
    }
    return copy;
}

- (BOOL)isEqual:(id)otherRect
{
    if (otherRect == self)
        return YES;
    if (!otherRect || ![[otherRect class] isEqual:[self class]])
        return NO;
    return [self isEqualToRect:otherRect];
}

- (BOOL)isEqualToRect:(SmartRect*) rect
{
    if (self == rect)
        return YES;
    if (rect == nil)
        return NO;
    if (![(SmartPoint*)self.origin isEqualToPoint:(SmartPoint*)rect.origin])
        return NO;
    if (fabs(self.widht != rect.widht)>0.0000001)
        return NO;
    if (fabs(self.heigth != rect.heigth)>0.0000001)
        return NO;
    if (![self.name isEqualToString:rect.name]){
        return NO;
    }
    return YES;
}

@end



