

#import <UIKit/UIKit.h>
@class FTZoomScrollView;
@interface FTThreePageScrollView : UIView<UIScrollViewDelegate>{
    UIScrollView *scrollView;
    
    FTZoomScrollView *prevPageView;
    FTZoomScrollView *currentPageView;
    FTZoomScrollView *nextPageView;
    NSInteger currentPage;
    NSInteger numberOfPages;

    BOOL checkDouble;
    
    
    
}
@property (nonatomic, retain)UIScrollView *scrollView;
@property (nonatomic, retain)NSMutableDictionary *dictionar;
-(void)setWithPageNumber:(NSInteger)pageNumber;
-(void)printDictionar;
@end
