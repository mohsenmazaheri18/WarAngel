//
//  ALBResponder.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 4/26/14.
//
//

#import "ALBResponder.h"

@implementation ALBResponder

#pragma mark UIResponderCallbacks
+ (void)touchesBegan:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [MHTools convertUITouchesToNSString:touches], @"touches",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"touchesBeganWithEvent" JSONPARAM:jsonResult];
}

+ (void)touchesMoved:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [MHTools convertUITouchesToNSString:touches], @"touches",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"touchesMovedWithEvent" JSONPARAM:jsonResult];
}

+ (void)touchesEnded:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [MHTools convertUITouchesToNSString:touches], @"touches",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"touchesEndedWithEvent" JSONPARAM:jsonResult];
}

+ (void)touchesCancelled:(int)tag touches:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [MHTools convertUITouchesToNSString:touches], @"touches",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"touchesCancelledWithEvent" JSONPARAM:jsonResult];
}

+ (void)motionBegan:(int)tag motion:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:(int)motion], @"motion",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"motionBeganWithEvent" JSONPARAM:jsonResult];
}

+ (void)motionEnded:(int)tag motion:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:(int)motion], @"motion",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"motionEndedWithEvent" JSONPARAM:jsonResult];
}

+ (void)motionCancelled:(int)tag motion:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:(int)motion], @"motion",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"motionCancelledWithEvent" JSONPARAM:jsonResult];
}

+ (void)remoteControlReceivedWithEvent:(int)tag event:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [MHTools convertUIEventToNSString:event], @"evt",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"remoteControlReceivedWithEvent" JSONPARAM:jsonResult];
}
@end
