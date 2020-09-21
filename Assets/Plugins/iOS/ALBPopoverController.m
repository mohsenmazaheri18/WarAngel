//
//  ALBPopoverController.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 9/19/13.
//
//

#import "ALBPopoverController.h"

@implementation ALBPopoverController

#pragma mark UIPopoverControllerDelegate
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    int tag = [MHTools getKeyFromActual:self];
    int pController = [MHTools getKeyFromActual:popoverController];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pController], @"popoverController",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"popoverControllerShouldDismissPopover" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    int tag = [MHTools getKeyFromActual:self];
    int pController = [MHTools getKeyFromActual:popoverController];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pController], @"popoverController",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"popoverControllerDidDismissPopover" JSONPARAM:jsonResult];
}
@end
