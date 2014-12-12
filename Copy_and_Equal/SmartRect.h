#import <Foundation/Foundation.h>

@class SmartCircle;
@class SmartPoint;

@interface SmartRect : NSObject<NSCopying>

@property(nonatomic) SmartPoint* origin;
@property(nonatomic) float widht;
@property(nonatomic) float heigth;
@property(nonatomic) NSString* name;
@property(nonatomic, strong) NSDate* date;

-(instancetype)initWithOrigin:(SmartPoint*)origin andWidth:(float)width andHeight:(float)height andName:(NSString*)name andDate:(NSDate*)date;
-(instancetype)initWithOrigin:(SmartPoint*)origin andWidth:(float)width andHeight:(float)height;

-(float)square;
-(SmartPoint*)center;
-(float)diagonal;
-(BOOL)isPointInRect:(SmartPoint*)point;

//-(BOOL)isOtherRectInsideRect:(SmartRect*)otherRect;
 -(SmartCircle*)circleInscribedInRect;
// -(SmartRect*)intersectionWithRect:(SmartRect*)otherRect;

@end
