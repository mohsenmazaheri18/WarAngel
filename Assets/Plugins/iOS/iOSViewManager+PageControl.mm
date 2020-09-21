//
//  iOSViewManager+PageControl.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 5/17/14.
//
//

#import "iOSViewManager+PageControl.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UIPageControl"

@implementation iOSViewManager (PageControl)

@end

extern "C"
{
    int _init_pagecontrol(int tag)
	{
		if(![MHTools objectExists:tag])
        {
            ALBPageControl *ctrl = [[[ALBPageControl alloc] init] autorelease];
            
            [MHTools addreplaceObject:ctrl key:tag actualUI:ctrl];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (PAGECONTROL)");
        }
        
        return tag;
	}
	
	int _initWithFrame_pagecontrol(int tag, const char * aRect)
	{
		if(![MHTools objectExists:tag])
        {
            CGRect cgRect = [MHTools convertRectToCGRect:aRect];
            
            ALBPageControl *ctrl = [[[ALBPageControl alloc] initWithFrame:cgRect] autorelease];
            
            [MHTools addreplaceObject:ctrl key:tag actualUI:ctrl];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (SWITCH)");
        }
        
        return tag;
	}
	
	int _currentPage(int tag)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            return pc.currentPage;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	void _currentPage_set(int tag, int page)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            pc.currentPage = page;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _numberOfPages(int tag)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            return pc.numberOfPages;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	void _numberOfPages_set(int tag, int num)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            pc.numberOfPages = num;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _hidesForSinglePage(int tag)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            return pc.hidesForSinglePage;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _hidesForSinglePage_set(int tag, bool hides)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            pc.hidesForSinglePage = hides;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _pageIndicatorTintColor(int tag)
	{
		UIPageControl *pc = [MHTools getActualView:tag];
        if(pc)
        {
            return [MHTools convertUIColorToColor:pc.pageIndicatorTintColor];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _pageIndicatorTintColor_set(int tag, const char * col)
	{
		UIPageControl *pc = [MHTools getActualView:tag];
        if(pc)
        {
            pc.pageIndicatorTintColor = [MHTools convertColorToUIColor:col];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _currentPageIndicatorTintColor(int tag)
	{
		UIPageControl *pc = [MHTools getActualView:tag];
        if(pc)
        {
            return [MHTools convertUIColorToColor:pc.currentPageIndicatorTintColor];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _currentPageIndicatorTintColor_set(int tag, const char * col)
	{
		UIPageControl *pc = [MHTools getActualView:tag];
        if(pc)
        {
            pc.currentPageIndicatorTintColor = [MHTools convertColorToUIColor:col];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _defersCurrentPageDisplay(int tag)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            return pc.defersCurrentPageDisplay;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _defersCurrentPageDisplay_set(int tag, bool defer)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            pc.defersCurrentPageDisplay = defer;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _updateCurrentPageDisplay(int tag)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            [pc updateCurrentPageDisplay];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _sizeForNumberOfPages(int tag, int pageCount)
	{
		UIPageControl *pc = [MHTools getActualObject:tag];
        
        if(pc)
        {
            return [MHTools convertCGSizeToVector2:[pc sizeForNumberOfPages:pageCount]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
}