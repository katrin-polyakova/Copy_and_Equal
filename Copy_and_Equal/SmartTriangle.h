#import <Foundation/Foundation.h>

@class SmartPoint;
@class SmartRect;
@class SmartCircle;

@interface SmartTriangle : NSObject

@property (nonatomic) SmartPoint* pointA;
@property (nonatomic) SmartPoint* pointB;
@property (nonatomic) SmartPoint* pointC;
@property (nonatomic) NSString* name;
@property (nonatomic) NSDate* date;

-(instancetype)initWithPointA:(SmartPoint*)pointA andPointB:(SmartPoint*)pointB andPointC:(SmartPoint*)pointC;
-(instancetype)initWithPointA:(SmartPoint*)pointA andPointB:(SmartPoint*)pointB andPointC:(SmartPoint*)pointC andName:(NSString*)name andDate:(NSDate*)date;

-(float)perimeter;
-(float)square;
-(SmartPoint*)centroid;
-(void)printToLog;
-(BOOL)isPointInTriangle:(SmartPoint*)point;

//-(BOOL)isOtherTriangleInsideTriangle:(SmartTriangle*)otherTriangle;
//-(SmartTriangle*)triangleTrWithRect:(SmartRect*)rectTr andCircle:(SmartCircle*)circleTr;
//-(SmartCircle*)circleInscribedInTriangle;

@end
