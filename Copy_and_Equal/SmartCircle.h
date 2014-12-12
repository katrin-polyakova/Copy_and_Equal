#import <Foundation/Foundation.h>

@class SmartRect;
@class SmartPoint;

@interface SmartCircle : NSObject<NSCopying>

@property(nonatomic) SmartPoint* center;
@property(nonatomic) float radius;
@property(nonatomic) NSString* name;
@property(nonatomic, copy) NSDate* date;

-(instancetype)initWithCenter:(SmartPoint*)center andRadius:(float)radius;
-(instancetype)initWithCenter:(SmartPoint*)center andRadius:(float)radius andName:(NSString*)name andDate:(NSDate*)date;

-(float)square;
-(BOOL)isPointInCircle:(SmartPoint*)point;
//-(BOOL)isRectInsideCircle:(SmartRect*)rectangle;

@end
