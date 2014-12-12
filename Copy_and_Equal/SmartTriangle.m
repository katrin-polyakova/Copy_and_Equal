#import <Foundation/Foundation.h>
#import "SmartTriangle.h"
#import "SmartRect.h"
#import "SmartCircle.h"
#include "SmartPoint.h"
#import <math.h>

@implementation SmartTriangle

-(instancetype)initWithPointA:(SmartPoint*)pointA andPointB:(SmartPoint*)pointB andPointC:(SmartPoint*)pointC andName:(NSString*)name andDate:(NSDate*)date{
    
    self = [super init];
    if (self){
        self.pointA = pointA;
        self.pointB = pointB;
        self.pointC = pointC;
        self.name = name;
        self.date = date;
    }
    return self;
}

-(instancetype)initWithPointA:(SmartPoint*)pointA andPointB:(SmartPoint*)pointB andPointC:(SmartPoint*)pointC{
    return [self initWithPointA:(SmartPoint*)pointA andPointB:(SmartPoint*)pointB andPointC:(SmartPoint*)pointC andName:nil andDate:[NSDate date]];
}

-(float)distanceBetweenPoint1:(SmartPoint*)point1 andPoint2:(SmartPoint*)point2{
    float result = sqrtf(powf((point2.x-point1.x),2)+powf((point2.y-point1.y),2));
    return result;
}

-(float)perimeter{
    float result = [self distanceBetweenPoint1:self.pointA andPoint2:self.pointB];
    result = result + [self distanceBetweenPoint1:self.pointB andPoint2:self.pointC];
    result = result + [self distanceBetweenPoint1:self.pointA andPoint2:self.pointC];
    return result;
}

-(float)square{
    float result = fabsf((self.pointB.x-self.pointA.x)*(self.pointC.y-self.pointA.y)-(self.pointC.x-self.pointA.x)*(self.pointB.y-self.pointA.y))/2;
    return result;
}

-(SmartPoint*)centroid{
    
    SmartPoint *centroid = [[SmartPoint alloc] initWithX:(self.pointA.x+self.pointB.x+self.pointC.x)/3 y:(self.pointA.y+self.pointB.y+self.pointC.y)/3];
    return centroid;
}

-(void)printToLog{
    SmartPoint* centroid = [self centroid];
    NSLog(@"\n\t%@\n\tPerimeter: %g\n\tSquare: %g\n\tCentroid: {%g, %g}", [self description], [self perimeter], [self square], centroid.x, centroid.y);
}

-(BOOL)isPointInTriangle:(SmartPoint*)point{
    BOOL result = NO;
    float epsilon =0.00001f;
    float SABP = fabsf((self.pointB.x-self.pointA.x)*(point.y-self.pointA.y)-(point.x-self.pointA.x)*(self.pointB.y-self.pointA.y))/2;
    float SBCP = fabsf((self.pointC.x-self.pointB.x)*(point.y-self.pointB.y)-(point.x-self.pointB.x)*(self.pointC.y-self.pointB.y))/2;
    float SCAP = fabsf((self.pointA.x-self.pointC.x)*(point.y-self.pointC.y)-(point.x-self.pointC.x)*(self.pointA.y-self.pointC.y))/2;
    float S = SABP+SBCP+SCAP;
    if (fabsf(S - [self square]) < epsilon){
        result = YES;
    }
    return result;
}

//-(BOOL)isOtherTriangleInsideTriangle:(SmartTriangle*)otherTriangle{
//    BOOL result = NO;
//    int counter = [self isPointInTriangle:(CGPoint)otherTriangle.pointA];
//    counter = counter + [self isPointInTriangle:(CGPoint)otherTriangle.pointB];
//    counter = counter + [self isPointInTriangle:(CGPoint)otherTriangle.pointC];
//    if (counter == 3){
//        result = YES;
//    }
//    return result;
//}
//
//-(SmartTriangle*)triangleTrWithRect:(SmartRect*)rectTr andCircle:(SmartCircle*)circleTr{
//    CGPoint pointA = CGPointMake (rectTr.origin.x+rectTr.widht/2, rectTr.origin.y+rectTr.heigth/2);
//    CGPoint pointB = CGPointMake(circleTr.center.x, circleTr.center.y);
//    CGPoint centroid = [self centroid];
//    CGPoint pointC = CGPointMake(centroid.x, centroid.y);
//    SmartTriangle* triangleNew = [[SmartTriangle alloc] initWithPointA:(CGPoint)pointA  andPointB:(CGPoint)pointB  andPointC:(CGPoint)pointC];
//    
//    return triangleNew;
//}
//
//-(SmartCircle*)circleInscribedInTriangle{
//    float x = ([self distanceBetweenPoint1:self.pointB andPoint2:self.pointC]*self.pointA.x+[self distanceBetweenPoint1:self.pointA andPoint2:self.pointC]*self.pointB.x+[self distanceBetweenPoint1:self.pointA andPoint2:self.pointB]*self.pointC.x)/([self distanceBetweenPoint1:self.pointA andPoint2:self.pointB]+[self distanceBetweenPoint1:self.pointA andPoint2:self.pointC]+[self distanceBetweenPoint1:self.pointB andPoint2:self.pointC]);
//    float y = ([self distanceBetweenPoint1:self.pointB andPoint2:self.pointC]*self.pointA.y+[self distanceBetweenPoint1:self.pointA andPoint2:self.pointC]*self.pointB.y+[self distanceBetweenPoint1:self.pointA andPoint2:self.pointB]*self.pointC.y)/([self distanceBetweenPoint1:self.pointA andPoint2:self.pointB]+[self distanceBetweenPoint1:self.pointA andPoint2:self.pointC]+[self distanceBetweenPoint1:self.pointB andPoint2:self.pointC]);
//    
//    SmartCircle* inscribedCircle = [[SmartCircle alloc] initWithCenter:CGPointMake(x, y) andRadius:2*[self square]/[self perimeter]];
//    
//    return inscribedCircle;
//}

- (NSString *)description{
    NSMutableString *description = [NSMutableString stringWithFormat:@" Name:%@ ", self.name];
    [description appendFormat:@"\nA: %@", self.pointA];
    [description appendFormat:@"\nB: %@", self.pointB];
    [description appendFormat:@"\nC: %@", self.pointC];
    [description appendFormat:@"\nDate:%@", self.date];
    
//    NSString* result;
//    result = [NSString stringWithFormat:@"A: x:%g y:%g;\tB: x:%g y:%g;\tC: x:%g y:%g", self.pointA.x, self.pointA.y, self.pointB.x, self.pointB.y, self.pointC.x, self.pointC.y];
    
    return description;
}


@end
