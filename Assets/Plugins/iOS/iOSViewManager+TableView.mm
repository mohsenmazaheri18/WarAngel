//
//  iOSViewManager+TableView.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 4/27/14.
//
//

#import "iOSViewManager+TableView.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UITableView"

@implementation iOSViewManager (TableView)

@end

extern "C"
{
    int _init_tableview(int tag)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableView *tableView = [[[ALBTableView alloc] init] autorelease];
            tableView.delegate = tableView;
            tableView.dataSource = tableView;
            
            [MHTools addreplaceObject:tableView key:tag actualUI:tableView];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEW)");
        }
        
        return tag;
	}
	
	int _initWithFrame_tableview(int tag, const char * aRect)
	{
		if(![MHTools objectExists:tag])
        {
            CGRect cgRect = [MHTools convertRectToCGRect:aRect];
            
            ALBTableView *tableView = [[[ALBTableView alloc] initWithFrame:cgRect] autorelease];
            tableView.delegate = tableView;
            tableView.dataSource = tableView;
            
            [MHTools addreplaceObject:tableView key:tag actualUI:tableView];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEW)");
        }
        
        return tag;
	}
	
	int _initWithFrameAndStyle_tableview(int tag, const char * frame, int style)
	{
		if(![MHTools objectExists:tag])
        {
            CGRect cgRect = [MHTools convertRectToCGRect:frame];
            
            ALBTableView *tableView = [[[ALBTableView alloc] initWithFrame:cgRect style:(UITableViewStyle)style] autorelease];
            tableView.delegate = tableView;
            tableView.dataSource = tableView;
            
            [MHTools addreplaceObject:tableView key:tag actualUI:tableView];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEW)");
        }
        
        return tag;
	}
	
	int _style_tableview(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return (int)tw.style;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return (int)UITableViewStylePlain;
	}
	
	int _numberOfRowsInSection(int tag, int section)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [tw numberOfRowsInSection:section];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	int _numberOfSections(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [tw numberOfSections];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	float _rowHeight(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return tw.rowHeight;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0.0f;
	}
	
	void _rowHeight_set(int tag, float height)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.rowHeight = height;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _seperatorStyle(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return (int)tw.separatorStyle;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return (int)UITableViewCellSeparatorStyleNone;
	}
	
	void _seperatorStyle_set(int tag, int sepStyle)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.separatorStyle = (UITableViewCellSeparatorStyle)sepStyle;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _seperatorColor(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertUIColorToColor:tw.separatorColor];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _seperatorColor_set(int tag, const char * col)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            tw.separatorColor = [MHTools convertColorToUIColor:col];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _seperatorInset(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertUIEdgeInsetToVector4:tw.separatorInset];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _seperatorInset_set(int tag, const char * inset)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            tw.separatorInset = [MHTools convertVector4ToUIEdgeInset:inset];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _dequeueReusableCellWithIdentifierForIndexPath(int tag, const char * identifier, int * indexPath, int arrayCount)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:[tw dequeueReusableCellWithIdentifier:GetStringParamOrNil(identifier) forIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount]]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	int _dequeueReusableCellWithIdentifier(int tag, const char * identifier)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:[tw dequeueReusableCellWithIdentifier:GetStringParamOrNil(identifier)]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	int _dequeueReusableHeaderFooterViewWithIdentifier(int tag, const char * identifier)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:[tw dequeueReusableHeaderFooterViewWithIdentifier:GetStringParamOrNil(identifier)]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	int _tableHeaderView(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:tw.tableHeaderView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	void _tableHeaderView_set(int tag, int vw)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.tableHeaderView = [MHTools getActualView:vw];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _tableFooterView(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:tw.tableFooterView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	void _tableFooterView_set(int tag, int vw)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.tableFooterView = [MHTools getActualView:vw];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	float _sectionHeaderHeight(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return tw.sectionHeaderHeight;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0.0f;
	}
	
	void _sectionHeaderHeight_set(int tag, float height)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.sectionHeaderHeight = height;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	float _sectionFooterHeight(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return tw.sectionFooterHeight;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0.0f;
	}
	
	void _sectionFooterHeight_set(int tag, float height)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.sectionFooterHeight = height;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _headerViewForSection(int tag, int section)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:[tw headerViewForSection:section]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	int _footerViewForSection(int tag, int section)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:[tw footerViewForSection:section]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	int _cellForRowAtIndexPath(int tag, int * indexPath, int arrayCount)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools getKeyFromActual:[tw cellForRowAtIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount]]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	const char * _indexPathForCell(int tag, int cell)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertIndexPathToJson:[tw indexPathForCell:[MHTools getActualObject:cell]]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _indexPathForRowAtPoint(int tag, const char * point)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertIndexPathToJson:[tw indexPathForRowAtPoint:[MHTools convertVector2ToCGPoint:point]]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _indexPathsForRowsInRect(int tag, const char * rect)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertIndexPathsToJson:[tw indexPathsForRowsInRect:[MHTools convertRectToCGRect:rect]]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _visibleCells(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertNSArrayToMultipleTags:[tw visibleCells]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _indexPathsForVisibleRows(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return [MHTools convertIndexPathsToJson:[tw indexPathsForVisibleRows]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	float _estimatedRowHeight(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return tw.estimatedRowHeight;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0.0f;
	}
	
	void _estimatedRowHeight_set(int tag, float height)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            tw.estimatedRowHeight = height;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	float _estimatedSectionHeaderHeight(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return tw.estimatedSectionHeaderHeight;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0.0f;
	}
	
	void _estimatedSectionHeaderHeight_set(int tag, float height)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            tw.estimatedSectionHeaderHeight = height;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	float _estimatedSectionFooterHeight(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            return tw.estimatedSectionFooterHeight;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0.0f;
	}
	
	void _estimatedSectionFooterHeight_set(int tag, float height)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            tw.estimatedSectionFooterHeight = height;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
    
	void _scrollToRowAtIndexPathAtScrollPosition(int tag, int * indexPath, int arrayCount, int scrollPosition, bool animated)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            [tw scrollToRowAtIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount] atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:animated];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _scrollToNearestSelectedRowAtScrollPosition(int tag, int scrollPosition, bool animated)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            [tw scrollToNearestSelectedRowAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:animated];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _indexPathForSelectedRow(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return [MHTools convertIndexPathToJson:[tw indexPathForSelectedRow]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _indexPathsForSelectedRows(int tag, const char * rect)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return [MHTools convertIndexPathsToJson:[tw indexPathsForSelectedRows]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _selectRowAtIndexPath(int tag, int * indexPath, int arrayCount, bool animated, int scrollPosition)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            [tw selectRowAtIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount] animated:animated scrollPosition:(UITableViewScrollPosition)scrollPosition];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _deselectRowAtIndexPath(int tag, int * indexPath, int arrayCount, bool animated)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            [tw deselectRowAtIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount] animated:animated];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _allowsSelection(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return tw.allowsSelection;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _allowsSelection_set(int tag, bool allows)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            tw.allowsSelection = allows;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _allowsMultipleSelection(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return tw.allowsMultipleSelection;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _allowsMultipleSelection_set(int tag, bool allows)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            tw.allowsMultipleSelection = allows;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _allowsSelectionDuringEditing(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return tw.allowsSelectionDuringEditing;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _allowsSelectionDuringEditing_set(int tag, bool allows)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            tw.allowsSelectionDuringEditing = allows;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _allowsMultipleSelectionDuringEditing(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return tw.allowsMultipleSelectionDuringEditing;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _allowsMultipleSelectionDuringEditing_set(int tag, bool allows)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            tw.allowsMultipleSelectionDuringEditing = allows;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _beginUpdates(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw beginUpdates];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _endUpdates(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw endUpdates];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _insertRowsAtIndexPathsWithRowAnimation(int tag, const char * indexPaths, int animation)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw insertRowsAtIndexPaths:[MHTools convertJsonToIndexPaths:indexPaths] withRowAnimation:(UITableViewRowAnimation)animation];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _deleteRowsAtIndexPathsWithRowAnimation(int tag, const char * indexPaths, int animation)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw deleteRowsAtIndexPaths:[MHTools convertJsonToIndexPaths:indexPaths] withRowAnimation:(UITableViewRowAnimation)animation];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _moveRowAtIndexPathToIndexPath(int tag, int * indexPath, int arrayCount, int * newIndexPath, int newArrayCount)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw moveRowAtIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount] toIndexPath:[MHTools convertJsonToIndexPath:newIndexPath num:newArrayCount]];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _insertSectionsWithRowAnimation(int tag, int * sections, int arrayCount, int animation)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw insertSections:[MHTools convertArrayToNSIndexSet:sections num:arrayCount] withRowAnimation:(UITableViewRowAnimation)animation];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _deleteSectionsWithRowAnimation(int tag, int * sections, int arrayCount, int animation)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw deleteSections:[MHTools convertArrayToNSIndexSet:sections num:arrayCount] withRowAnimation:(UITableViewRowAnimation)animation];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _moveSectionToSection(int tag, int section, int newSection)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw moveSection:section toSection:newSection];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _reloadData(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw reloadData];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _reloadRowsAtIndexPathsWithRowAnimation(int tag, const char * indexPaths, int animation)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw reloadRowsAtIndexPaths:[MHTools convertJsonToIndexPaths:indexPaths] withRowAnimation:(UITableViewRowAnimation)animation];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _reloadSectionsWithRowAnimation(int tag, int * sections, int arrayCount, int animation)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw reloadSections:[MHTools convertArrayToNSIndexSet:sections num:arrayCount] withRowAnimation:(UITableViewRowAnimation)animation];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _reloadSectionIndexTitles(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            [tw reloadSectionIndexTitles];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _rectForSection(int tag, int section)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return [MHTools convertCGRectToRect:[tw rectForSection:section]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _rectForRowAtIndexPath(int tag, int * indexPath, int arrayCount)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return [MHTools convertCGRectToRect:[tw rectForRowAtIndexPath:[MHTools convertJsonToIndexPath:indexPath num:arrayCount]]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _rectForFooterInSection(int tag, int section)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return [MHTools convertCGRectToRect:[tw rectForFooterInSection:section]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	const char * _rectForHeaderInSection(int tag, int section)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        if(tw)
        {
            
            return [MHTools convertCGRectToRect:[tw rectForHeaderInSection:section]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	int _sectionIndexMinimumDisplayRowCount(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return tw.sectionIndexMinimumDisplayRowCount;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	void _sectionIndexMinimumDisplayRowCount_set(int tag, int count)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.sectionIndexMinimumDisplayRowCount = count;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _sectionIndexColor(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools convertUIColorToColor:tw.sectionIndexColor];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _sectionIndexColor_set(int tag, const char * col)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.sectionIndexColor = [MHTools convertColorToUIColor:col];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _sectionIndexBackgroundColor(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools convertUIColorToColor:tw.sectionIndexBackgroundColor];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _sectionIndexBackgroundColor_set(int tag, const char * col)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.sectionIndexBackgroundColor = [MHTools convertColorToUIColor:col];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _sectionIndexTrackingBackgroundColor(int tag)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            return [MHTools convertUIColorToColor:tw.sectionIndexTrackingBackgroundColor];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _sectionIndexTrackingBackgroundColor_set(int tag, const char * col)
	{
		UITableView *tw = [MHTools getActualObject:tag];
        
        if(tw)
        {
            tw.sectionIndexTrackingBackgroundColor = [MHTools convertColorToUIColor:col];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
}