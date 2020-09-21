//
//  ALBTableView.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 4/26/14.
//
//

#import "ALBTableView.h"

@implementation ALBTableView

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

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidScroll" JSONPARAM:jsonResult];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewWillBeginDragging" JSONPARAM:jsonResult];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    NSString *vel = GetStringParamOrNil([MHTools convertCGPointToVector2:velocity]);
    NSString *target = GetStringParamOrNil([MHTools convertCGPointToVector2:*targetContentOffset]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          vel, @"velocity",
                          target, @"targetContentOffset",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewWillEndDragging" JSONPARAM:jsonResult];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    bool dec = decelerate;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          [NSNumber numberWithBool:dec], @"decelerate",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidEndDragging" JSONPARAM:jsonResult];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewShouldScrollToTop" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidScrollToTop" JSONPARAM:jsonResult];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewWillBeginDecelerating" JSONPARAM:jsonResult];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidEndDecelerating" JSONPARAM:jsonResult];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    if(![MHTools actualObjectExistsByObject:view])
        return;
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    int vw = [MHTools getKeyFromActual:view];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          [NSNumber numberWithInt:vw], @"view",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewWillBeginZooming" JSONPARAM:jsonResult];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    if(![MHTools actualObjectExistsByObject:view])
        return;
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    int vw = [MHTools getKeyFromActual:view];
    float scl = scale;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          [NSNumber numberWithInt:vw], @"view",
                          [NSNumber numberWithFloat:scl], @"scale",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidEndZooming" JSONPARAM:jsonResult];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidZoom" JSONPARAM:jsonResult];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"scrollViewDidEndScrollingAnimation" JSONPARAM:jsonResult];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    int tag = [MHTools getKeyFromActual:self];
    int sView = [MHTools getKeyFromActual:scrollView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:sView], @"scrollView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"viewForZoomingInScrollView" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    int viewTag = [result intValue];
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return [MHTools getActualView:viewTag];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewHeightForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewEstimatedHeightForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqual: @"NULL"])
        return UITableViewAutomaticDimension;
    return [result floatValue];
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewIndentationLevelForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result intValue];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int cellView = [MHTools getKeyFromActual:cell];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:cellView], @"cell",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewWillDisplayCellForRowAtIndexPath" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewAccessoryButtonTappedForRowWithIndexPath" JSONPARAM:jsonResult];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewWillSelectRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    
    return [MHTools convertJsonToIndexPath_stringarray:[result objectFromJSONString]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidSelectRowAtIndexPath" JSONPARAM:jsonResult];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewWillDeselectRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    
    return [MHTools convertJsonToIndexPath_stringarray:[result objectFromJSONString]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidDeselectRowAtIndexPath" JSONPARAM:jsonResult];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewViewForHeaderInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    int viewTag = [result intValue];
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return [MHTools getActualView:viewTag];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewViewForFooterInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    int viewTag = [result intValue];
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return [MHTools getActualView:viewTag];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewHeightForHeaderInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewEstimatedHeightForHeaderInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewHeightForFooterInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewEstimatedHeightForFooterInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int vw = [MHTools getKeyFromActual:view];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:vw], @"view",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewWillDisplayHeaderViewForSection" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int vw = [MHTools getKeyFromActual:view];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:vw], @"view",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewWillDisplayFooterViewForSection" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewWillBeginEditingRowAtIndexPath" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidEndEditingRowAtIndexPath" JSONPARAM:jsonResult];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewEditingStyleForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return (UITableViewCellEditingStyle)[result intValue];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return result;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewShouldIndentWhileEditingRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *sPath = [MHTools convertIndexPathToNSString:sourceIndexPath];
    NSString *pPath = [MHTools convertIndexPathToNSString:proposedDestinationIndexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          sPath, @"sourceIndexPath",
                          pPath, @"proposedDestinationIndexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    
    return [MHTools convertJsonToIndexPath_stringarray:[result objectFromJSONString]];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int cellView = [MHTools getKeyFromActual:cell];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:cellView], @"cell",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidEndDisplayingCellForRowAtIndexPath" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int vw = [MHTools getKeyFromActual:view];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:vw], @"view",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidEndDisplayingHeaderViewForSection" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int vw = [MHTools getKeyFromActual:view];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:vw], @"view",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidEndDisplayingFooterViewForSection" JSONPARAM:jsonResult];
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewShouldShowMenuForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewShouldHighlightRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidHighlightRowAtIndexPath" JSONPARAM:jsonResult];
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewDidUnhighlightRowAtIndexPath" JSONPARAM:jsonResult];
}

#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewCellForRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    int viewTag = [result intValue];
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return [MHTools getActualView:viewTag];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"numberOfSectionsInTableView" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result intValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewNumberOfRowsInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result intValue];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"sectionIndexTitlesForTableView" JSONPARAM:jsonResult];
    
    NSArray *result =  [MHTools convertArrayToNSArray_string:[[iOSViewManager sharedManager] _result]];
    [iOSViewManager sharedManager]._result = "NULL";
    
    return result;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int idx = (int)index;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          title, @"title",
                          [NSNumber numberWithInt:idx], @"index",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewSectionForSectionIndexTitleAtIndex" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result intValue];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewTitleForFooterInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return result;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int sect = (int)section;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:sect], @"section",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewTitleForHeaderInSection" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return result;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    int style = (int)editingStyle;
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          [NSNumber numberWithInt:style], @"editingStyle",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewCommitEditingStyleForRowAtIndexPath" JSONPARAM:jsonResult];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewCanEditRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *iPath = [MHTools convertIndexPathToNSString:indexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          iPath, @"indexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewCanMoveRowAtIndexPath" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    int tag = [MHTools getKeyFromActual:self];
    int tView = [MHTools getKeyFromActual:tableView];
    NSString *fromPath = [MHTools convertIndexPathToNSString:fromIndexPath];
    NSString *toPath = [MHTools convertIndexPathToNSString:toIndexPath];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tView], @"tableView",
                          fromPath, @"fromIndexPath",
                          toPath, @"toIndexPath",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"tableViewMoveRowAtIndexPathToIndexPath" JSONPARAM:jsonResult];
}
@end
