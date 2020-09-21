//
//  ALBAlertView.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 9/12/13.
//
//

#import "ALBAlertView.h"

@implementation ALBAlertView

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    int bIndex = buttonIndex;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          [NSNumber numberWithInt:bIndex], @"buttonIndex",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"alertViewClickedButtonAtIndex" JSONPARAM:jsonResult];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    int bIndex = buttonIndex;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          [NSNumber numberWithInt:bIndex], @"buttonIndex",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"alertViewDidDismissWithButtonIndex" JSONPARAM:jsonResult];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    int bIndex = buttonIndex;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          [NSNumber numberWithInt:bIndex], @"buttonIndex",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"alertViewWillDismissWithButtonIndex" JSONPARAM:jsonResult];
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"alertViewCancel" JSONPARAM:jsonResult];
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"alertViewShouldEnableFirstOtherButton" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"didPresentAlertView" JSONPARAM:jsonResult];
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    int tag = [MHTools getKeyFromActual:alertView];
    int aView = [MHTools getKeyFromActual:alertView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:aView], @"alertView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"willPresentAlertView" JSONPARAM:jsonResult];
}

#pragma mark UIResponderCallbacks
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesBeganIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesBegan:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesMovedIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesMoved:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesEndedIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesEnded:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesCancelledIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesCancelled:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesCancelled:touches withEvent:event];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [ALBResponder motionBegan:[MHTools getKeyFromActual:self] motion:motion withEvent:event];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [ALBResponder motionEnded:[MHTools getKeyFromActual:self] motion:motion withEvent:event];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [ALBResponder motionCancelled:[MHTools getKeyFromActual:self] motion:motion withEvent:event];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    [ALBResponder remoteControlReceivedWithEvent:[MHTools getKeyFromActual:self] event:event];
}

#pragma mark BaseCallbacks
- (void)animationDidStart:(NSString *)animationID context:(void *)context
{
    [ALBView animationDidStart:[MHTools getKeyFromActual:self] animationID:animationID context:context];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [ALBView animationDidStop:[MHTools getKeyFromActual:self] animationID:animationID finished:finished context:context];
}

- (void)didAddSubview:(UIView *)subview
{
    if(![MHTools actualObjectExistsByObject:subview])
        return;
    [ALBView didAddSubview:[MHTools getKeyFromActual:self] subView:subview];
}

- (void)willRemoveSubview:(UIView *)subview
{
    if(![MHTools actualObjectExistsByObject:subview])
        return;
    [ALBView willRemoveSubview:[MHTools getKeyFromActual:self] subView:subview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if(![MHTools actualObjectExistsByObject:newSuperview])
        return;
    [ALBView willMoveToSuperview:[MHTools getKeyFromActual:self] superView:newSuperview];
}

- (void)didMoveToSuperview
{
    [ALBView didMoveToSuperview:[MHTools getKeyFromActual:self]];
    
}
@end
