//
//  ALBResponder.h
//  Unity-iPhone
//
//  Created by Patrick Antoine on 4/26/14.
//
//

#import <Foundation/Foundation.h>
#import "MHTools.h"

@interface ALBResponder : UIResponder

+ (void)touchesBegan:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event;
+ (void)touchesMoved:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event;
+ (void)touchesEnded:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event;
+ (void)touchesCancelled:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event;
+ (void)motionBegan:(int)tag motion:(UIEventSubtype)motion withEvent:(UIEvent *)event;
+ (void)motionEnded:(int)tag motion:(UIEventSubtype)motion withEvent:(UIEvent *)event;
+ (void)motionCancelled:(int)tag motion:(UIEventSubtype)motion withEvent:(UIEvent *)event;
+ (void)remoteControlReceivedWithEvent:(int)tag event:(UIEvent *)event;

@end
