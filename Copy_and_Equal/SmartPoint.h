#import <Foundation/Foundation.h>

@interface SmartPoint : NSObject<NSCopying>
@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, strong) NSDate* timestamp;

+ (instancetype)pointWithX:(float)x y:(float)y;

- (instancetype)initWithX:(float)x y:(float)y;
- (instancetype)initWithX:(float)x y:(float)y title:(NSString*)title;
- (instancetype)initWithX:(float)x y:(float)y title:(NSString*)title timestamp:(NSDate*)date;

- (BOOL)isEqualToPoint:(SmartPoint*)point;
-(void)moveToX:(float)x andY:(float)y;

@end

@interface StupidPoint : SmartPoint

@end








