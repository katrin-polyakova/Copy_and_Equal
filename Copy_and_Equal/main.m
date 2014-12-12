//  main.m
//  Copy_and_Equal
//
//  Created by Kate Polyakova on 12/7/14.
//  Copyright (c) 2014 Kate Polyakova. All rights reserved.

#import <Foundation/Foundation.h>
#import "SmartPoint.h"
#import "SmartRect.h"
#import "SmartCircle.h"
#import "SmartTriangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\n----------Points----------");
        SmartPoint *p1 = [[SmartPoint alloc] initWithX:24.f y:15.f title:@"Point"];
        SmartPoint *p2 = [p1 copy];
        SmartPoint *p3 = p2;
        
        NSLog(@"Points are equal: %d", [p1 isEqual:p2]);
        p2.title = @"Distant waypoint";
        NSLog(@"Points are equal: %d", [p1 isEqual:p2]);
        
        NSLog(@"\n%@\n%@\n%@", p1,p2,p3);
        
        NSLog(@"\n----------Rectangles Equal----------");
        SmartRect *rect1 = [[SmartRect alloc] initWithOrigin:p1 andWidth:50.f andHeight:30.f andName:@"Window" andDate:[NSDate date]];
        // NSLog(@"\n%@", rect1);
        SmartRect *rect2 = [[SmartRect alloc] initWithOrigin:p1 andWidth:50.f andHeight:30.f andName:@"Window" andDate:[NSDate date]];
        NSLog(@"\n%@\n\t\t%@ equal\n%@", rect1, [rect1 isEqual:rect2]?@"is":@"isn't", rect2);
        SmartRect *rect3 = [[SmartRect alloc] initWithOrigin:p2 andWidth:50.f andHeight:30.f andName:@"Window" andDate:[NSDate date]];
        NSLog(@"\n%@\n\t\t%@ equal\n%@", rect1, [rect1 isEqual:rect3]?@"is":@"isn't", rect3);
        NSLog(@"\n----------Rectangle Copy----------");
        SmartRect *rectCopy = [rect1 copy];
        NSLog(@"\n%@\n\t\t%@ equal\n%@", rect1, [rect1 isEqual:rectCopy]?@"is":@"isn't", rectCopy);
        
        NSLog(@"\n----------Circles Equal----------");
        SmartCircle *circle1 = [[SmartCircle alloc] initWithCenter:p1 andRadius:40.f andName:@"Bugai" andDate:[NSDate date]];
        //NSLog(@"\n%@", circle1);
        SmartCircle *circle2 = [[SmartCircle alloc] initWithCenter:p1 andRadius:40.f andName:@"Bugai" andDate:[NSDate date]];
        NSLog(@"\n%@\n\t\t%@ equal\n%@", circle1, [circle1 isEqual: circle2]?@"is":@"isn't", circle2);
        SmartCircle *circle3 = [[SmartCircle alloc] initWithCenter:p2 andRadius:63.f andName:@"Sphere" andDate:[NSDate date]];
        NSLog(@"\n%@\n\t\t%@ equal\n%@", circle1, [circle1 isEqual: circle3]?@"is":@"isn't", circle3);
        NSLog(@"\n----------Circle Copy----------");
        SmartCircle *circleCopy = [circle3 copy];
        NSLog(@"\n%@\n\t\t%@ equal\n%@", circle3, [circle3 isEqual:circleCopy]?@"is":@"isn't", circleCopy);
        
    }
    return 0;
}











